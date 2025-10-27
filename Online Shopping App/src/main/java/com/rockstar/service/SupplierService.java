package com.rockstar.service;

import com.rockstar.beans.SupplierBean;

public interface SupplierService {

	public String registerSupplier(String userName, Long mobileNo, String emailId, String address, int pinCode,
			String password, String companyName);

	public String registerSupplier(SupplierBean supplier);

	public boolean isRegistered(String emailId);

	public String isValidCredential(String emailId, String password);

	public SupplierBean getSupplierDetails(String emailId, String password);

	public String getFName(String emailId);

	public String getSupplierAddr(String supplierId);

}

