package com.cattlehub.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.cattlehub.dao.usersDao;
import com.cattlehub.entities.users;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistrationServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Fetch form data
		String full_name = request.getParameter("full_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String role = request.getParameter("role");

		// Create user object
		Timestamp created_at = new Timestamp(new Date().getTime());
		users user = new users(full_name, email, password, phone, address, role, created_at);

		// DB connection
		Connection con = null;
		try {
			con = DBConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		usersDao dao = new usersDao(con);

		boolean success = dao.saveUser(user);

		if (success) {
		    response.sendRedirect("registration.jsp?success");
		} else {
		    response.sendRedirect("registration.jsp?error");
		}

	}
}
