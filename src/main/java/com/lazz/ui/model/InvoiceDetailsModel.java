package com.lazz.ui.model;

import com.lazz.service.domain.InvoiceDetails;

// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

/**
 * InvoiceDetails generated by hbm2java
 */
public class InvoiceDetailsModel  {

	private Integer invcDtId;
	private Integer prdId;
	private String prdName;

	
	public Integer getInvcDtId() {
		return this.invcDtId;
	}

	public void setInvcDtId(Integer invcDtId) {
		this.invcDtId = invcDtId;
	}

	public Integer getPrdId() {
		return prdId;
	}

	public void setPrdId(Integer prdId) {
		this.prdId = prdId;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public InvoiceDetailsModel convertDomainToModel(InvoiceDetails domain) {
		InvoiceDetailsModel invoiceDetailsModel = new InvoiceDetailsModel();
		invoiceDetailsModel.setInvcDtId(domain.getInvcDtId());
		invoiceDetailsModel.setPrdId(domain.getProdCfg().getProducts().getPrdId());
		invoiceDetailsModel.setPrdName(domain.getProdCfg().getProducts().getPrdName());
		return invoiceDetailsModel;
	}

}
