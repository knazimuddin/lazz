package com.lazz.service.domain;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * InvoiceDetails generated by hbm2java
 */
@Entity
@Table(name = "invoice_details", catalog = "lazz_db_dev")
public class InvoiceDetails implements java.io.Serializable {

	private Integer invcDtId;
	private Invoice invoice;
	private ProdCfg prodCfg;
	private Integer count;
	private Float productAmount;

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "invc_dt_id", unique = true, nullable = false)
	public Integer getInvcDtId() {
		return this.invcDtId;
	}

	public void setInvcDtId(Integer invcDtId) {
		this.invcDtId = invcDtId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "invc_id", nullable = false)
	public Invoice getInvoice() {
		return this.invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "prd_cfg_id")
	public ProdCfg getProdCfg() {
		return this.prodCfg;
	}

	public void setProdCfg(ProdCfg prodCfg) {
		this.prodCfg = prodCfg;
	}

	@Column(name = "prd_cnt", nullable = false)
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Column(name = "prd_amt", nullable = false)
	public Float getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(Float productAmount) {
		this.productAmount = productAmount;
	}
	
	

}
