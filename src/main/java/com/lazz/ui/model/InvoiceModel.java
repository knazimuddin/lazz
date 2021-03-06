package com.lazz.ui.model;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.lazz.service.domain.Invoice;
import com.lazz.service.domain.InvoiceDetails;

/**
 * Invoice generated by hbm2java
 */
public class InvoiceModel  {

	private Integer invcId;
	private Date invcDt;
	private int usrId;
	private String invcStage;
	private int invcAccptBy;
	private Date invcAccptDt;
	private String invcShipmentAdd1;
	private String invcShipmentAdd2;
	private String invcShipmentPostCode;
	private String invcRecptMob;
	private String invcRecptEmail;
	private Date invcCrtdDt;
	private Date invcUptdDt;
	private float invcAmt;
	private Float invcDis;
	private Set<InvoiceDetailsModel> invoiceDetailses = new HashSet<InvoiceDetailsModel>(0);
	private String editFlag = "N";

	public Integer getInvcId() {
		return this.invcId;
	}

	public void setInvcId(Integer invcId) {
		this.invcId = invcId;
	}

	public Date getInvcDt() {
		return this.invcDt;
	}

	public void setInvcDt(Date invcDt) {
		this.invcDt = invcDt;
	}

	public int getUsrId() {
		return this.usrId;
	}

	public void setUsrId(int usrId) {
		this.usrId = usrId;
	}

	public String getInvcStage() {
		return this.invcStage;
	}

	public void setInvcStage(String invcStage) {
		this.invcStage = invcStage;
	}

	public int getInvcAccptBy() {
		return this.invcAccptBy;
	}

	public void setInvcAccptBy(int invcAccptBy) {
		this.invcAccptBy = invcAccptBy;
	}

	public Date getInvcAccptDt() {
		return this.invcAccptDt;
	}

	public void setInvcAccptDt(Date invcAccptDt) {
		this.invcAccptDt = invcAccptDt;
	}

	public String getInvcShipmentAdd1() {
		return this.invcShipmentAdd1;
	}

	public void setInvcShipmentAdd1(String invcShipmentAdd1) {
		this.invcShipmentAdd1 = invcShipmentAdd1;
	}

	public String getInvcShipmentAdd2() {
		return this.invcShipmentAdd2;
	}

	public void setInvcShipmentAdd2(String invcShipmentAdd2) {
		this.invcShipmentAdd2 = invcShipmentAdd2;
	}

	public String getInvcShipmentPostCode() {
		return this.invcShipmentPostCode;
	}

	public void setInvcShipmentPostCode(String invcShipmentPostCode) {
		this.invcShipmentPostCode = invcShipmentPostCode;
	}

	public String getInvcRecptMob() {
		return this.invcRecptMob;
	}

	public void setInvcRecptMob(String invcRecptMob) {
		this.invcRecptMob = invcRecptMob;
	}

	public String getInvcRecptEmail() {
		return this.invcRecptEmail;
	}

	public void setInvcRecptEmail(String invcRecptEmail) {
		this.invcRecptEmail = invcRecptEmail;
	}

	public Date getInvcCrtdDt() {
		return this.invcCrtdDt;
	}

	public void setInvcCrtdDt(Date invcCrtdDt) {
		this.invcCrtdDt = invcCrtdDt;
	}

	public Date getInvcUptdDt() {
		return this.invcUptdDt;
	}

	public void setInvcUptdDt(Date invcUptdDt) {
		this.invcUptdDt = invcUptdDt;
	}

	public float getInvcAmt() {
		return this.invcAmt;
	}

	public void setInvcAmt(float invcAmt) {
		this.invcAmt = invcAmt;
	}

	public Float getInvcDis() {
		return this.invcDis;
	}

	public void setInvcDis(Float invcDis) {
		this.invcDis = invcDis;
	}

	public Set<InvoiceDetailsModel> getInvoiceDetailses() {
		return this.invoiceDetailses;
	}

	public void setInvoiceDetailses(Set<InvoiceDetailsModel> invoiceDetailses) {
		this.invoiceDetailses = invoiceDetailses;
	}

	public static InvoiceModel convertDomainToModel(Invoice domain) {
		InvoiceModel model = new InvoiceModel();
		model.setInvcId(domain.getInvcId());
		model.setInvcDt(domain.getInvcDt());
		model.setUsrId(domain.getUsrId().getUsrId());
		model.setInvcStage(domain.getInvcStage());
		
		if( domain.getInvcAccptBy() != null ) {
			model.setInvcAccptBy(domain.getInvcAccptBy().getUsrId());
		}
		
		if(  domain.getInvcAccptDt() != null) {
			model.setInvcAccptDt(domain.getInvcAccptDt());
		}
		model.setInvcShipmentAdd1(domain.getInvcShipmentAdd1());
		model.setInvcShipmentAdd2(domain.getInvcShipmentAdd2());
		model.setInvcShipmentPostCode(domain.getInvcShipmentPostCode());
		model.setInvcRecptMob(domain.getInvcRecptMob());
		model.setInvcRecptEmail(domain.getInvcRecptEmail());
		model.setInvcCrtdDt(domain.getInvcCrtdDt());
		model.setInvcUptdDt(domain.getInvcUptdDt());
		model.setInvcAmt(domain.getInvcAmt());
		model.setInvcDis(domain.getInvcDis());
		
		if( domain.getInvoiceDetailses() != null &&  domain.getInvoiceDetailses().size() > 0) {
			for( InvoiceDetails invoiceDetailsLoop :  domain.getInvoiceDetailses()) {
				model.getInvoiceDetailses().add(new InvoiceDetailsModel().convertDomainToModel(invoiceDetailsLoop));
			}
		}
		
		return model;
	}

	public String getEditFlag() {
		return editFlag;
	}

	public void setEditFlag(String editFlag) {
		this.editFlag = editFlag;
	}
	
	
}
