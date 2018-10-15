package com.lazz.ui.model;

import java.util.ArrayList;
import java.util.List;

import com.lazz.utils.ValueO;

public class CartWrapper {
	private List<ProductsModel> products = new ArrayList<ProductsModel>(0);
	private float subTotal = 0.0F;
	private String selectedAddress;
	private String paymentOptionSelected;
	private String shipmentOptionSelected;
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
	public String getSelectedAddress() {
		return selectedAddress;
	}
	public void setSelectedAddress(String selectedAddress) {
		this.selectedAddress = selectedAddress;
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
	public String getShipmentOptionSelected() {
		return shipmentOptionSelected;
	}
	public void setShipmentOptionSelected(String shipmentOptionSelected) {
		this.shipmentOptionSelected = shipmentOptionSelected;
	}
	
	
}
