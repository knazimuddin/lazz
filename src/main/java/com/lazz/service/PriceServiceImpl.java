package com.lazz.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lazz.service.dao.PriceDAO;
import com.lazz.service.dao.ProductDAO;
import com.lazz.service.domain.PrdPriceRules;
import com.lazz.service.domain.ProdCfg;
import com.lazz.ui.model.PrdPriceRulesModel;
import com.lazz.ui.model.PrdPriceRulesModelWrapper;
import com.lazz.ui.model.ProdCfgModel;

@Service
public class PriceServiceImpl implements PriceService{
	
	@Autowired
	private PriceDAO priceDAO;
	
	@Autowired
	private ProductDAO productDAO;

	@Transactional
	@Override
	public List<PrdPriceRules> getPrdPriceRulesForUserGroup(String userGrpId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public void savePrdPriceRules(PrdPriceRulesModelWrapper prdPriceRulesModelWrapper) {
		if( prdPriceRulesModelWrapper.getPrdConfigurations() != null && 
				prdPriceRulesModelWrapper.getPrdConfigurations().size() > 0) {
			ProdCfg prdCfg = null;
			for( ProdCfgModel prdCfgModelLoop :  prdPriceRulesModelWrapper.getPrdConfigurations()) {
				boolean isProdCfgObtained = false;
				for( PrdPriceRulesModel prdPriceRulesModelLoop :  prdCfgModelLoop.getPrdPriceRules()) {
					PrdPriceRules prdPriceRules = null;
					if( prdPriceRulesModelLoop.getPrdPrcRuleId() == null ) {
						prdPriceRules = new PrdPriceRules();
						prdPriceRules.setPrdPrcRulePriceCrtdDt(new Date());
						if( !isProdCfgObtained ) {
							prdCfg = productDAO.findProdCfgById(prdCfgModelLoop.getPrdCfgId().toString());
							prdPriceRules.setProdCfg(prdCfg);
							isProdCfgObtained = true;
						} else {
							prdPriceRules.setProdCfg(prdCfg);
						}
					} else {
						prdPriceRules = priceDAO.getPrdPriceRules(prdPriceRulesModelLoop.getPrdPrcRuleId().toString());
					}
					
					prdPriceRules.setPrdPrcRulePriceEast(prdPriceRulesModelLoop.getPrdPrcRulePriceEast());
					prdPriceRules.setPrdPrcRulePriceWest(prdPriceRulesModelLoop.getPrdPrcRulePriceWest());
					prdPriceRules.setPrdPrcRuleCarton(prdPriceRulesModelLoop.getPrdPrcRuleCarton());
					prdPriceRules.setPrdPrcRulePriceUptdDt(new Date());
					priceDAO.insertOrUpdateProductProdPriceRules(prdPriceRules);
				}
			}
		}
	}

}
