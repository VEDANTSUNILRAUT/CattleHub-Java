package com.cattlehub.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Don't create a new session

        if (session != null) {
            Object currentUser = session.getAttribute("currentUser");

            if (currentUser != null) {
                System.out.println("Logout Successfully....");
            } else {
                System.out.println("[ℹ️ LOGOUT INFO] No user attribute found in session.");
            }

            session.invalidate(); // Destroy session
            System.out.println("Session ended successfully.....");
        } else {
            System.out.println("[⚠️ LOGOUT WARNING] No active session found to invalidate.");
        }

        response.sendRedirect("index.jsp"); // Redirect to homepage
    }
}
