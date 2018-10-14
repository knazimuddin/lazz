package com.lazz.service.dao;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lazz.service.domain.Invoice;

/**
 * Home object for domain model class Invoice.
 * @see com.lazz.service.dao.InvoiceModel
 * @author Hibernate Tools
 */
@Stateless
public class InvoiceHome {

	private static final Log log = LogFactory.getLog(InvoiceHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Invoice transientInstance) {
		log.debug("persisting Invoice instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Invoice persistentInstance) {
		log.debug("removing Invoice instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Invoice merge(Invoice detachedInstance) {
		log.debug("merging Invoice instance");
		try {
			Invoice result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Invoice findById(Integer id) {
		log.debug("getting Invoice instance with id: " + id);
		try {
			Invoice instance = entityManager.find(Invoice.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
