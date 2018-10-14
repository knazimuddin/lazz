package com.lazz.service.dao;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lazz.service.domain.ProdCfg;

/**
 * Home object for domain model class ProdCfg.
 * @see com.lazz.service.dao.ProdCfgModel
 * @author Hibernate Tools
 */
@Stateless
public class ProdCfgHome {

	private static final Log log = LogFactory.getLog(ProdCfgHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(ProdCfg transientInstance) {
		log.debug("persisting ProdCfg instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(ProdCfg persistentInstance) {
		log.debug("removing ProdCfg instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public ProdCfg merge(ProdCfg detachedInstance) {
		log.debug("merging ProdCfg instance");
		try {
			ProdCfg result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public ProdCfg findById(Integer id) {
		log.debug("getting ProdCfg instance with id: " + id);
		try {
			ProdCfg instance = entityManager.find(ProdCfg.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
