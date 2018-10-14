package com.lazz.ui.model;

import java.util.ArrayList;
import java.util.List;

import com.lazz.utils.ValueO;

public class CartWrapper {
	private List<ProductsModel> products = new ArrayList<ProductsModel>(0);
	private float subTotal = 0.0F;
	private List<ValueO> shippingAddressList = new ArrayList<ValueO>(0);
	private String selectedAddress;
	private List<ValueO> paymentOptions = new ArrayList<ValueO>(0);
	private String paymentOptionSelected;
	private float total = 0.0F;
	public List<ProductsModel> getProducts() {
		return products;
	}
	public void setProducts(List<ProductsModel> products) {
		this.products = products;
	}
	public float getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}
	public List<ValueO> getShippingAddressList() {
		return shippingAddressList;
	}
	public void setShippingAddressList(List<ValueO> shippingAddressList) {
		this.shippingAddressList = shippingAddressList;
	}
	public String getSelectedAddress() {
		return selectedAddress;
	}
	public void setSelectedAddress(String selectedAddress) {
		this.selectedAddress = selectedAddress;
	}
	public List<ValueO> getPaymentOptions() {
		return paymentOptions;
	}
	public void setPaymentOptions(List<ValueO> paymentOptions) {
		this.paymentOptions = paymentOptions;
	}
	public String getPaymentOptionSelected() {
		return paymentOptionSelected;
	}
	public void setPaymentOptionSelected(String paymentOptionSelected) {
		this.paymentOptionSelected = paymentOptionSelected;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	
	
}
