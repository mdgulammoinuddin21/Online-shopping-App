package com.rockstar.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rockstar.beans.SupplierBean;
import com.rockstar.service.SupplierService;
import com.rockstar.utility.DBUtil;
import com.rockstar.utility.MailMessage;

public class SupplierServiceImpl implements SupplierService {

	@Override
	public String registerSupplier(String userName, Long mobileNo, String emailId, String address, int pinCode,
			String password, String companyName) {

		SupplierBean supplier = new SupplierBean(userName, mobileNo, emailId, address, pinCode, password, companyName);

		String status = registerSupplier(supplier);

		return status;
	}

	@Override
	public String registerSupplier(SupplierBean supplier) {

		String status = "Supplier Registration Failed!";

		boolean isRegtd = isRegistered(supplier.getEmail());

		if (isRegtd) {
			status = "Email Id Already Registered!";
			return status;
		}
		Connection conn = DBUtil.provideConnection();
		PreparedStatement ps = null;
		if (conn != null) {
			System.out.println("Connected Successfully!");
		}

		try {

			ps = conn.prepareStatement("insert into supplier values(?,?,?,?,?,?,?)");

			ps.setString(1, supplier.getEmail());
			ps.setString(2, supplier.getName());
			ps.setLong(3, supplier.getMobile());
			ps.setString(4, supplier.getAddress());
			ps.setInt(5, supplier.getPinCode());
			ps.setString(6, supplier.getPassword());
			ps.setString(7, supplier.getCompanyName());

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "Supplier Registered Successfully!";
				MailMessage.registrationSuccess(supplier.getEmail(), supplier.getName().split(" ")[0]);
			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBUtil.closeConnection(conn);
		DBUtil.closeConnection(ps);

		return status;
	}

	@Override
	public boolean isRegistered(String emailId) {
		boolean flag = false;

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from supplier where email=?");

			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next())
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);

		return flag;
	}

	@Override
	public String isValidCredential(String emailId, String password) {
		String status = "Login Denied! Incorrect Email or Password";

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from supplier where email=? and password=?");

			ps.setString(1, emailId);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if (rs.next())
				status = "valid";

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		return status;
	}

	@Override
	public SupplierBean getSupplierDetails(String emailId, String password) {

		SupplierBean supplier = null;

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from supplier where email=? and password=?");
			ps.setString(1, emailId);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) {
				supplier = new SupplierBean();
				supplier.setName(rs.getString("name"));
				supplier.setMobile(rs.getLong("mobile"));
				supplier.setEmail(rs.getString("email"));
				supplier.setAddress(rs.getString("address"));
				supplier.setPinCode(rs.getInt("pincode"));
				supplier.setPassword(rs.getString("password"));
				supplier.setCompanyName(rs.getString("companyname"));

				return supplier;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);

		return supplier;
	}

	@Override
	public String getFName(String emailId) {
		String fname = "";

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select name from supplier where email=?");
			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next()) {
				fname = rs.getString(1);

				fname = fname.split(" ")[0];

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);

		return fname;
	}

	@Override
	public String getSupplierAddr(String supplierId) {
		String supplierAddr = "";

		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select address from supplier where email=?");

			ps.setString(1, supplierId);

			rs = ps.executeQuery();

			if (rs.next())
				supplierAddr = rs.getString(1);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);

		return supplierAddr;
	}

}

