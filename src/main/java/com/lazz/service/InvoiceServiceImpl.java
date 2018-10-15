package com.lazz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lazz.service.dao.GenericDAO;
import com.lazz.service.dao.InvoiceDAO;
import com.lazz.service.domain.Invoice;
import com.lazz.service.domain.Users;

@Service
public class InvoiceServiceImpl implements InvoiceService{

	@Autowired
	private InvoiceDAO invoiceDAO;
	
	@Autowired
	private GenericDAO genericDAO;
	
	@Transactional
	@Override
	public List<Invoice> getInvoicesForLoggedInUser(Users user) {
		return invoiceDAO.getInvoicesForLoggedInUser(user);
	}
	
	@Transactional
	@Override
	public Invoice getInvoiceByInvId(String invId) {
		return invoiceDAO.getInvoiceByInvId(invId);
	}

	@Override
	@Transactional
	public List<Invoice> getInvoicesForIds(List<String> invoiceIds) {
		return invoiceDAO.findInvoicesByIds(invoiceIds);
	}

	@Override
	@Transactional
	public void saveOrUpdateInvoices(List<Invoice> invoices) {
		for( Invoice invoice : invoices) {
			genericDAO.merge(invoice);
		}
	}
	
	

}
