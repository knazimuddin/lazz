package com.lazz.service.dao;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lazz.service.domain.Hq;

/**
 * Home object for domain model class Hq.
 * @see com.lazz.service.dao.HqModel
 * @author Hibernate Tools
 */
@Stateless
public class HqHome {

	private static final Log log = LogFactory.getLog(HqHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Hq transientInstance) {
		log.debug("persisting Hq instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Hq persistentInstance) {
		log.debug("removing Hq instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Hq merge(Hq detachedInstance) {
		log.debug("merging Hq instance");
		try {
			Hq result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Hq findById(Integer id) {
		log.debug("getting Hq instance with id: " + id);
		try {
			Hq instance = entityManager.find(Hq.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
