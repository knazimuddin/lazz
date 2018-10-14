package com.lazz.ui.model;

import java.util.ArrayList;
import java.util.List;

public class PrdPriceRulesModelWrapper {
	private String selectedUsrGrpId;
	private List<ProdCfgModel> prdConfigurations = new ArrayList<ProdCfgModel>();
	
	public String getSelectedUsrGrpId() {
		return selectedUsrGrpId;
	}
	public void setSelectedUsrGrpId(String selectedUsrGrpId) {
		this.selectedUsrGrpId = selectedUsrGrpId;
	}
	public List<ProdCfgModel> getPrdConfigurations() {
		return prdConfigurations;
	}
	public void setPrdConfigurations(List<ProdCfgModel> prdConfigurations) {
		this.prdConfigurations = prdConfigurations;
	}
	
	
}
