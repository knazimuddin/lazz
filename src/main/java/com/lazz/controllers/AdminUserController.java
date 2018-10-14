package com.lazz.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lazz.service.UsersService;
import com.lazz.service.UtilityService;
import com.lazz.service.domain.UserGroups;
import com.lazz.service.domain.UserTypes;
import com.lazz.service.domain.Users;
import com.lazz.ui.model.UserGroupsModel;
import com.lazz.ui.model.UsersModel;
import com.lazz.utils.StringUtils;
import com.lazz.utils.ValueO;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
		
		@Autowired
		private UsersService usersService;
		
		@Autowired
		private UtilityService utilityService;
	
	 	@RequestMapping(value = { "/usergroup" }, method = RequestMethod.GET)
	    public String listUserGroups(ModelMap model) {
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		model.addAttribute("userGroupsList", userGroups);
	 		model.addAttribute("usergroupmodel",new UserGroupsModel());
	        return "user-group-create";
	    }
	 	
	 	@RequestMapping(value = { "/createusergroup" }, method = RequestMethod.POST)
	    public String createUserGroups(@ModelAttribute("usergroupmodel")UserGroupsModel userGroupModel, 
	    	      BindingResult result, ModelMap model) {
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		boolean isUniqueGroup = true;
	 		if( userGroups != null && !userGroups.isEmpty() ) {
	 			for( UserGroupsModel userGroupsModel : userGroups ) {
	 				if( userGroupsModel.getUsrGrpName().equals(userGroupModel.getUsrGrpName()) ) {
	 					isUniqueGroup = false;
	 					break;
	 				}
	 			}
	 		}
	 		if( isUniqueGroup ) {
	 			Date timestamp = new Date();
	 			UserGroups newUserGroups = new UserGroups();
	 			newUserGroups.setUsrGrpName(userGroupModel.getUsrGrpName());
	 			newUserGroups.setUsrCrtdDt(timestamp);
	 			newUserGroups.setUsrUptdDt(timestamp);
	 			try {
	 				usersService.createOrUpdateUserGroup(newUserGroups);
	 				userGroups = usersService.getUserGroups();
	 			} catch(Exception e) {
	 				e.printStackTrace();
	 			}
	 		}
	 		model.addAttribute("usergroupmodel",new UserGroupsModel());
	 		model.addAttribute("userGroupsList", userGroups);
	        return "user-group-create";
	    }
	 	
	 	@RequestMapping(value = { "/updateusergroupview/{usrGrpId}" }, method = RequestMethod.GET)
	 	public String displayUserGroupView(@PathVariable(value = "usrGrpId") String usrGrpId, ModelMap model) {
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		model.addAttribute("usergroupmodel",usersService.getUserGroups(usrGrpId));
	 		model.addAttribute("userGroupsList", userGroups);
	 		
	 		return "user-group-update";
	 	}
	 	
	 	@RequestMapping(value = { "/deleteusergroup/{usrGrpId}" }, method = RequestMethod.POST)
	 	public String deleteUserGroup(@PathVariable(value = "usrGrpId") String usrGrpId, ModelMap model) {
	 		usersService.deleteUserGroup(usrGrpId);
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		model.addAttribute("usergroupmodel",new UserGroupsModel());
	 		model.addAttribute("userGroupsList", userGroups);
	 		
	 		return "user-group-create";
	 	}
	 	
	 	@RequestMapping(value = { "/updateusergroup" }, method = RequestMethod.POST)
	    public String updateUserGroups(@ModelAttribute("usergroupmodel")UserGroupsModel userGroupModel, 
	    	      BindingResult result, ModelMap model) {
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		boolean isUniqueGroup = true;
	 		if( userGroups != null && !userGroups.isEmpty() ) {
	 			for( UserGroupsModel userGroupsModel : userGroups ) {
	 				if( userGroupsModel.getUsrGrpName().equals(userGroupModel.getUsrGrpName()) ) {
	 					isUniqueGroup = false;
	 					break;
	 				}
	 			}
	 		}
	 		if( isUniqueGroup ) {
	 			try {
	 				UserGroups updateGroup = usersService.getUserGroupById(userGroupModel.getUsrGrpId().toString());
	 				updateGroup.setUsrGrpName(userGroupModel.getUsrGrpName());
	 				usersService.createOrUpdateUserGroup(updateGroup);
	 				userGroups = usersService.getUserGroups();
	 			} catch(Exception e) {
	 				e.printStackTrace();
	 			}
	 		}
	 		model.addAttribute("usergroupmodel",new UserGroupsModel());
	 		model.addAttribute("userGroupsList", userGroups);
	        return "user-group-create";
	    }
	 	
	 	/*private List<UserGroupModel> convertDomainToModel(List<UserGroups> userGroups){
	 		List<UserGroupModel> userGroupModels = new ArrayList<UserGroupModel>(0);
	 		if ( userGroups != null && !userGroups.isEmpty() ) {
	 			for(UserGroups grp : userGroups  ) {
	 				userGroupModels.add(new UserGroupModel().convertDomainToModel(grp));
	 			}
	 		}
	 		return userGroupModels;
	 		
	 	}*/
	 	
	 	
	 	@RequestMapping(value = { "/users" }, method = RequestMethod.GET)
	    public String displayUsers(ModelMap model) {
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		List<UserTypes> userTypes = usersService.getUserTypes();
	 		List<UsersModel> usersList = usersService.getUsers();
	 		List<ValueO> states = utilityService.getMalaysiaStates();
	 		model.addAttribute("userGroupsList", userGroups);
	 		model.addAttribute("userTypeList",userTypes);
	 		model.addAttribute("usersList",usersList);
	 		model.addAttribute("states",StringUtils.convertListToMap(states));
	 		model.addAttribute("usermodel",new UsersModel());
	        return "create-user";
	    }
	 	
	 	@RequestMapping(value = { "/updateuserview/{usrId}" }, method = RequestMethod.GET)
	 	public String displayUserView(@PathVariable(value = "usrId") String usrId, ModelMap model) {
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		List<UserTypes> userTypes = usersService.getUserTypes();
	 		List<UsersModel> usersList = usersService.getUsers();
	 		List<ValueO> states = utilityService.getMalaysiaStates();
	 		model.addAttribute("userGroupsList", userGroups);
	 		model.addAttribute("userTypeList",userTypes);
	 		model.addAttribute("usersList",usersList);
	 		model.addAttribute("states",StringUtils.convertListToMap(states));
	 		model.addAttribute("usermodel",usersService.getUserModelById(usrId));
	 		return "update-user";
	 	}
	 	
	 	@RequestMapping(value = { "/deleteuser/{usrId}" }, method = RequestMethod.POST)
	 	public String deleteUser(@PathVariable(value = "usrId") String usrId, ModelMap model) {
	 		usersService.deleteUser(usrId);
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		List<UserTypes> userTypes = usersService.getUserTypes();
	 		List<UsersModel> usersList = usersService.getUsers();
	 		List<ValueO> states = utilityService.getMalaysiaStates();
	 		model.addAttribute("userGroupsList", userGroups);
	 		model.addAttribute("userTypeList",userTypes);
	 		model.addAttribute("usersList",usersList);
	 		model.addAttribute("states",StringUtils.convertListToMap(states));
	 		model.addAttribute("usermodel",new UsersModel());
	 		
	 		return "create-user";
	 	}
	 	
	 	@RequestMapping(value = { "/createuser" }, method = RequestMethod.POST)
	    public String createUserGroups(@ModelAttribute("usermodel")UsersModel usersModel, 
	    	      BindingResult result, ModelMap model) {
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		List<UserTypes> userTypes = usersService.getUserTypes();
	 		List<UsersModel> usersList = usersService.getUsers();
	 		List<ValueO> states = utilityService.getMalaysiaStates();
	 		boolean isEmailUnique = usersService.
	 				isEmailIdExists(usersModel.getUserDetails().getUsrdEmail());
	 		/*if( usersList != null && !usersList.isEmpty() ) {
	 			for( UsersModel usrM :  usersList ) {
	 				if( usrM.getUserDetails().getUsrdEmail().equals(usersModel.getUserDetails().getUsrdEmail()) ) {
	 					isEmailUnique = false;
	 					break;
	 				}
	 			}
	 		}*/
	 		if( isEmailUnique ) {
	 			Users user = new Users();
	 			Date currentTimestamp = new Date();
	 			UserTypes userType = usersService.getUserTypeById(usersModel.getUserTypes().getUtId().toString());
	 			UserGroups userGroup = usersService.getUserGroupById(usersModel.getUserGroups().getUsrGrpId().toString());
	 			user.setUsrName(StringUtils.generateUserId(userType.getUtName(), usersService.getMaxUserId()));
	 			user.setUsrCrtdDt(currentTimestamp);
	 			user.setUsrPassword("123");
	 			user.setUsrUptdDt(currentTimestamp);
	 			user.setUserGroups(userGroup);
	 			user.setUserTypes(userType);
	 			//user.setUserDetails(new UserDetails());
	 			user.setUsrdFullName(usersModel.getUserDetails().getUsrdFullName());
	 			user.setUsrdCity(usersModel.getUserDetails().getUsrdCity());
	 			user.setUsrdEmail(usersModel.getUserDetails().getUsrdEmail());
	 			user.setUsrdShpAddr1(usersModel.getUserDetails().getUsrdShpAddr1());
	 			user.setUsrdShpAddr2(usersModel.getUserDetails().getUsrdShpAddr2());
	 			user.setUsrdMob(usersModel.getUserDetails().getUsrdMob());
	 			user.setUsrdPostCode(usersModel.getUserDetails().getUsrdPostCode());
	 			user.setUsrdState(usersModel.getUserDetails().getUsrdState());
	 			//user.setUsers(user);
	 			usersService.createOrUpdateUser(user);
	 		}
	 		usersList = usersService.getUsers();
	 		model.addAttribute("userGroupsList", userGroups);
	 		model.addAttribute("userTypeList",userTypes);
	 		model.addAttribute("usersList",usersList);
	 		model.addAttribute("states",StringUtils.convertListToMap(states));
	 		model.addAttribute("usermodel",new UsersModel());
	        return "create-user";
	    }
	 	
	 	@RequestMapping(value = { "/updateuser" }, method = RequestMethod.POST)
	    public String updateUser(@ModelAttribute("usermodel")UsersModel usersModel, 
	    	      BindingResult result, ModelMap model) {
	 		List<UserGroupsModel> userGroups = usersService.getUserGroups();
	 		List<UsersModel> users = usersService.getUsers();
	 		List<UserTypes> userTypes = usersService.getUserTypes();
	 		List<UsersModel> usersList = usersService.getUsers();
	 		List<ValueO> states = utilityService.getMalaysiaStates();
	 		boolean isEmailUnique = true;
	 		if( users != null && !users.isEmpty() ) {
	 			for( UsersModel usrM :  users ) {
	 				if( usrM.getUserDetails().getUsrdEmail().equals(usersModel.getUserDetails().getUsrdEmail()) ) {
	 					isEmailUnique = false;
	 					break;
	 				}
	 			}
	 		}
	 		if( isEmailUnique ) {
	 			Users user = usersService.getUserById(usersModel.getUsrId().toString());
	 			Date currentTimestamp = new Date();
	 			UserTypes userType = usersService.getUserTypeById(usersModel.getUserTypes().getUtId().toString());
	 			UserGroups userGroup = usersService.getUserGroupById(usersModel.getUserGroups().getUsrGrpId().toString());
	 			user.setUsrName(usersModel.getUserDetails().getUsrdEmail());
	 			user.setUsrCrtdDt(currentTimestamp);
	 			user.setUsrPassword("lazz123");
	 			user.setUsrUptdDt(currentTimestamp);
	 			user.setUserGroups(userGroup);
	 			user.setUserTypes(userType);
	 			//user.setUserDetails(new UserDetails());
	 			user.setUsrdCity(usersModel.getUserDetails().getUsrdCity());
	 			user.setUsrdEmail(usersModel.getUserDetails().getUsrdEmail());
	 			user.setUsrdShpAddr1(usersModel.getUserDetails().getUsrdShpAddr1());
	 			user.setUsrdShpAddr2(usersModel.getUserDetails().getUsrdShpAddr2());
	 			user.setUsrdMob(usersModel.getUserDetails().getUsrdMob());
	 			user.setUsrdPostCode(usersModel.getUserDetails().getUsrdPostCode());
	 			user.setUsrdState(usersModel.getUserDetails().getUsrdState());
	 			usersService.createOrUpdateUser(user);
	 		}
	 		usersList = usersService.getUsers();
	 		model.addAttribute("userGroupsList", userGroups);
	 		model.addAttribute("userTypeList",userTypes);
	 		model.addAttribute("usersList",usersList);
	 		model.addAttribute("states",StringUtils.convertListToMap(states));
	 		model.addAttribute("usermodel",new UsersModel());
	        return "update-user";
	    }
	 	
}
