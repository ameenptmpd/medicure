package com.staragile.medicure.medicure;

import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class Medicure {

	@Id
	String bankingId;
	String customerName;
	String customerAddress;
	String contactNumber;
	
	
	public Medicure() {
		super();
	}
	
	
	public Medicure(String bankingId, String customerName, String customerAddress, String contactNumber) {
		super();
		this.bankingId = bankingId;
		this.customerName = customerName;
		this.customerAddress = customerAddress;
		this.contactNumber = contactNumber;
	}
	
	public String getbankingId() {
		return bankingId;
	}
	public void setBankingId(String bankingId) {
		this.bankingId = bankingId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
}
