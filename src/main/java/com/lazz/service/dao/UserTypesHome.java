package com.lazz.service.dao;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lazz.service.domain.UserTypes;

/**
 * Home object for domain model class UserTypes.
 * @see com.lazz.service.dao.UserTypesModel
 * @author Hibernate Tools
 */
@Stateless
public class UserTypesHome {

	private static final Log log = LogFactory.getLog(UserTypesHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(UserTypes transientInstance) {
		log.debug("persisting UserTypes instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(UserTypes persistentInstance) {
		log.debug("removing UserTypes instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public UserTypes merge(UserTypes detachedInstance) {
		log.debug("merging UserTypes instance");
		try {
			UserTypes result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public UserTypes findById(Integer id) {
		log.debug("getting UserTypes instance with id: " + id);
		try {
			UserTypes instance = entityManager.find(UserTypes.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
