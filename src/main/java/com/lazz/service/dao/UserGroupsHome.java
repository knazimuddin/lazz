package com.lazz.service.dao;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lazz.service.domain.UserGroups;

/**
 * Home object for domain model class UserGroups.
 * @see com.lazz.service.dao.UserGroupsModel
 * @author Hibernate Tools
 */
@Stateless
public class UserGroupsHome {

	private static final Log log = LogFactory.getLog(UserGroupsHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(UserGroups transientInstance) {
		log.debug("persisting UserGroups instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(UserGroups persistentInstance) {
		log.debug("removing UserGroups instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public UserGroups merge(UserGroups detachedInstance) {
		log.debug("merging UserGroups instance");
		try {
			UserGroups result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public UserGroups findById(Integer id) {
		log.debug("getting UserGroups instance with id: " + id);
		try {
			UserGroups instance = entityManager.find(UserGroups.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
