package com.lazz.service.dao;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lazz.service.domain.Products;

/**
 * Home object for domain model class Products.
 * @see com.lazz.service.dao.ProductsModel
 * @author Hibernate Tools
 */
@Stateless
public class ProductsHome {

	private static final Log log = LogFactory.getLog(ProductsHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Products transientInstance) {
		log.debug("persisting Products instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Products persistentInstance) {
		log.debug("removing Products instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Products merge(Products detachedInstance) {
		log.debug("merging Products instance");
		try {
			Products result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Products findById(Integer id) {
		log.debug("getting Products instance with id: " + id);
		try {
			Products instance = entityManager.find(Products.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
