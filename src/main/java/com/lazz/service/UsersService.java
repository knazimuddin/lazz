package com.lazz.service;

import java.util.List;

import com.lazz.service.domain.UserGroups;
import com.lazz.service.domain.UserTypes;
import com.lazz.service.domain.Users;
import com.lazz.ui.model.UserGroupsModel;
import com.lazz.ui.model.UsersModel;

public interface UsersService {
	public List<UsersModel> getUsers();
	
	public List<UserGroupsModel> getUserGroups();
	public void deleteUserGroup(String usrGrpId);
	public UserGroupsModel getUserGroups(String usrGrpId);
	public void createOrUpdateUserGroup(UserGroups userGroup);
	public UserGroups getUserGroupById(String usrGrpId);
	public List<UserTypes> getUserTypes();
	public Users getUserById(String usrId);
	public UsersModel getUserModelById(String usrId);
	public void deleteUser(String usrId);
	public UserTypes getUserTypeById(String usrTypeId);
	public Integer getMaxUserId();
	public void createOrUpdateUser(Users user);
	//this is duplicate method
	public List<UserGroups> getUserGroupsOnly();
	public Users getUserByIdAndPassword(String userName, String password);
	public UserTypes getUserTypeByType(String type);
	
	public boolean isEmailIdExists(String email);
	
	public UserGroups getUserGroupByGrpCd(String usrGrpCd);
}
