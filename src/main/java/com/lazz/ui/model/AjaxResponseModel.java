package com.lazz.ui.model;

import java.util.ArrayList;
import java.util.List;

public class AjaxResponseModel {
	public String statusCode;
	public String statusMessage;
	public String productCount = "0";
	public List<ProductsModel> productsModelList = new ArrayList<ProductsModel>(0);
	public Float totalAmount = 0.0F;
	
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getStatusMessage() {
		return statusMessage;
	}
	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}
	public String getProductCount() {
		return productCount;
	}
	public void setProductCount(String productCount) {
		this.productCount = productCount;
	}
	public List<ProductsModel> getProductsModelList() {
		return productsModelList;
	}
	public void setProductsModelList(List<ProductsModel> productsModelList) {
		this.productsModelList = productsModelList;
	}
	public Float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Float totalAmount) {
		this.totalAmount = totalAmount;
	}
	
}
