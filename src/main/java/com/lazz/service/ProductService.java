package com.lazz.service;

import java.util.List;

import com.lazz.service.domain.Invoice;
import com.lazz.service.domain.ProdCfg;
import com.lazz.service.domain.Products;
import com.lazz.ui.model.ProdCfgModel;
import com.lazz.ui.model.UserGroupsModel;

public interface ProductService {
	public void saveOrUpdateProduct(Products product);
	public List<Products> getAllProducts();
	public List<Products> getAllProductsForGUIUsers();
	public List<Products> getAllProductsForUsrGroup(String userGrpId);
	public Products getProduct(String prdId);
	public void removeProduct(String prdId);
	public List<ProdCfg> getProdCfgs();
	public ProdCfg getProdCfgs(String prdId, String userGrp);
	public List<ProdCfgModel> groupProductsAndUserGroups(List<Products> products, 
			List<UserGroupsModel> userGroupList, List<ProdCfg> productCfgList);
	public void saveProductConfiguration(List<ProdCfgModel> prodCfgList);
	public boolean isSKUUnique(String sku);
	public void saveOrUpdateInvoice(Invoice invoice);
}
