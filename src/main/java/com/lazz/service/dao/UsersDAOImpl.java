package com.lazz.service.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lazz.service.domain.UserGroups;
import com.lazz.service.domain.UserTypes;
import com.lazz.service.domain.Users;

@Repository
public class UsersDAOImpl implements UsersDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Users> findUsers() {
		@SuppressWarnings("unchecked")
	    TypedQuery<Users> query = sessionFactory.getCurrentSession().createQuery("from Users");
	    return query.getResultList();
	}

	@Override
	public List<UserGroups> findUserGroups() {
		@SuppressWarnings("unchecked")
	    TypedQuery<UserGroups> query = sessionFactory.getCurrentSession().createQuery("from UserGroups");
	    return query.getResultList();
	}

	@Override
	public void mergeGroups(UserGroups userGroup) {
		sessionFactory.getCurrentSession().merge(userGroup);
	}

	@Override
	public UserGroups findUserGroups(String usrGrpId) {
		UserGroups userGroup = null;
		Session session = sessionFactory.getCurrentSession();
		userGroup = session.get(UserGroups.class, Integer.valueOf(usrGrpId));
		return userGroup;
	}

	@Override
	public void removeGroup(String usrGrpId) {
		Session session = sessionFactory.getCurrentSession();
		UserGroups userGroup = findUserGroups(usrGrpId);
		session.delete(userGroup);
	}
	 
	@Override
	public List<UserTypes> findUserTypes() {
		@SuppressWarnings("unchecked")
	    TypedQuery<UserTypes> query = sessionFactory.getCurrentSession().createQuery("from UserTypes order by utName");
	    return query.getResultList();
	}

	@Override
	public Users findUser(String usrId) {
		Users users = null;
		Session session = sessionFactory.getCurrentSession();
		users = session.get(Users.class, Integer.valueOf(usrId));
		return users;
	}
	
	@Override
	public void mergeUsers(Users user) {
		sessionFactory.getCurrentSession().merge(user);
	}

	@Override
	public void removeUser(String usrId) {
		Session session = sessionFactory.getCurrentSession();
		Users users = findUser(usrId);
		session.delete(users);
	}

	@Override
	public UserTypes findUserTypes(String usrTypeId) {
		UserTypes userTypes = null;
		Session session = sessionFactory.getCurrentSession();
		userTypes = session.get(UserTypes.class, Integer.valueOf(usrTypeId));
		return userTypes;
	}
	
	@Override
	public Integer getMaxUserId() {
		Integer maxAge = null;
		try {
			Criteria criteria = sessionFactory.getCurrentSession()
				    .createCriteria(Users.class)
				    .setProjection(Projections.max("usrId"));
			maxAge = (Integer)criteria.uniqueResult();
			
		}catch(Exception e) {
		}
		
		if( maxAge == null ) {
			maxAge = 1;
		}
		
		return maxAge;
	}

	@Override
	public Users findUserByIdAndPassword(String userName, String password) {
		Users users = null;
		String sql = "from Users u where u.usrName=:usrName and u.usrPassword = :usrPassword";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setString("usrName", userName);
		query.setString("usrPassword", password);
		
		List<Users> usersList = query.list();
		if( usersList != null && usersList.size()>0 ) {
			users = usersList.get(0);
		}
		
		return users;
	}

	@Override
	public UserTypes findUserTypeByType(String usrType) {
		UserTypes userTypes = null;
		String sql = "from UserTypes ut where ut.utName = :utName";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setString("utName", usrType);
		List<UserTypes> userTypesList = query.list();
		if( userTypesList != null && userTypesList.size() > 0 ) {
			userTypes = userTypesList.get(0);
		}
		return userTypes;
	}
	
	@Override
	public boolean emailExists(String email) {
		boolean isEmailUnique = false;
		String sql = "from Users u where u.usrdEmail=:usrdEmail";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setString("usrdEmail", email);
		
		List<Users> usersList = query.list();
		if( usersList == null || usersList.size()==0 ) {
			isEmailUnique = true;
		}
		
		return isEmailUnique;
	}

	@Override
	public UserGroups findUserGroupsByGroupCode(String usrGrpCd) {
		UserGroups usrGroup = null;
		String sql = "from UserGroups u where u.usrGrpName=:usrGrpCd";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setString("usrGrpCd", usrGrpCd);
		
		List<UserGroups> userGroups = query.list();
		if( userGroups != null && userGroups.size() > 0 ) {
			usrGroup = userGroups.get(0);
		}
		
		return usrGroup;
	}
}
