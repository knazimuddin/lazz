package com.lazz.service.domain;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Invoice generated by hbm2java
 */
@Entity
@Table(name = "invoice", catalog = "lazz_db_dev")
public class Invoice implements java.io.Serializable {

	private Integer invcId;
	private Date invcDt;
	private Users usrId;
	private String invcStage;
	private Users invcAccptBy;
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
	private Set<InvoiceDetails> invoiceDetailses = new HashSet<InvoiceDetails>(0);
	private Float invSubAmt;
	private int paymentType;

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "invc_id", unique = true, nullable = false)
	public Integer getInvcId() {
		return this.invcId;
	}

	public void setInvcId(Integer invcId) {
		this.invcId = invcId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "invc_dt", nullable = false, length = 0)
	public Date getInvcDt() {
		return this.invcDt;
	}

	public void setInvcDt(Date invcDt) {
		this.invcDt = invcDt;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "usr_id")
	public Users getUsrId() {
		return this.usrId;
	}

	public void setUsrId(Users usrId) {
		this.usrId = usrId;
	}

	@Column(name = "invc_stage", nullable = false, length = 50)
	public String getInvcStage() {
		return this.invcStage;
	}

	public void setInvcStage(String invcStage) {
		this.invcStage = invcStage;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "invc_accpt_by")
	public Users getInvcAccptBy() {
		return this.invcAccptBy;
	}

	public void setInvcAccptBy(Users invcAccptBy) {
		this.invcAccptBy = invcAccptBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "invc_accpt_dt", nullable = false, length = 0)
	public Date getInvcAccptDt() {
		return this.invcAccptDt;
	}

	public void setInvcAccptDt(Date invcAccptDt) {
		this.invcAccptDt = invcAccptDt;
	}

	@Column(name = "invc_shipment_add_1", length = 50)
	public String getInvcShipmentAdd1() {
		return this.invcShipmentAdd1;
	}

	public void setInvcShipmentAdd1(String invcShipmentAdd1) {
		this.invcShipmentAdd1 = invcShipmentAdd1;
	}

	@Column(name = "invc_shipment_add_2", length = 50)
	public String getInvcShipmentAdd2() {
		return this.invcShipmentAdd2;
	}

	public void setInvcShipmentAdd2(String invcShipmentAdd2) {
		this.invcShipmentAdd2 = invcShipmentAdd2;
	}

	@Column(name = "invc_shipment_post_code", length = 50)
	public String getInvcShipmentPostCode() {
		return this.invcShipmentPostCode;
	}

	public void setInvcShipmentPostCode(String invcShipmentPostCode) {
		this.invcShipmentPostCode = invcShipmentPostCode;
	}

	@Column(name = "invc_recpt_mob", length = 50)
	public String getInvcRecptMob() {
		return this.invcRecptMob;
	}

	public void setInvcRecptMob(String invcRecptMob) {
		this.invcRecptMob = invcRecptMob;
	}

	@Column(name = "invc_recpt_email", length = 50)
	public String getInvcRecptEmail() {
		return this.invcRecptEmail;
	}

	public void setInvcRecptEmail(String invcRecptEmail) {
		this.invcRecptEmail = invcRecptEmail;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "invc_crtd_dt", nullable = false, length = 0)
	public Date getInvcCrtdDt() {
		return this.invcCrtdDt;
	}

	public void setInvcCrtdDt(Date invcCrtdDt) {
		this.invcCrtdDt = invcCrtdDt;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "invc_uptd_dt", nullable = false, length = 0)
	public Date getInvcUptdDt() {
		return this.invcUptdDt;
	}

	public void setInvcUptdDt(Date invcUptdDt) {
		this.invcUptdDt = invcUptdDt;
	}

	@Column(name = "invc_amt", nullable = false, precision = 12, scale = 0)
	public float getInvcAmt() {
		return this.invcAmt;
	}

	public void setInvcAmt(float invcAmt) {
		this.invcAmt = invcAmt;
	}

	@Column(name = "invc_dis", nullable = false, precision = 12, scale = 0)
	public Float getInvcDis() {
		return this.invcDis;
	}

	public void setInvcDis(Float invcDis) {
		this.invcDis = invcDis;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "invoice", cascade=CascadeType.ALL)
	public Set<InvoiceDetails> getInvoiceDetailses() {
		return this.invoiceDetailses;
	}

	public void setInvoiceDetailses(Set<InvoiceDetails> invoiceDetailses) {
		this.invoiceDetailses = invoiceDetailses;
	}

	@Column(name = "invc_sub_amt", nullable = false, precision = 12, scale = 0)
	public Float getInvSubAmt() {
		return invSubAmt;
	}

	public void setInvSubAmt(Float invSubAmt) {
		this.invSubAmt = invSubAmt;
	}

	@Column(name = "pymt_type", nullable = false)
	public int getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(int paymentType) {
		this.paymentType = paymentType;
	}
	
}
