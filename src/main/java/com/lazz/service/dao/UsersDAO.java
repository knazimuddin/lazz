package com.lazz.service.dao;

import java.util.List;

import com.lazz.service.domain.UserGroups;
import com.lazz.service.domain.UserTypes;
import com.lazz.service.domain.Users;

public interface UsersDAO {
	public List<Users> findUsers();
	
	public List<UserGroups> findUserGroups();
	
	public UserGroups findUserGroups(String usrGrpId);
	
	public void mergeGroups(UserGroups userGroup);
	
	public void removeGroup(String usrGrpId);
	
	public List<UserTypes> findUserTypes();
	
	public Users findUser(String usrId);
	
	public void mergeUsers(Users user);
	
	public void removeUser(String usrId);
	
	public UserTypes findUserTypes(String usrTypeId);
	
	public Integer getMaxUserId();
	
	public Users findUserByIdAndPassword(String userName, String password);
	
	public UserTypes findUserTypeByType(String usrType);
	
	public boolean emailExists(String email);
	
	public UserGroups findUserGroupsByGroupCode(String usrGrpCd);
}
