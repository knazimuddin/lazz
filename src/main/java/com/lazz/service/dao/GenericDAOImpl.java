package com.lazz.service.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GenericDAOImpl implements GenericDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void merge(Object obj) {
		sessionFactory.getCurrentSession().merge(obj);
	}

	@Override
	public void delete(Object obj) {
		sessionFactory.getCurrentSession().delete(obj);
	}
	
	
}
