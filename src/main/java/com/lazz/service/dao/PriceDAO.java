package com.lazz.service.dao;

import java.util.List;

import com.lazz.service.domain.PrdPriceRules;

public interface PriceDAO {
	public List<PrdPriceRules> getPrdPriceRulesForUserGroup(String usrGrpId);
	
	public PrdPriceRules getPrdPriceRules(String prdPrcRuleId);
	
	public void insertOrUpdateProductProdPriceRules(PrdPriceRules prdPriceRules);
}
