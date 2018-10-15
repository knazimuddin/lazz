package com.lazz.service.dao;

import java.util.List;

import com.lazz.service.domain.Invoice;
import com.lazz.service.domain.Users;

public interface InvoiceDAO {
	public List<Invoice> getInvoicesForLoggedInUser(Users user);
	public Invoice getInvoiceByInvId(String invId);
	public List<Invoice> findInvoicesByIds(List<String> invoiceIds);
}
