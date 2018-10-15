package com.lazz.service.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lazz.service.domain.PrdPriceRules;
import com.lazz.service.domain.ProdCfg;
import com.lazz.service.domain.Products;
import com.lazz.utils.AppConstants;
import com.lazz.utils.StringUtils;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void insertOrUpdateProduct(Products product) {
		if( StringUtils.isEmpty(product.getPrdUnqId())  ) {
			Criteria criteria = sessionFactory.getCurrentSession()
				    .createCriteria(Products.class)
				    .setProjection(Projections.max("prdId"));
				Integer maxPrdId = (Integer)criteria.uniqueResult();
				String uniqueId  = "PRD";
				if( maxPrdId != null && maxPrdId.intValue() > 0 ) {
					uniqueId+= (maxPrdId+1);
				} else {
					uniqueId+= 1;
				}
				product.setPrdUnqId(uniqueId);
		}
		sessionFactory.getCurrentSession().merge(product);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> findAllProducts() {
		return sessionFactory.getCurrentSession().createQuery("from Products").list();
	}

	@Override
	public Products findProductById(String prdId) {
		Products product = null;
		Session session = sessionFactory.getCurrentSession();
		product = session.get(Products.class, Integer.valueOf(prdId));
		return product;
	}

	@Override
	public void deleteProduct(String prdId) {
		Products product = findProductById(prdId);
		if( product != null ) {
			sessionFactory.getCurrentSession().delete(product);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProdCfg> findProdCfgs() {
		return sessionFactory.getCurrentSession().createQuery("from ProdCfg").list();
	}

	@Override
	public void deleteAllProdCfg() {
		sessionFactory.getCurrentSession().createQuery("delete from ProdCfg").executeUpdate();
	}

	@Override
	public void saveAllProdCfgs(List<ProdCfg> prodCfgsList) {
		for(ProdCfg prdCfg : prodCfgsList ) {
			sessionFactory.getCurrentSession().save(prdCfg);
		}
	}
	
	@SuppressWarnings("deprecation")
	public List<ProdCfg> getProdCfgForUserGroup(String usrGrpId){
		Query query = sessionFactory.getCurrentSession().createQuery(" from  ProdCfg  prcfg where prcfg.userGroups.usrGrpId = :usrGrpId ");
		query.setInteger("usrGrpId", Integer.valueOf(usrGrpId));
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ProdCfg findProdCfgs(String prdId, String userGrp) {
		ProdCfg prdCfg = null;
		Query query = sessionFactory.getCurrentSession().createQuery(" from  ProdCfg  prcfg where prcfg.products.prdId = :prdId and prcfg.userGroups.usrGrpName = :usrGrpName ");
		query.setInteger("prdId", Integer.valueOf(prdId));
		query.setString("usrGrpName", userGrp);
		List<ProdCfg> prdCfgList = query.list();
		if( prdCfgList != null && prdCfgList.size() > 0 ) {
			prdCfg = prdCfgList.get(0);
		}
		return prdCfg;
	}
	
	@Override
	public ProdCfg findProdCfgById(String prdCfgId) {
		ProdCfg prodCfg = null;
		Session session = sessionFactory.getCurrentSession();
		prodCfg = session.get(ProdCfg.class, Integer.valueOf(prdCfgId));
		return prodCfg;
	}
	
	
	public boolean isSKUUnique(String sku) {
		boolean isUnique = false;
		Query query = sessionFactory.getCurrentSession().createQuery(" from Products prd where prd.prdSkuNum = :prdSkuNum");
		query.setString("prdSkuNum", sku);
		List<Products> productsList = query.list();
		if( productsList != null && productsList.size() > 0  ) {
			isUnique = true;
		}
		return isUnique;
	}

	@Override
	public List<Products> findProductsForGUIUsers() {
		List<Products> productsList = new ArrayList<Products>(0);
		Query query = sessionFactory.getCurrentSession().createQuery(" from ProdCfg  prcfg where prcfg.userGroups.usrGrpName = :GUIUSER");
		query.setString("GUIUSER", AppConstants.USER_TYPE_USER);
		List<ProdCfg> prdConfigs = query.list();
		if( prdConfigs != null && prdConfigs.size() > 0 ) {
			for( ProdCfg prodCfg :  prdConfigs) {
				productsList.add(prodCfg.getProducts());
			}
		}
		
		return productsList;
	}

	@Override
	public List<Products> findProductsForUsrGroup(String userGrpId) {
		List<Products> productsList = new ArrayList<Products>(0);
		Query query = sessionFactory.getCurrentSession().createQuery(" from ProdCfg  prcfg where prcfg.userGroups.usrGrpId = :usrGrpId");
		query.setString("usrGrpId", userGrpId);
		List<ProdCfg> prdConfigs = query.list();
		if( prdConfigs != null && prdConfigs.size() > 0 ) {
			for( ProdCfg prodCfg :  prdConfigs) {
				productsList.add(prodCfg.getProducts());
			}
		}
		
		return productsList;
	}

	@Override
	public void deleteAllProdCfg(List<ProdCfg> prodCfgsList) {
		Session hibernateSession  = sessionFactory.getCurrentSession();
		for(ProdCfg prdCfg : prodCfgsList  ) {
			if( prdCfg.getPrdPriceRuleses() != null && 
					prdCfg.getPrdPriceRuleses().size() > 0 ) {
				for( PrdPriceRules prdPriceRules : prdCfg.getPrdPriceRuleses() ) {
					hibernateSession.delete(prdPriceRules);
				}
			}
			hibernateSession.delete(prdCfg);
		}
	}

}
