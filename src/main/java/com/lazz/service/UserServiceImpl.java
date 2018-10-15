package com.lazz.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lazz.service.dao.UsersDAO;
import com.lazz.service.domain.PrdPriceRules;
import com.lazz.service.domain.ProdCfg;
import com.lazz.service.domain.UserGroups;
import com.lazz.service.domain.UserTypes;
import com.lazz.service.domain.Users;
import com.lazz.ui.model.UserDetailsModel;
import com.lazz.ui.model.UserGroupsModel;
import com.lazz.ui.model.UserTypesModel;
import com.lazz.ui.model.UsersModel;

@Service
public class UserServiceImpl implements UsersService{
	
	@Autowired
	private UsersDAO usersDAO;
	
	@Override
	@Transactional(readOnly = true)
	public List<UsersModel> getUsers() {
		 List<Users> users = usersDAO.findUsers();
		 List<UsersModel> usersModels = new ArrayList<UsersModel>(0);
		 if(users != null && users.size() > 0  ) {
			 for (Users user :   users) {    
				 UsersModel model = new UsersModel();
				 model.setUsrId(user.getUsrId());
				 model.setUsrName(user.getUsrName());
				 model.setUserGroups(new UserGroupsModel());
				 model.getUserGroups().setUsrGrpName(user.getUserGroups().getUsrGrpName());
				 model.getUserGroups().setUsrGrpDesc(user.getUserGroups().getUsrGrpDesc());
				 model.setUserDetails(new UserDetailsModel());
				 model.getUserDetails().setUsrdFullName(user.getUsrdFullName());
				 model.getUserDetails().setUsrdCity(user.getUsrdCity());
				 model.getUserDetails().setUsrdEmail(user.getUsrdEmail());
				 model.getUserDetails().setUsrdMob(user.getUsrdMob());
				 model.getUserDetails().setUsrdPostCode(user.getUsrdPostCode());
				 model.getUserDetails().setUsrdShpAddr1(user.getUsrdShpAddr1());
				 model.getUserDetails().setUsrdShpAddr2(user.getUsrdShpAddr2());
				 model.getUserDetails().setUsrdState(user.getUsrdState());
				 model.getUserDetails().setUsrdId(user.getUsrId());
				 model.setUserTypes(new UserTypesModel());
				 model.getUserTypes().setUtId(user.getUserTypes().getUtId());
				 model.getUserTypes().setUtName(user.getUserTypes().getUtName());
				 model.getUserTypes().setUtDesc(user.getUserTypes().getUtDesc());
				 usersModels.add(model);
			 }
		 }
		 return usersModels;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<UserGroupsModel> getUserGroups() {
		
		 List<UserGroups> userGroups = usersDAO.findUserGroups();
		 List<UserGroupsModel> userGroupsModel = new ArrayList<UserGroupsModel>(0);
		 if( userGroups != null && !userGroups.isEmpty() ) {
			 for( UserGroups userGroup :  userGroups) {
				 UserGroupsModel usrGrpModel = new UserGroupsModel();
				 usrGrpModel.setUsrGrpId(userGroup.getUsrGrpId());
				 usrGrpModel.setUsrGrpName(userGroup.getUsrGrpName());
				 usrGrpModel.setUsrGrpDesc(userGroup.getUsrGrpDesc());
				 if( userGroup.getUserses() != null && !userGroup.getUserses().isEmpty() ) {
					 usrGrpModel.setUserses(new HashSet<UsersModel>());
					 for( Users userD : userGroup.getUserses()  ) {
						 UsersModel usrModel = new UsersModel();
						 usrModel.setUsrId(userD.getUsrId());
						 usrModel.setUsrName(userD.getUsrName());
						// if( userD.getUserDetails() != null ) {
							 usrModel.setUserDetails(new UserDetailsModel());
							 usrModel.getUserDetails().setUsrdFullName(userD.getUsrdFullName());
						// }
						
					 }
				 }
				 
				 userGroupsModel.add(usrGrpModel);
			 }
		 }
		 return userGroupsModel;
	}

	@Override
	@Transactional
	public void createOrUpdateUserGroup(UserGroups userGroup) {
		usersDAO.mergeGroups(userGroup);
	}

	@Override
	@Transactional(readOnly = true)
	public UserGroupsModel getUserGroups(String usrGrpId) {
		 UserGroupsModel usrGrpModel = new UserGroupsModel();
		 UserGroups userGroup = usersDAO.findUserGroups(usrGrpId);
		 usrGrpModel.setUsrGrpId(userGroup.getUsrGrpId());
		 usrGrpModel.setUsrGrpName(userGroup.getUsrGrpName());
		 usrGrpModel.setUsrGrpDesc(userGroup.getUsrGrpDesc());
		 if( userGroup.getUserses() != null && !userGroup.getUserses().isEmpty() ) {
			 usrGrpModel.setUserses(new HashSet<UsersModel>());
			 for( Users userD : userGroup.getUserses()  ) {
				 UsersModel usrModel = new UsersModel();
				 usrModel.setUsrId(userD.getUsrId());
				 usrModel.setUsrName(userD.getUsrName());
				 //if( userD.getUserDetails() != null ) {
					 usrModel.setUserDetails(new UserDetailsModel());
					 usrModel.getUserDetails().setUsrdFullName(userD.getUsrdFullName());
				 //}
				
			 }
		 }
		return usrGrpModel;
	}

	@Override
	@Transactional
	public void deleteUserGroup(String usrGrpId) {
		usersDAO.removeGroup(usrGrpId);
	}

	@Override
	@Transactional(readOnly = true)
	public UserGroups getUserGroupById(String usrGrpId) {
		return usersDAO.findUserGroups(usrGrpId);
	}

	@Override
	@Transactional(readOnly = true)
	public List<UserTypes> getUserTypes() {
		return usersDAO.findUserTypes();
	}

	@Override
	@Transactional(readOnly = true)
	public Users getUserById(String usrId) {
		return usersDAO.findUser(usrId);
	}
	
	@Override
	@Transactional
	public void deleteUser(String usrId) {
		usersDAO.removeUser(usrId);
	}

	@Override
	@Transactional(readOnly = true)
	public UserTypes getUserTypeById(String usrTypeId) {
		return usersDAO.findUserTypes(usrTypeId);
	}
	
	@Override
	@Transactional(readOnly = true)
	public Integer getMaxUserId() {
		return usersDAO.getMaxUserId();
	}

	@Override
	@Transactional
	public void createOrUpdateUser(Users user) {
		usersDAO.mergeUsers(user);
	}

	@Override
	@Transactional(readOnly = true)
	public UsersModel getUserModelById(String usrId) {
		Users user = getUserById(usrId);
		UsersModel model = new UsersModel();
		 model.setUsrId(user.getUsrId());
		 model.setUsrName(user.getUsrName());
		 model.setUserGroups(new UserGroupsModel());
		 model.getUserGroups().setUsrGrpId(user.getUserGroups().getUsrGrpId());
		 model.getUserGroups().setUsrGrpName(user.getUserGroups().getUsrGrpName());
		 model.getUserGroups().setUsrGrpDesc(user.getUserGroups().getUsrGrpDesc());
		 model.setUserDetails(new UserDetailsModel());
		 model.getUserDetails().setUsrdFullName(user.getUsrdFullName());
		 model.getUserDetails().setUsrdCity(user.getUsrdCity());
		 model.getUserDetails().setUsrdEmail(user.getUsrdEmail());
		 model.getUserDetails().setUsrdMob(user.getUsrdMob());
		 model.getUserDetails().setUsrdPostCode(user.getUsrdPostCode());
		 model.getUserDetails().setUsrdShpAddr1(user.getUsrdShpAddr1());
		 model.getUserDetails().setUsrdShpAddr2(user.getUsrdShpAddr2());
		 model.getUserDetails().setUsrdState(user.getUsrdState());
		 model.getUserDetails().setUsrdId(user.getUsrId());
		 model.setUserTypes(new UserTypesModel());
		 model.getUserTypes().setUtId(user.getUserTypes().getUtId());
		 model.getUserTypes().setUtName(user.getUserTypes().getUtName());
		 model.getUserTypes().setUtDesc(user.getUserTypes().getUtDesc());
		 
		 return model;
	}
	
	//this is a duplicate method
	@Override
	@Transactional(readOnly = true)
	public List<UserGroups> getUserGroupsOnly() {
		 List<UserGroups> userGroups = usersDAO.findUserGroups();
		 if( userGroups != null && userGroups.size() > 0 ) {
	 			for(UserGroups userGroupLoop : userGroups) {
	 				if( userGroupLoop.getProdCfgs() != null && 
	 						userGroupLoop.getProdCfgs().size() > 0) {
	 					for(ProdCfg prodCfgLoop : userGroupLoop.getProdCfgs()) {
	 						if( prodCfgLoop.getPrdPriceRuleses() == null || 
	 								prodCfgLoop.getPrdPriceRuleses().size() == 0 ) {
	 							Set<PrdPriceRules> prdPriceRulesSet = new LinkedHashSet<PrdPriceRules>();
	 							
	 							PrdPriceRules prdPriceRules = new PrdPriceRules();
	 							prdPriceRules.setPrdPrcRuleCarton(15);
	 							prdPriceRules.setPrdPrcRulePriceEast(0F);
	 							prdPriceRules.setPrdPrcRulePriceWest(0F);
	 							prdPriceRulesSet.add(prdPriceRules);
	 							
	 							prdPriceRules = new PrdPriceRules();
	 							prdPriceRules.setPrdPrcRuleCarton(8);
	 							prdPriceRules.setPrdPrcRulePriceEast(0F);
	 							prdPriceRules.setPrdPrcRulePriceWest(0F);
	 							prdPriceRulesSet.add(prdPriceRules);
	 							
	 							prdPriceRules = new PrdPriceRules();
	 							prdPriceRules.setPrdPrcRuleCarton(6);
	 							prdPriceRules.setPrdPrcRulePriceEast(0F);
	 							prdPriceRules.setPrdPrcRulePriceWest(0F);
	 							prdPriceRulesSet.add(prdPriceRules);
	 							
	 							prdPriceRules = new PrdPriceRules();
	 							prdPriceRules.setPrdPrcRuleCarton(3);
	 							prdPriceRules.setPrdPrcRulePriceEast(0F);
	 							prdPriceRules.setPrdPrcRulePriceWest(0F);
	 							prdPriceRulesSet.add(prdPriceRules);
	 							
	 							prdPriceRules = new PrdPriceRules();
	 							prdPriceRules.setPrdPrcRuleCarton(1);
	 							prdPriceRules.setPrdPrcRulePriceEast(0F);
	 							prdPriceRules.setPrdPrcRulePriceWest(0F);
	 							prdPriceRulesSet.add(prdPriceRules);
	 							
	 							prodCfgLoop.setPrdPriceRuleses(prdPriceRulesSet);
	 						}
	 					}
	 				}
	 			}
	 		}
		 return userGroups;
	}

	@Override
	@Transactional(readOnly = true)
	public Users getUserByIdAndPassword(String userName, String password) {
		return usersDAO.findUserByIdAndPassword(userName, password);
	}

	@Override
	@Transactional
	public UserTypes getUserTypeByType(String usrType) {
		return usersDAO.findUserTypeByType(usrType);
	}
	
	@Override
	@Transactional
	public boolean isEmailIdExists(String email) {
		return usersDAO.emailExists(email);
	}

	@Override
	@Transactional(readOnly = true)
	public UserGroups getUserGroupByGrpCd(String usrGrpCd) {
		return usersDAO.findUserGroupsByGroupCode(usrGrpCd);
	}
}
