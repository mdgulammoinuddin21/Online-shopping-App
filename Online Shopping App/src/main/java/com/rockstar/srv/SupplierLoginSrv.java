package com.rockstar.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rockstar.beans.SupplierBean;
import com.rockstar.service.impl.SupplierServiceImpl;

/**
 * Servlet implementation class SupplierLoginSrv
 */
@WebServlet("/SupplierLoginSrv")
public class SupplierLoginSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String userType = request.getParameter("usertype");
		response.setContentType("text/html");

		String status = "Login Denied! Invalid Username or password.";

		if (userType.equals("supplier")) { // Login as Supplier

			SupplierServiceImpl sdao = new SupplierServiceImpl();

			status = sdao.isValidCredential(userName, password);

			if (status.equalsIgnoreCase("valid")) {
				// valid user

				SupplierBean supplier = sdao.getSupplierDetails(userName, password);

				HttpSession session = request.getSession();

				session.setAttribute("supplierdata", supplier);

				session.setAttribute("username", userName);
				session.setAttribute("password", password);
				session.setAttribute("usertype", userType);

				RequestDispatcher rd = request.getRequestDispatcher("supplierHome.jsp");

				rd.forward(request, response);

			} else {
				// invalid user;

				RequestDispatcher rd = request.getRequestDispatcher("login.jsp?message=" + status);

				rd.forward(request, response);

			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

