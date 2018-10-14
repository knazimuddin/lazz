package com.lazz.service.dao;

import java.util.List;

import com.lazz.service.domain.ProdCfg;
import com.lazz.service.domain.Products;

public interface ProductDAO {
	public void insertOrUpdateProduct(Products product);
	
	public List<Products> findAllProducts();
	
	public Products findProductById(String prdId);
	
	public void deleteProduct(String prdId);
	
	public List<ProdCfg> findProdCfgs();
	
	public void deleteAllProdCfg();
	
	public void saveAllProdCfgs(List<ProdCfg> prodCfgsList);
	
	public List<ProdCfg> getProdCfgForUserGroup(String usrGrpId);
	
	public ProdCfg findProdCfgs(String prdId, String userGrp);
	
	public ProdCfg findProdCfgById(String prdCfgId);
	
	public boolean isSKUUnique(String sku);
	
	public List<Products> findProductsForGUIUsers();
	
	public List<Products> findProductsForUsrGroup(String userGrpId);
}
