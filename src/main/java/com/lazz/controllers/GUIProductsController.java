package com.lazz.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lazz.service.ProductService;
import com.lazz.service.UsersService;
import com.lazz.service.domain.Invoice;
import com.lazz.service.domain.InvoiceDetails;
import com.lazz.service.domain.ProdCfg;
import com.lazz.service.domain.Products;
import com.lazz.service.domain.Users;
import com.lazz.ui.model.AjaxResponseModel;
import com.lazz.ui.model.CartWrapper;
import com.lazz.ui.model.ProductsModel;
import com.lazz.utils.AppConstants;
import com.lazz.utils.StringUtils;
import com.lazz.utils.ValueO;

@Controller
@RequestMapping("/product")
public class GUIProductsController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value = { "/gui-display-products" }, method = RequestMethod.GET)
    public String guiDislayProducts(ModelMap model) {
		List<Products> productsList = productService.getAllProductsForGUIUsers();
		List<ProductsModel> productModelList = new ArrayList<ProductsModel>(0);
		if( productsList != null && productsList.size() > 0 ) {
			for(Products prdLoop : productsList  ) {
				productModelList.add(new ProductsModel().convertDomainToModel(prdLoop));
			}
		}
		model.addAttribute("productsList",productModelList);
 		model.addAttribute("productmodel",new ProductsModel());
        return "product";
    }
	
	@RequestMapping(value="/add-to-cart", method=RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public AjaxResponseModel addToCart(@RequestBody ProductsModel productsModel, 
    	      HttpServletRequest request) {
		AjaxResponseModel ajaxResponseModel = new AjaxResponseModel();
		Products product = productService.getProduct(productsModel.getPrdId().toString());
		ProductsModel newProductsModel = new ProductsModel().convertDomainToModel(product);
		HttpSession session = request.getSession(true);
		List<ProductsModel> prodList = (ArrayList<ProductsModel>)session.getAttribute(AppConstants.PRD_CART_LIST);
		if( prodList == null || prodList.size() == 0 ) {
			prodList = new ArrayList<ProductsModel>();
			session.setAttribute(AppConstants.PRD_CART_LIST, prodList);
		}
		if( !prodList.contains(newProductsModel) ) {
			prodList.add(newProductsModel);
		}
		ajaxResponseModel.setStatusCode(AppConstants.VALID_CODE);
		ajaxResponseModel.setStatusMessage(AppConstants.VALID);
		ajaxResponseModel.setProductCount(String.valueOf(prodList.size()));
		
		float totalAmt = 0.0F;
		for( ProductsModel productModelLoop :  prodList) {
			totalAmt += productModelLoop.getPrdRetailPrice()*Float.valueOf(productModelLoop.getCount());
		}
		ajaxResponseModel.setProductsModelList(prodList);
		ajaxResponseModel.setTotalAmount(totalAmt);
		
		return ajaxResponseModel;
	}
	
	//refresh-cart
	@RequestMapping(value="/refresh-cart", method=RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public AjaxResponseModel refreshCart(@RequestBody ProductsModel productsModel, 
    	      HttpServletRequest request) {
		AjaxResponseModel ajaxResponseModel = new AjaxResponseModel();
		HttpSession session = request.getSession(true);
		List<ProductsModel> prodList = (ArrayList<ProductsModel>)session.getAttribute(AppConstants.PRD_CART_LIST);
		ajaxResponseModel.setStatusCode(AppConstants.VALID_CODE);
		ajaxResponseModel.setStatusMessage(AppConstants.VALID);
		ajaxResponseModel.setProductCount(prodList != null && !prodList.isEmpty() ? String.valueOf(prodList.size()) : "0");
		
		float totalAmt = 0.0F;
		if( prodList != null && !prodList.isEmpty()  ) {
			for( ProductsModel productModelLoop :  prodList) {
				totalAmt += productModelLoop.getPrdRetailPrice()*Float.valueOf(productModelLoop.getCount());
			}
		}
		ajaxResponseModel.setProductsModelList(prodList);
		ajaxResponseModel.setTotalAmount(totalAmt);
		
		return ajaxResponseModel;
	}
	
	@RequestMapping(value = { "/view-cart" }, method = RequestMethod.GET)
    public String guiDislayCart(ModelMap model, 
    		HttpServletRequest request) {
		List<ValueO> paymentOptions = new ArrayList<ValueO>(0);
		List<ValueO> shippingAddressList = new ArrayList<ValueO>(0);
		CartWrapper cart = new CartWrapper();
		float subTotal = 0.0F;
		float totalAmt = 0.0F;
		
		HttpSession session = request.getSession(true);
		List<ProductsModel> productsModelList = (ArrayList<ProductsModel>)session.getAttribute(AppConstants.PRD_CART_LIST);
		if( productsModelList != null && productsModelList.size() > 0  ) {
			for( ProductsModel productLoop :  productsModelList) {
				totalAmt += productLoop.getPrdRetailPrice()*Float.valueOf(productLoop.getCount());
				subTotal += productLoop.getPrdRetailPrice()*Float.valueOf(productLoop.getCount());
			}
		}
		cart.setTotal(totalAmt);
		cart.setSubTotal(subTotal);
		Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
		if( user != null ) {
			ValueO valueO = new ValueO();
			valueO.setKey("1");
			valueO.setValue(StringUtils.prepareAddress(user));
			shippingAddressList.add(valueO);
			cart.setSelectedAddress("1");
		}
		ValueO valueO = new ValueO();
		valueO.setKey("1");
		valueO.setValue(AppConstants.PAYMENT_CASH_ON_DELIVERY);
		paymentOptions.add(valueO);
		cart.setProducts(productsModelList);
		cart.setPaymentOptionSelected("NONE");
		
		model.addAttribute("cartwrapper",cart);
		model.addAttribute("paymentOptions", paymentOptions);
		model.addAttribute("shippingAddressList", shippingAddressList);
        return "cart";
    }
	
	@RequestMapping(value = { "/deleteprdfromcart/{prdId}" }, method = RequestMethod.POST)
	public String guiDeleteProductFromCart(ModelMap model, 
    		HttpServletRequest request, @PathVariable(value = "prdId") String prdId, 
    		@ModelAttribute("cartwrappermodel")CartWrapper cart) {
		List<ValueO> paymentOptions = new ArrayList<ValueO>(0);
		List<ValueO> shippingAddressList = new ArrayList<ValueO>(0);
		float subTotal = 0.0F;
		float totalAmt = 0.0F;
		
		HttpSession session = request.getSession(true);
		List<ProductsModel> productsModelList = (ArrayList<ProductsModel>)session.getAttribute(AppConstants.PRD_CART_LIST);
		Iterator<ProductsModel> productItr = productsModelList.iterator();
		while(productItr.hasNext()) {
			ProductsModel productsLoop = productItr.next();
			if( productsLoop.getPrdId().toString().equals(prdId) ) {
				productItr.remove();
				break;
			}
		}
		session.setAttribute(AppConstants.PRD_CART_LIST, productsModelList);
		
		for( ProductsModel productLoop :  productsModelList) {
			totalAmt += productLoop.getPrdRetailPrice()*Float.valueOf(productLoop.getCount());
			subTotal += productLoop.getPrdRetailPrice()*Float.valueOf(productLoop.getCount());
		}
		cart.setTotal(totalAmt);
		cart.setSubTotal(subTotal);
		Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
		if( user != null ) {
			ValueO valueO = new ValueO();
			valueO.setKey("1");
			valueO.setValue(StringUtils.prepareAddress(user));
			shippingAddressList.add(valueO);
		}
		ValueO valueO = new ValueO();
		valueO.setKey("1");
		valueO.setValue(AppConstants.PAYMENT_CASH_ON_DELIVERY);
		paymentOptions.add(valueO);
		cart.setProducts(productsModelList);
		model.addAttribute("paymentOptions", paymentOptions);
		model.addAttribute("shippingAddressList", shippingAddressList);
		model.addAttribute("cartwrapper",cart);
        return "cart";
	}
	
	@RequestMapping(value = { "/dec-prd-count/{prdId}" }, method = RequestMethod.POST)
	public String guiDecrementProductCount(ModelMap model, 
    		HttpServletRequest request, @PathVariable(value = "prdId") String prdId, 
    		@ModelAttribute("cartwrappermodel")CartWrapper cart) {
		List<ValueO> paymentOptions = new ArrayList<ValueO>(0);
		List<ValueO> shippingAddressList = new ArrayList<ValueO>(0);
		float subTotal = 0.0F;
		float totalAmt = 0.0F;
		
		HttpSession session = request.getSession(true);
		List<ProductsModel> productsModelList = (ArrayList<ProductsModel>)session.getAttribute(AppConstants.PRD_CART_LIST);
		Iterator<ProductsModel> productItr = productsModelList.iterator();
		while(productItr.hasNext()) {
			ProductsModel productsLoop = productItr.next();
			if( productsLoop.getPrdId().toString().equals(prdId) ) {
				int count = Integer.parseInt(productsLoop.getCount());
				if( count >= 2 ) {
					productsLoop.setCount(String.valueOf(count-1));
				}
				break;
			}
		}
		session.setAttribute(AppConstants.PRD_CART_LIST, productsModelList);
		
		for( ProductsModel prdModel :  productsModelList) {
			totalAmt += prdModel.getPrdRetailPrice()*Float.valueOf(prdModel.getCount());
			subTotal += prdModel.getPrdRetailPrice()*Float.valueOf(prdModel.getCount());
		}
		cart.setTotal(totalAmt);
		cart.setSubTotal(subTotal);
		Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
		if( user != null ) {
			ValueO valueO = new ValueO();
			valueO.setKey("1");
			valueO.setValue(StringUtils.prepareAddress(user));
			shippingAddressList.add(valueO);
		} else {
			
		}
		ValueO valueO = new ValueO();
		valueO.setKey("1");
		valueO.setValue(AppConstants.PAYMENT_CASH_ON_DELIVERY);
		paymentOptions.add(valueO);
		cart.setProducts(productsModelList);
		model.addAttribute("paymentOptions", paymentOptions);
		model.addAttribute("shippingAddressList", shippingAddressList);
		model.addAttribute("cartwrapper",cart);
        return "cart";
	}
	
	@RequestMapping(value = { "/inc-prd-count/{prdId}" }, method = RequestMethod.POST)
	public String guiIncrementProductCount(ModelMap model, 
    		HttpServletRequest request, @PathVariable(value = "prdId") String prdId, 
    		@ModelAttribute("cartwrappermodel")CartWrapper cart) {
		List<ValueO> paymentOptions = new ArrayList<ValueO>(0);
		List<ValueO> shippingAddressList = new ArrayList<ValueO>(0);
		float subTotal = 0.0F;
		float totalAmt = 0.0F;
		
		HttpSession session = request.getSession(true);
		List<ProductsModel> productsModelList = (ArrayList<ProductsModel>)session.getAttribute(AppConstants.PRD_CART_LIST);
		Iterator<ProductsModel> productItr = productsModelList.iterator();
		while(productItr.hasNext()) {
			ProductsModel productsLoop = productItr.next();
			if( productsLoop.getPrdId().toString().equals(prdId) ) {
				int count = Integer.parseInt(productsLoop.getCount());
				productsLoop.setCount(String.valueOf(count+1));
				break;
			}
		}
		session.setAttribute(AppConstants.PRD_CART_LIST, productsModelList);
		
		for( ProductsModel prdModel :  productsModelList) {
			totalAmt += prdModel.getPrdRetailPrice()*Float.valueOf(prdModel.getCount());
			subTotal += prdModel.getPrdRetailPrice()*Float.valueOf(prdModel.getCount());
		}
		cart.setTotal(totalAmt);
		cart.setSubTotal(subTotal);
		Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
		if( user != null ) {
			ValueO valueO = new ValueO();
			valueO.setKey("1");
			valueO.setValue(StringUtils.prepareAddress(user));
			shippingAddressList.add(valueO);
		}
		ValueO valueO = new ValueO();
		valueO.setKey("1");
		valueO.setValue(AppConstants.PAYMENT_CASH_ON_DELIVERY);
		paymentOptions.add(valueO);
		cart.setProducts(productsModelList);
		model.addAttribute("paymentOptions", paymentOptions);
		model.addAttribute("shippingAddressList", shippingAddressList);
		model.addAttribute("cartwrapper",cart);
        return "cart";
	}
	
	@RequestMapping(value = { "/checkout" }, method = RequestMethod.POST)
	public String guiCheckout(ModelMap model, 
    		HttpServletRequest request, 
    		@ModelAttribute("cartwrapper")CartWrapper cart) {
		HttpSession session = request.getSession(true);
		Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
		if( user != null && cart.getTotal() > 0) {
			Users loggedInUser = usersService.getUserById(user.getUsrId().toString());
			Date invoiceDate = new Date();
			Invoice invoice = new Invoice();
			invoice.setInvcDt(invoiceDate);
			invoice.setUsrId(loggedInUser);
			invoice.setInvcStage(AppConstants.INV_STAGE_ENTRY);
			invoice.setInvcShipmentAdd1(user.getUsrdShpAddr1());
			invoice.setInvcShipmentAdd2(user.getUsrdShpAddr2());
			invoice.setInvcShipmentPostCode(user.getUsrdPostCode());
			invoice.setInvcRecptMob(user.getUsrdMob());
			invoice.setInvcRecptEmail(user.getUsrdEmail());
			invoice.setInvcCrtdDt(invoiceDate);
			invoice.setInvcUptdDt(invoiceDate);
			invoice.setInvcAmt(cart.getTotal());
			invoice.setInvcDis(0F);
			invoice.setInvSubAmt(cart.getSubTotal());
			try {
				invoice.setPaymentType(Integer.valueOf(cart.getPaymentOptionSelected()));
			}catch(Exception e) {
				System.out.println(" >> This exception is due to missing validation in the UI to ensure payment and shipment option selected before checkout... ");
			}
			
			//set invoice details here 
			if( cart.getProducts() != null && cart.getProducts().size()>0 ) {
				for( ProductsModel prdModel :  cart.getProducts()) {
					ProdCfg prdCfg = productService
							.getProdCfgs(prdModel.getPrdId().toString(), AppConstants.USER_TYPE_USER);
					InvoiceDetails invoiceDetails = new InvoiceDetails();
					invoiceDetails.setCount(Integer.valueOf(prdModel.getCount()));
					invoiceDetails.setInvoice(invoice);
					invoiceDetails.setProdCfg(prdCfg);
					invoiceDetails.setProductAmount(prdModel.getQuantityTotal());
					invoice.getInvoiceDetailses().add(invoiceDetails);
				}
			}
			productService.saveOrUpdateInvoice(invoice);
			session.removeAttribute(AppConstants.PRD_CART_LIST);
		} else {
			//login first
		}
		return "index";
	}

}
