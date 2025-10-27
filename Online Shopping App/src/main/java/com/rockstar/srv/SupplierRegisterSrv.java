package com.rockstar.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rockstar.beans.SupplierBean;
import com.rockstar.service.impl.SupplierServiceImpl;

/**
 * Servlet implementation class SupplierRegisterSrv
 */
@WebServlet("/SupplierRegisterSrv")
public class SupplierRegisterSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String userName = request.getParameter("username");
		Long mobileNo = Long.parseLong(request.getParameter("mobile"));
		String emailId = request.getParameter("email");
		String address = request.getParameter("address");
		int pinCode = Integer.parseInt(request.getParameter("pincode"));
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String companyName = request.getParameter("companyname");
		String status = "";
		if (password != null && password.equals(confirmPassword)) {
			SupplierBean supplier = new SupplierBean(userName, mobileNo, emailId, address, pinCode, password, companyName);

			SupplierServiceImpl dao = new SupplierServiceImpl();

			status = dao.registerSupplier(supplier);
		} else {
			status = "Password not matching!";
		}

		RequestDispatcher rd = request.getRequestDispatcher("supplierRegister.jsp?message=" + status);

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

