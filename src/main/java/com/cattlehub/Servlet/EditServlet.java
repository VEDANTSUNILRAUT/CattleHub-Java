package com.cattlehub.Servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.cattlehub.dao.usersDao;
import com.cattlehub.entities.users;
import com.cattlehub.helper.Helper;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch form data
        String userFullName = request.getParameter("user_name");
        String userEmail = request.getParameter("user_email");
        String userPhone = request.getParameter("user_phone");
        String userAddress = request.getParameter("user_address");
        String userRole = request.getParameter("user_role");
        
        // Handle file upload
        Part part = request.getPart("profile_image");
        String imageName = (part != null) ? part.getSubmittedFileName() : null;

        // For now, just print the data in logs (optional)
        System.out.println("Name: " + userFullName);
        System.out.println("Email: " + userEmail);
        System.out.println("Phone: " + userPhone);
        System.out.println("Address: " + userAddress);
        System.out.println("Role: " + userRole);
        System.out.println("Image Name: " + imageName);
        
//        get the user from the session.
        HttpSession s=request.getSession();
        users user = (users) s.getAttribute("currentUser");
        user.setFull_name(userFullName);
        user.setEmail(userEmail);
        user.setPhone(userPhone);
        user.setAddress(userAddress);
        user.setRole(userRole);
        user.setProfile_image(imageName); // Add this line!
        
    


       
//       update database
        usersDao userDao = null;
		try {
			userDao = new usersDao(DBConnection.getConnection());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        boolean ans = userDao.updateUser(user);
        
        if (ans) {
            // Corrected path
            String uploadDir = "C:\\Users\\rauts\\OneDrive\\Desktop\\JAVA WORKPLACE\\CattleHub\\WebContent\\uploads";
            File uploadPath = new File(uploadDir);
            if (!uploadPath.exists()) uploadPath.mkdirs();

            String fullImagePath = uploadDir + File.separator + user.getProfile_image();

            Helper.deleteFile(fullImagePath);

            if (Helper.saveFile(part.getInputStream(), fullImagePath)) {
                System.out.println("✅ User data and image updated successfully.");
            } else {
                System.out.println("⚠️ User data updated, but failed to save image.");
            }
        } else {
            System.out.println("❌ Failed to update user data.");
        }


        // Optional: Redirect or forward after processing
        response.sendRedirect("userProfile.jsp"); // or wherever you want to redirect
    }
}
