package com.lazz.ui.model;
// Generated Jul 22, 2018 7:33:01 PM by Hibernate Tools 5.2.10.Final

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.lazz.service.domain.Products;


/**
 * Products generated by hbm2java
 */
public class ProductsModel  {

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
	private MultipartFile prdImage;
	private String count = "1";
	private float quantityTotal;

	public Integer getPrdId() {
		return this.prdId;
	}

	public void setPrdId(Integer prdId) {
		this.prdId = prdId;
	}

	public String getPrdName() {
		return this.prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public String getPrdUnqId() {
		return this.prdUnqId;
	}

	public void setPrdUnqId(String prdUnqId) {
		this.prdUnqId = prdUnqId;
	}

	public String getPrdSkuNum() {
		return this.prdSkuNum;
	}

	public void setPrdSkuNum(String prdSkuNum) {
		this.prdSkuNum = prdSkuNum;
	}

	public int getPrdRetailPoints() {
		return this.prdRetailPoints;
	}

	public void setPrdRetailPoints(int prdRetailPoints) {
		this.prdRetailPoints = prdRetailPoints;
	}

	public String getPrdImgPath() {
		return this.prdImgPath;
	}

	public void setPrdImgPath(String prdImgPath) {
		this.prdImgPath = prdImgPath;
	}

	public float getPrdRetailPrice() {
		return this.prdRetailPrice;
	}

	public void setPrdRetailPrice(float prdRetailPrice) {
		this.prdRetailPrice = prdRetailPrice;
	}

	public Date getPrdCrtdDt() {
		return this.prdCrtdDt;
	}

	public void setPrdCrtdDt(Date prdCrtdDt) {
		this.prdCrtdDt = prdCrtdDt;
	}

	public Date getPrdUptdDt() {
		return this.prdUptdDt;
	}

	public void setPrdUptdDt(Date prdUptdDt) {
		this.prdUptdDt = prdUptdDt;
	}


	

	/*@OneToMany(fetch = FetchType.LAZY, mappedBy = "products")
	public Set<ProdCfg> getProdCfgs() {
		return this.prodCfgs;
	}

	public void setProdCfgs(Set<ProdCfg> prodCfgs) {
		this.prodCfgs = prodCfgs;
	}*/
	
	public int getPrdRulesPoints() {
		return prdRulesPoints;
	}

	public void setPrdRulesPoints(int prdRulesPoints) {
		this.prdRulesPoints = prdRulesPoints;
	}

	public Products convertModelToDomain() {
		Products products = new Products();
		products.setPrdId(prdId);
		products.setPrdName(prdName);
		products.setPrdUnqId(prdUnqId);
		products.setPrdSkuNum(prdSkuNum);
		products.setPrdRetailPoints(prdRetailPoints);
		products.setPrdImgPath(prdImgPath);
		products.setPrdRetailPrice(prdRetailPrice);
		products.setPrdRulesPoints(prdRulesPoints);
		//products.setPrdUptdDt(prdUptdDt);
		//products.set
		return products;
	}
	
	public Products convertModelToDomain(Products products) {
		//products.setPrdId(prdId);
		products.setPrdName(prdName);
		products.setPrdUnqId(prdUnqId);
		products.setPrdSkuNum(prdSkuNum);
		products.setPrdRetailPoints(prdRetailPoints);
		//products.setPrdImgPath(prdImgPath);
		products.setPrdRetailPrice(prdRetailPrice);
		products.setPrdRulesPoints(prdRulesPoints);
		//products.setPrdUptdDt(prdUptdDt);
		
		//products.set
		return products;
	}
	
	public ProductsModel convertDomainToModel(Products product) {
		ProductsModel productsModel = new ProductsModel();
		productsModel.setPrdId(product.getPrdId());
		productsModel.setPrdName(product.getPrdName());
		productsModel.setPrdUnqId(product.getPrdUnqId());
		productsModel.setPrdSkuNum(product.getPrdSkuNum());
		productsModel.setPrdRetailPoints(product.getPrdRetailPoints());
		//productsModel.setPrdImgPath(product.getPrdImgPath());
		productsModel.setPrdRetailPrice(product.getPrdRetailPrice());
		productsModel.setPrdRulesPoints(product.getPrdRulesPoints());
		productsModel.setPrdCrtdDt(product.getPrdCrtdDt());
		productsModel.setPrdUptdDt(product.getPrdUptdDt());
		
		//products.set
		return productsModel;
	}

	public MultipartFile getPrdImage() {
		return prdImage;
	}

	public void setPrdImage(MultipartFile prdImage) {
		this.prdImage = prdImage;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
	
	public float getQuantityTotal() {
		return Float.valueOf(count)*prdRetailPrice;
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
		ProductsModel other = (ProductsModel) obj;
		if (prdId == null) {
			if (other.getPrdId() != null)
				return false;
		} else if (!prdId.equals(other.getPrdId()))
			return false;
		return true;
	}
}
