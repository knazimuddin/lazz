package com.lazz.service.dao;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lazz.service.domain.PrdPriceRules;

/**
 * Home object for domain model class PrdPriceRules.
 * @see com.lazz.service.dao.PrdPriceRulesModel
 * @author Hibernate Tools
 */
@Stateless
public class PrdPriceRulesHome {

	private static final Log log = LogFactory.getLog(PrdPriceRulesHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(PrdPriceRules transientInstance) {
		log.debug("persisting PrdPriceRules instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(PrdPriceRules persistentInstance) {
		log.debug("removing PrdPriceRules instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public PrdPriceRules merge(PrdPriceRules detachedInstance) {
		log.debug("merging PrdPriceRules instance");
		try {
			PrdPriceRules result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public PrdPriceRules findById(Integer id) {
		log.debug("getting PrdPriceRules instance with id: " + id);
		try {
			PrdPriceRules instance = entityManager.find(PrdPriceRules.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
