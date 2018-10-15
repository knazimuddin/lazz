package com.lazz.service.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.query.Query;

import com.lazz.service.domain.Invoice;
import com.lazz.service.domain.Users;
import com.lazz.utils.AppConstants;

@Repository
public class InvoiceDAOImpl implements InvoiceDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesForLoggedInUser(Users user){
		List<Invoice> invoicesList = null;
		Criteria crit = sessionFactory.getCurrentSession().createCriteria(Invoice.class);
		invoicesList = crit.add(Restrictions.or(
		        Restrictions.eq( "invcStage", AppConstants.INV_STAGE_ENTRY ),
		        Restrictions.eq("invcAccptBy.usrId", user.getUsrId())
		    ) )
		.addOrder( Order.desc("invcUptdDt") ).list();
		
		return invoicesList;
	}
	
	public Invoice getInvoiceByInvId(String invId) {
		Invoice invoice = null;
		String sql = " from  Invoice inv where inv.invcId = :invcId ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("invcId", invId);
		List<Invoice> invoices = query.list();
		if( invoices != null && invoices.size() > 0 ) {
			invoice = invoices.get(0);
		}
		return invoice;
	}

	@Override
	public List<Invoice> findInvoicesByIds(List<String> invoiceIds) {
		String sql = " from  Invoice inv where inv.invcId in (:invoiceIds) ";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameterList("invoiceIds", invoiceIds);
		List<Invoice> invoices = query.list();
		return invoices;
	}
}
