package com.lazz.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lazz.service.PriceService;
import com.lazz.service.UsersService;
import com.lazz.service.domain.UserGroups;
import com.lazz.ui.model.PrdPriceRulesModelWrapper;
import com.lazz.ui.model.UserGroupsModel;

@Controller
@RequestMapping("/admin/price")
public class AdminPriceController {
	
	@Autowired
	private UsersService usersService;
	
	/*@Autowired
	private ProductService productService;*/
	
	@Autowired
	private PriceService priceService;
	
	@RequestMapping(value = { "/product-price-rules-view" }, method = RequestMethod.GET)
    public String displayUserPriceView(ModelMap model) {
 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
 		model.addAttribute("userGroupsList", userGroups);
 		model.addAttribute("prdpricerulesmodel",new PrdPriceRulesModelWrapper());
        return "prod-price-rules";
    }
	@RequestMapping(value = { "/display-product-price-rules-for-usr-view/{usrGrpId}" }, method = RequestMethod.POST)
    public String displayUserPriceRulesForUserView(@PathVariable(value = "usrGrpId") String usrGrpId, ModelMap model) {
		PrdPriceRulesModelWrapper prdPriceRulesModelWrapper = new PrdPriceRulesModelWrapper();
 		List<UserGroups> userGroups = usersService.getUserGroupsOnly();
 		prdPriceRulesModelWrapper.setSelectedUsrGrpId(usrGrpId);
 		model.addAttribute("prdpricerulesmodel",prdPriceRulesModelWrapper);
 		model.addAttribute("selectedUserGroup",getSelectedUserGroup(usrGrpId, userGroups));
 		model.addAttribute("userGroupsList", userGroups);
        return "prod-price-rules";
    }
	
	private UserGroups getSelectedUserGroup(String usrGrpId, List<UserGroups> userGroups) {
		UserGroups userGroup = null;
		if( userGroups != null && userGroups.size() > 0 ) {
			for( UserGroups userGroupLoop :  userGroups) {
				if( userGroupLoop.getUsrGrpId().toString().equals(usrGrpId) ) {
					userGroup = userGroupLoop;
					break;
				}
			}
		}
		return userGroup;
	}
	
	@RequestMapping(value = { "/display-product-price-rules-update-view/{usrGrpId}" }, method = RequestMethod.POST)
	public String displayUserPriceRulesUpdateView(@PathVariable(value = "usrGrpId") String usrGrpId, ModelMap model) {
		PrdPriceRulesModelWrapper prdPriceRulesModelWrapper = new PrdPriceRulesModelWrapper();
 		List<UserGroups> userGroups = usersService.getUserGroupsOnly();
 		prdPriceRulesModelWrapper.setSelectedUsrGrpId(usrGrpId);
 		model.addAttribute("prdpricerulesmodel",prdPriceRulesModelWrapper);
 		model.addAttribute("selectedUserGroup",getSelectedUserGroup(usrGrpId, userGroups));
 		model.addAttribute("userGroupsList", userGroups);
        return "prod-price-rules-update";
    }
	
	@RequestMapping(value = { "/save-product-price-rules" }, method = RequestMethod.POST)
    public String createProduct(@ModelAttribute("prdpricerulesmodel")PrdPriceRulesModelWrapper prdPriceRulesModelWrapper, 
  	      BindingResult result, ModelMap model) {
		priceService.savePrdPriceRules(prdPriceRulesModelWrapper);
 		List<UserGroups> userGroups = usersService.getUserGroupsOnly();
 		prdPriceRulesModelWrapper.setSelectedUsrGrpId(prdPriceRulesModelWrapper.getSelectedUsrGrpId());
 		model.addAttribute("prdpricerulesmodel",prdPriceRulesModelWrapper);
 		model.addAttribute("selectedUserGroup",getSelectedUserGroup(prdPriceRulesModelWrapper.getSelectedUsrGrpId(), userGroups));
 		model.addAttribute("userGroupsList", userGroups);
        return "prod-price-rules";
    }
	
}
