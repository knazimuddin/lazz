package com.lazz.service.domain;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Products generated by hbm2java
 */
@Entity
@Table(name = "products", catalog = "lazz_db_dev", uniqueConstraints = @UniqueConstraint(columnNames = "prd_unq_id"))
public class Products implements java.io.Serializable {

	private Integer prdId;
	private String prdName;
	private String prdUnqId;
	private String prdSkuNum;
	private int prdRetailPoints;
	private String prdImgPath;
	private float prdRetailPrice;
	private int prdRulesPoints;
	private Date prdCrtdDt;
	private Date prdUptdDt;
	//private Set<InvoiceDetails> invoiceDetailses = new HashSet<InvoiceDetails>(0);
	//private Set<ProdCfg> prodCfgs = new HashSet<ProdCfg>(0);

	/*public Products() {
	}

	public Products(String prdUnqId, String prdSkuNum, int prdRetailPoints, float prdRetailPrice, Date prdCrtdDt,
			Date prdUptdDt) {
		this.prdUnqId = prdUnqId;
		this.prdSkuNum = prdSkuNum;
		this.prdRetailPoints = prdRetailPoints;
		this.prdRetailPrice = prdRetailPrice;
		this.prdCrtdDt = prdCrtdDt;
		this.prdUptdDt = prdUptdDt;
	}

	public Products(String prdName, String prdUnqId, String prdSkuNum, int prdRetailPoints, String prdImgPath,
			float prdRetailPrice, Date prdCrtdDt, Date prdUptdDt, Set invoiceDetailses, Set prodCfgs) {
		this.prdName = prdName;
		this.prdUnqId = prdUnqId;
		this.prdSkuNum = prdSkuNum;
		this.prdRetailPoints = prdRetailPoints;
		this.prdImgPath = prdImgPath;
		this.prdRetailPrice = prdRetailPrice;
		this.prdCrtdDt = prdCrtdDt;
		this.prdUptdDt = prdUptdDt;
		this.invoiceDetailses = invoiceDetailses;
		this.prodCfgs = prodCfgs;
	}
	
	public Products(String prdName, String prdUnqId, String prdSkuNum, int prdRetailPoints, String prdImgPath,
			float prdRetailPrice, Date prdCrtdDt, Date prdUptdDt, Set invoiceDetailses) {
		this.prdName = prdName;
		this.prdUnqId = prdUnqId;
		this.prdSkuNum = prdSkuNum;
		this.prdRetailPoints = prdRetailPoints;
		this.prdImgPath = prdImgPath;
		this.prdRetailPrice = prdRetailPrice;
		this.prdCrtdDt = prdCrtdDt;
		this.prdUptdDt = prdUptdDt;
		this.invoiceDetailses = invoiceDetailses;
		//this.prodCfgs = prodCfgs;
	}*/

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "prd_id", unique = true, nullable = false)
	public Integer getPrdId() {
		return this.prdId;
	}

	public void setPrdId(Integer prdId) {
		this.prdId = prdId;
	}

	@Column(name = "prd_name", length = 50)
	public String getPrdName() {
		return this.prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	@Column(name = "prd_unq_id", unique = true, nullable = false, length = 50)
	public String getPrdUnqId() {
		return this.prdUnqId;
	}

	public void setPrdUnqId(String prdUnqId) {
		this.prdUnqId = prdUnqId;
	}

	@Column(name = "prd_sku_num", nullable = false, length = 100)
	public String getPrdSkuNum() {
		return this.prdSkuNum;
	}

	public void setPrdSkuNum(String prdSkuNum) {
		this.prdSkuNum = prdSkuNum;
	}

	@Column(name = "prd_retail_points", nullable = false)
	public int getPrdRetailPoints() {
		return this.prdRetailPoints;
	}

	public void setPrdRetailPoints(int prdRetailPoints) {
		this.prdRetailPoints = prdRetailPoints;
	}

	@Column(name = "prd_img_path", length = 100)
	public String getPrdImgPath() {
		return this.prdImgPath;
	}

	public void setPrdImgPath(String prdImgPath) {
		this.prdImgPath = prdImgPath;
	}

	@Column(name = "prd_retail_price", nullable = false, precision = 12, scale = 0)
	public float getPrdRetailPrice() {
		return this.prdRetailPrice;
	}

	public void setPrdRetailPrice(float prdRetailPrice) {
		this.prdRetailPrice = prdRetailPrice;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "prd_crtd_dt", nullable = false, length = 0)
	public Date getPrdCrtdDt() {
		return this.prdCrtdDt;
	}

	public void setPrdCrtdDt(Date prdCrtdDt) {
		this.prdCrtdDt = prdCrtdDt;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "prd_uptd_dt", nullable = false, length = 0)
	public Date getPrdUptdDt() {
		return this.prdUptdDt;
	}

	public void setPrdUptdDt(Date prdUptdDt) {
		this.prdUptdDt = prdUptdDt;
	}

	@Column(name = "prd_rules_points", nullable = false)
	public int getPrdRulesPoints() {
		return prdRulesPoints;
	}

	public void setPrdRulesPoints(int prdRulesPoints) {
		this.prdRulesPoints = prdRulesPoints;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((prdId == null) ? 0 : prdId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Products other = (Products) obj;
		if (prdId == null) {
			if (other.prdId != null)
				return false;
		} else if (!prdId.equals(other.prdId))
			return false;
		return true;
	}

	/*@OneToMany(fetch = FetchType.LAZY, mappedBy = "products")
	public Set<ProdCfg> getProdCfgs() {
		return this.prodCfgs;
	}

	public void setProdCfgs(Set<ProdCfg> prodCfgs) {
		this.prodCfgs = prodCfgs;
	}*/
	
	

}