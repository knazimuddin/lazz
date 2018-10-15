package com.lazz.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lazz.service.InvoiceService;
import com.lazz.service.ProductService;
import com.lazz.service.domain.Invoice;
import com.lazz.service.domain.Products;
import com.lazz.service.domain.Users;
import com.lazz.ui.model.InvoiceModel;
import com.lazz.ui.model.ProductsModel;
import com.lazz.utils.AppConstants;

@Controller
@RequestMapping("/admin/invoice")
public class AdminInvoiceController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private InvoiceService invoiceService;
	
	@RequestMapping(value = { "/place-invoice" }, method = RequestMethod.GET)
    public String guiDislayProducts(ModelMap model, HttpServletRequest request) {
		String viewName = "index";
		HttpSession session = request.getSession(true);
		Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
		if( user != null ) {
			List<Products> productsList = productService.
					getAllProductsForUsrGroup(user.getUserGroups().getUsrGrpId().toString());
			List<ProductsModel> productModelList = new ArrayList<ProductsModel>(0);
			if( productsList != null && productsList.size() > 0 ) {
				for(Products prdLoop : productsList  ) {
					productModelList.add(new ProductsModel().convertDomainToModel(prdLoop));
				}
			}
			viewName = "admin-create-invoice";
			model.addAttribute("productsList",productModelList);
	 		model.addAttribute("productmodel",new ProductsModel());
		}
        return viewName;
    }
	
	@RequestMapping(value = { "/invoices" }, method = RequestMethod.GET)
	public String guiInvoices(ModelMap model, HttpServletRequest request) {
		String viewName = "index";
		List<InvoiceModel> invoiceModelList = new ArrayList<InvoiceModel>(0);
		HttpSession session = request.getSession(true);
		Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
		if( user != null ) {
			List<Invoice> invoiceList = invoiceService.getInvoicesForLoggedInUser(user);
			if( invoiceList != null && invoiceList.size() > 0 ) {
				for(Invoice invoiceLoop :  invoiceList ) {
					invoiceModelList.add(new InvoiceModel().convertDomainToModel(invoiceLoop));
				}
			}
			viewName = "admin-invoices";
		} 
		model.addAttribute("invoiceModelList",invoiceModelList);
		return viewName;
	}
	
	@RequestMapping(value = { "/invoices-edit/{invcId}" }, method = RequestMethod.POST)
	public String invoiceEdit(@PathVariable(value = "invcId") String invcId, 
			ModelMap model, HttpServletRequest request) {
		String viewName = "index";
		List<InvoiceModel> invoiceModelList = new ArrayList<InvoiceModel>(0);
		HttpSession session = request.getSession(true);
		Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
		if( user != null ) {
			List<Invoice> invoiceList = invoiceService.getInvoicesForLoggedInUser(user);
			if( invoiceList != null && invoiceList.size() > 0 ) {
				for(Invoice invoiceLoop :  invoiceList ) {
					InvoiceModel invoiceModelTemp = InvoiceModel.convertDomainToModel(invoiceLoop);
					invoiceModelList.add(invoiceModelTemp);
					if( invoiceLoop.getInvcId().intValue() == Integer.valueOf(invcId).intValue() ) {
						invoiceModelTemp.setEditFlag("Y");
					}
				}
			}
			viewName = "admin-invoices";
		} 
		model.addAttribute("invoiceModelList",invoiceModelList);
		return viewName;
	}
	
	@RequestMapping(value = { "/invoices-update" }, method = RequestMethod.POST)
	public ModelAndView invoiceEdit(@ModelAttribute("invocieslist")List<InvoiceModel> invoiceModelList, 
			ModelMap model, HttpServletRequest request) {
		String viewName = "index";
		HttpSession session = request.getSession(true);
		Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
		if( user != null ) {
			List<InvoiceModel> invoiceModelEditList = new ArrayList<InvoiceModel>(0);
			List<String> invoiceIds = new ArrayList<String>();
			if( invoiceModelList != null && invoiceModelList.size() > 0 ) {
				for( InvoiceModel invoiceModelLoop : invoiceModelList ) {
					if( "Y".equals(invoiceModelLoop.getEditFlag()) ) {
						invoiceModelEditList.add(invoiceModelLoop);
						invoiceIds.add(invoiceModelLoop.getInvcId().toString());
					}
				}
				
				if(invoiceModelEditList.size() > 0  ) {
					List<Invoice> invoiceListToUpdate = invoiceService.getInvoicesForIds(invoiceIds);
					for( InvoiceModel invoiceModel :  invoiceModelEditList) {
						for( Invoice invoiceToUpdate : invoiceListToUpdate  ) {
							if( invoiceModel.getInvcId().intValue() == invoiceToUpdate.getInvcId().intValue() ) {
								invoiceToUpdate.setInvcStage(invoiceModel.getInvcStage());
								invoiceToUpdate.setInvcUptdDt(new Date());
								if( AppConstants.INV_STAGE_PREPARING.equals(invoiceModel.getInvcStage()) ) {
									invoiceToUpdate.setInvcAccptDt(new Date());
									invoiceToUpdate.setInvcAccptBy(user);
								}
								break;
							}
						}
					}
					invoiceService.saveOrUpdateInvoices(invoiceListToUpdate);
				}
			}
			viewName = "admin-invoices";
			return new ModelAndView("redirect:/"+viewName);
		}
		
		return new ModelAndView("redirect:/"+viewName);
	}
}
