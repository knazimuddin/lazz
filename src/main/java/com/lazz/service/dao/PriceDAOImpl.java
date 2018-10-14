package com.lazz.service.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lazz.service.domain.PrdPriceRules;

@Repository
public class PriceDAOImpl implements PriceDAO{

	@Autowired
	private SessionFactory sessionFactory;

	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<PrdPriceRules> getPrdPriceRulesForUserGroup(String usrGrpId) {
		String sql = " from PrdPriceRules pr where pr.prodCfg.userGroups.usrGrpId = :usrGrpId ";
		
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setInteger("usrGrpId",Integer.valueOf(usrGrpId));
		
		return query.list();
	}


	@Override
	public PrdPriceRules getPrdPriceRules(String prdPrcRuleId) {
		PrdPriceRules prdPriceRules = null;
		Session session = sessionFactory.getCurrentSession();
		prdPriceRules = session.get(PrdPriceRules.class, Integer.valueOf(prdPrcRuleId));
		return prdPriceRules;
	}


	@Override
	public void insertOrUpdateProductProdPriceRules(PrdPriceRules prdPriceRules) {
		Session session = sessionFactory.getCurrentSession();
		session.merge(prdPriceRules);
	}
	
	

}
