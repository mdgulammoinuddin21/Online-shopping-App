package com.rockstar.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rockstar.service.impl.ProductServiceImpl;

/**
 * Servlet implementation class SupplierRemoveProductSrv
 */
@WebServlet("/SupplierRemoveProductSrv")
public class SupplierRemoveProductSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userType = (String) session.getAttribute("usertype");
		String userName = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");

		if (userType == null || !userType.equals("supplier")) {

			response.sendRedirect("login.jsp?message=Access Denied!");
			return;

		}

		else if (userName == null || password == null) {

			response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
			return;
		}

		String prodId = request.getParameter("prodid");

		ProductServiceImpl product = new ProductServiceImpl();

		String status = product.removeProductBySupplier(prodId, userName);

		RequestDispatcher rd = request.getRequestDispatcher("supplierHome.jsp?message=" + status);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

