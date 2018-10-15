package com.lazz.service;

import java.util.List;

import com.lazz.service.domain.Invoice;
import com.lazz.service.domain.Users;

public interface InvoiceService {
	public List<Invoice> getInvoicesForLoggedInUser(Users user);
	
	public Invoice getInvoiceByInvId(String invId);
	
	public List<Invoice> getInvoicesForIds(List<String> invoiceIds);
	
	public void saveOrUpdateInvoices(List<Invoice> invoices);
}
