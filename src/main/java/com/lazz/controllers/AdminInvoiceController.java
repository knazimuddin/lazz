package com.lazz.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lazz.service.ProductService;
import com.lazz.service.domain.Products;
import com.lazz.service.domain.Users;
import com.lazz.ui.model.ProductsModel;
import com.lazz.utils.AppConstants;

@Controller
@RequestMapping("/admin/invoice")
public class AdminInvoiceController {
	
	@Autowired
	private ProductService productService;
	
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
}
