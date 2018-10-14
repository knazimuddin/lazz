package com.lazz.service;

import java.util.List;

import com.lazz.service.domain.PrdPriceRules;
import com.lazz.ui.model.PrdPriceRulesModelWrapper;

public interface PriceService {
	public List<PrdPriceRules> getPrdPriceRulesForUserGroup(String userGrpId);
	public void savePrdPriceRules(PrdPriceRulesModelWrapper prdPriceRulesModelWrapper);
}
