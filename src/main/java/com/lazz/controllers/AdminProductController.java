package com.lazz.controllers;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lazz.service.ProductService;
import com.lazz.service.UsersService;
import com.lazz.service.domain.ProdCfg;
import com.lazz.service.domain.Products;
import com.lazz.ui.model.ProdCfgModel;
import com.lazz.ui.model.ProductsModel;
import com.lazz.ui.model.UserGroupsModel;
import com.lazz.utils.AppConstants;
import com.lazz.utils.StringUtils;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private ServletContext servletContext; 
	
	@RequestMapping(value = { "/product-view" }, method = RequestMethod.GET)
    public String displayProducts(ModelMap model) {
		List<Products> productsList = productService.getAllProducts();
		model.addAttribute("productsList",productsList);
 		model.addAttribute("productmodel",new ProductsModel());
        return "products-create";
    }
	
	@RequestMapping(value = { "/createproduct" }, method = RequestMethod.POST)
    public String createProduct(@ModelAttribute("productmodel")ProductsModel productsModel, 
  	      BindingResult result, ModelMap model) {
		Products products = productsModel.convertModelToDomain();
		if( !StringUtils.isEmpty(products.getPrdSkuNum()) && 
				productService.isSKUUnique(products.getPrdSkuNum()) ) {
			if( productsModel.getPrdImage() != null && !productsModel.getPrdImage().isEmpty() ) {
				try {
					productsModel.getPrdImage()
						.transferTo(new File(AppConstants.PRD_IMG_UPLOAD_DIR + 
							StringUtils.prependFileNameWithTimeStamp(
									productsModel.getPrdImage().getOriginalFilename())));
				} catch (IOException e) {
					e.printStackTrace();
				}
				products.setPrdImgPath(productsModel.getPrdImage().getOriginalFilename());
			}
			products.setPrdCrtdDt(new Date());
			products.setPrdUptdDt(new Date());
			productService.saveOrUpdateProduct(products);
			model.addAttribute("productmodel",new ProductsModel());
		} else {
			//TODO: validation message that the sku is non unique
			model.addAttribute("productmodel",productsModel);
		}
		List<Products> productsList = productService.getAllProducts();
		model.addAttribute("productsList",productsList);
        return "products-create";
    }
	
	@RequestMapping(value = { "/updateproductview/{prdId}" }, method = RequestMethod.GET)
 	public String displayProductUpdateView(@PathVariable(value = "prdId") String prdId, ModelMap model) {
		
		List<Products> productsList = productService.getAllProducts();
		model.addAttribute("productsList",productsList);
 		model.addAttribute("productmodel", productService.getProduct(prdId));
 		
 		return "products-update";
 	}
	
	@ResponseBody
	@RequestMapping(value = "/PRD_IMG/{prdId}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] renderProductImage(@PathVariable(value = "prdId") String prdId, 
			HttpServletResponse response) throws IOException {
		byte[] imageData = null;
		try {
			Products product = productService.getProduct(prdId);
			String imageSource = "noimage.jpg";//TODO : get this image from Rais
			if( !StringUtils.isEmpty(product.getPrdImgPath()) ) {
				imageSource = AppConstants.PRD_IMG_UPLOAD_DIR + product.getPrdImgPath();
			} 
			InputStream in =  servletContext.getResourceAsStream(imageSource);
		    imageData = IOUtils.toByteArray(in);
		}catch(Exception e) {
			System.out.println(">>>> NAzim Exception from renderProductImage method. For now ignore this till GUI is fixed>>>>>>>>>");
		}
	    return imageData;
	}
	
	@RequestMapping(value = { "/updateproduct" }, method = RequestMethod.POST)
    public String updateProduct(@ModelAttribute("productmodel")ProductsModel productsModel, 
  	      BindingResult result, ModelMap model) {
		Products products = productService.getProduct(productsModel.getPrdId().toString());
		products = productsModel.convertModelToDomain(products);
		products.setPrdCrtdDt(new Date());
		products.setPrdUptdDt(new Date());
		productService.saveOrUpdateProduct(products);
		List<Products> productsList = productService.getAllProducts();
		model.addAttribute("productsList",productsList);
 		model.addAttribute("productmodel",new ProductsModel());
        return "products-create";
    }
 	
 	@RequestMapping(value = { "/deleteproduct/{prdId}" }, method = RequestMethod.POST)
 	public String deleteUserGroup(@PathVariable(value = "prdId") String prdId, ModelMap model) {
 		productService.removeProduct(prdId);
 		List<Products> productsList = productService.getAllProducts();
		model.addAttribute("productsList",productsList);
 		model.addAttribute("productmodel",new ProductsModel());
 		
 		return "products-create";
 	}
 	
 	/**
 	 * Product Configuration Start Here
 	 * 
 	 */
 	@RequestMapping(value = { "/product-config-view" }, method = RequestMethod.GET)
    public String displayProductsConfiguration(ModelMap model) {
 		List<Products> productsList = productService.getAllProducts();
 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
 		List<ProdCfg> prodCfgs = productService.getProdCfgs();
 		List<ProdCfgModel> prodCfgModelList = productService.groupProductsAndUserGroups
 				(productsList, userGroups, prodCfgs);
 		model.addAttribute("prodCfgModelList",prodCfgModelList);
 		model.addAttribute("productcfgmodel",new ProdCfgModel());
        return "products-config-create";
    }
	
 	@RequestMapping(value = { "/createproductconfig" }, method = RequestMethod.POST)
    public String createProductConfig(Model model, HttpServletRequest request,
            HttpSession session,@ModelAttribute("productcfgmodel")ProdCfgModel productcfgmodel) {
 		if( productcfgmodel.getProdCfgList() != null && productcfgmodel.getProdCfgList().size() > 0  ) {
 			productService.saveProductConfiguration(productcfgmodel.getProdCfgList());
 		}
 		List<Products> productsList = productService.getAllProducts();
 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
 		List<ProdCfg> prodCfgs = productService.getProdCfgs();
 		List<ProdCfgModel> prodCfgModelList = productService.groupProductsAndUserGroups
 				(productsList, userGroups, prodCfgs);
 		model.addAttribute("prodCfgModelList",prodCfgModelList);
 		model.addAttribute("productcfgmodel",new ProdCfgModel());
 		return "products-config-create";
 	}
 	
}
