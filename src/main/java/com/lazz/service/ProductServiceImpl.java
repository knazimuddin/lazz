package com.lazz.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lazz.service.dao.GenericDAO;
import com.lazz.service.dao.ProductDAO;
import com.lazz.service.domain.Invoice;
import com.lazz.service.domain.InvoiceDetails;
import com.lazz.service.domain.ProdCfg;
import com.lazz.service.domain.Products;
import com.lazz.service.domain.UserGroups;
import com.lazz.ui.model.ProdCfgModel;
import com.lazz.ui.model.UserGroupsModel;
import com.lazz.utils.ObjectUtils;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private GenericDAO genericDAO;
	
	@Override
	@Transactional
	public void saveOrUpdateProduct(Products product) {
		productDAO.insertOrUpdateProduct(product);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Products> getAllProducts() {
		return productDAO.findAllProducts();
	}

	@Override
	@Transactional(readOnly = true)
	public Products getProduct(String prdId) {
		return productDAO.findProductById(prdId);
	}

	@Override
	@Transactional
	public void removeProduct(String prdId) {
		productDAO.deleteProduct(prdId);
	}

	@Override
	@Transactional(readOnly = true)
	public List<ProdCfg> getProdCfgs() {
		return productDAO.findProdCfgs();
	}

	@Override
	public List<ProdCfgModel> groupProductsAndUserGroups(List<Products> products, 
			List<UserGroupsModel> userGroupList, List<ProdCfg> productCfgList) {
		List<ProdCfgModel> prodCfgList = new ArrayList<ProdCfgModel>();
		Map<ProdCfg, List<UserGroups>> productConfiguration = new HashMap<ProdCfg, List<UserGroups>>();
		if( productCfgList != null && productCfgList.size() > 0 ) {
			for( ProdCfg prodCfg :  productCfgList) {
				if( !productConfiguration.containsKey(prodCfg)) {
					productConfiguration.put(prodCfg, new ArrayList<UserGroups>());
				}
				productConfiguration.get(prodCfg).add(prodCfg.getUserGroups());
			}
		}
		
		for( Products prodLoop :  products) {
			ProdCfgModel prodCfgModel = new ProdCfgModel();
			prodCfgModel.setPrdId(prodLoop.getPrdId());
			prodCfgModel.setPrdName(prodLoop.getPrdName());
			
			if(  userGroupList != null && userGroupList.size() > 0 ) {
				for( UserGroupsModel usrGrpLoop :   userGroupList) {
					prodCfgModel.getUserGroups().add((UserGroupsModel)ObjectUtils.createCopy(usrGrpLoop));
				}
			}
			if( productConfiguration.size() > 0  ) {
				for (Map.Entry<ProdCfg, List<UserGroups>> entry : productConfiguration.entrySet())
				{
					if( entry.getKey().getProducts().getPrdId().intValue() ==  prodLoop.getPrdId().intValue() ) {
						List<UserGroups> userGroupsMapVal = entry.getValue();
						for( UserGroups userGroupLoop :  userGroupsMapVal) {
							for(UserGroupsModel userGroupsModelLoop :  prodCfgModel.getUserGroups() ) {
								if( userGroupLoop.getUsrGrpId().intValue() == userGroupsModelLoop.getUsrGrpId().intValue() ) {
									userGroupsModelLoop.setAssignedToProduct("Y");
								}
							}
						}
						break;
					}
				}
			}
			prodCfgList.add(prodCfgModel);
		}
		return prodCfgList;
	}

	@Override
	@Transactional
	public void saveProductConfiguration(List<ProdCfgModel> prodCfgList) {
		List<ProdCfg> prodCfgs = new ArrayList<ProdCfg>();
		for( ProdCfgModel prodCfgModel :  prodCfgList) {
			if( prodCfgModel.getSelectedUserGroups() != null && 
					prodCfgModel.getSelectedUserGroups().size() > 0) {
				for( String usrGrpId :  prodCfgModel.getSelectedUserGroups()) {
					ProdCfg prodCfg = new ProdCfg();
					prodCfg.setProducts(getProduct(prodCfgModel.getPrdId().toString()));
					prodCfg.setUserGroups(usersService.getUserGroupById(usrGrpId));
					prodCfg.setPrdCfgUptdDt(new Date());
					prodCfgs.add(prodCfg);
				}
			}
		}
		
		if( prodCfgs.size() > 0  ) {
			productDAO.deleteAllProdCfg();
			productDAO.saveAllProdCfgs(prodCfgs);
		}
	}
	
	@Transactional(readOnly = true)
	public ProdCfg getProdCfgs(String prdId, String userGrpCode){
		return productDAO.findProdCfgs(prdId, userGrpCode);
	}

	@Override
	@Transactional(readOnly = true)
	public boolean isSKUUnique(String sku) {
		return productDAO.isSKUUnique(sku);
	}

	@Transactional(readOnly = true)
	public List<Products> getAllProductsForGUIUsers(){
		return productDAO.findProductsForGUIUsers();
	}

	@Override
	public void saveOrUpdateInvoice(Invoice invoice) {
		genericDAO.merge(invoice);
		for( InvoiceDetails invDetails : invoice.getInvoiceDetailses() ) {
			genericDAO.merge(invDetails);
		}
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Products> getAllProductsForUsrGroup(String userGrpId){
		return productDAO.findProductsForUsrGroup(userGrpId);
	}
}
