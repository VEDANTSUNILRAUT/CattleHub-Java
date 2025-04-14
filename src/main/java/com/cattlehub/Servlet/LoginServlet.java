package com.cattlehub.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.cattlehub.dao.usersDao;
import com.cattlehub.entities.users;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    try {
	        usersDao dao = new usersDao(DBConnection.getConnection());
	        users u = dao.getUserByEmailAndPassword(email, password);

	        HttpSession session = request.getSession();

	        if (u == null) {
	            session.setAttribute("errorMsg", "Invalid email or password!");
	            System.out.println("Login Failed for email: " + email); // ❌ Failed login
	            response.sendRedirect("login.jsp");
	        } else {
	            session.setAttribute("currentUser", u);
	            System.out.println("Login Successful for user: " + u.getFull_name() + " (" + u.getEmail() + ")"); // ✅ Success
	            response.sendRedirect("home.jsp");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.getSession().setAttribute("errorMsg", "Something went wrong. Please try again.");
	        System.out.println("Login Error for email: " + email); // ⚠️ Exception case
	        response.sendRedirect("login.jsp");
	    }
	}
}
