package com.lazz.ui.model;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import java.util.Date;

/**
 * Hq generated by hbm2java
 */
public class HqModel  {

	private Integer hqId;
	private String hqName;
	private String hqDesc;
	private String hqAddress;
	private Date createdDt;
	private Date updatedDt;

	public HqModel() {
	}

	public HqModel(String hqName, Date createdDt, Date updatedDt) {
		this.hqName = hqName;
		this.createdDt = createdDt;
		this.updatedDt = updatedDt;
	}

	public HqModel(String hqName, String hqDesc, String hqAddress, Date createdDt, Date updatedDt) {
		this.hqName = hqName;
		this.hqDesc = hqDesc;
		this.hqAddress = hqAddress;
		this.createdDt = createdDt;
		this.updatedDt = updatedDt;
	}

	public Integer getHqId() {
		return this.hqId;
	}

	public void setHqId(Integer hqId) {
		this.hqId = hqId;
	}

	public String getHqName() {
		return this.hqName;
	}

	public void setHqName(String hqName) {
		this.hqName = hqName;
	}

	public String getHqDesc() {
		return this.hqDesc;
	}

	public void setHqDesc(String hqDesc) {
		this.hqDesc = hqDesc;
	}

	public String getHqAddress() {
		return this.hqAddress;
	}

	public void setHqAddress(String hqAddress) {
		this.hqAddress = hqAddress;
	}

	public Date getCreatedDt() {
		return this.createdDt;
	}

	public void setCreatedDt(Date createdDt) {
		this.createdDt = createdDt;
	}

	public Date getUpdatedDt() {
		return this.updatedDt;
	}

	public void setUpdatedDt(Date updatedDt) {
		this.updatedDt = updatedDt;
	}

}
