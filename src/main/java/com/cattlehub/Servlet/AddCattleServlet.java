package com.cattlehub.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.cattlehub.dao.CattleDao;
import com.cattlehub.entities.cattle;
import com.cattlehub.entities.users;
import com.cattlehub.Servlet.DBConnection;

@WebServlet("/AddCattleServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 5,
    maxRequestSize = 1024 * 1024 * 10
)
public class AddCattleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_FOLDER = "cattle_images";
    private static final Set<String> ALLOWED_TYPES = new HashSet<>(Arrays.asList("image/jpeg", "image/png", "image/webp"));

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");

        try {
            Part filePart = request.getPart("cattle_img");
            if (filePart == null || filePart.getSize() == 0) {
                response.getWriter().write("no_file_uploaded");
                return;
            }

            if (!ALLOWED_TYPES.contains(filePart.getContentType())) {
                response.getWriter().write("invalid_file_type");
                return;
            }

            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_FOLDER;
            Files.createDirectories(Paths.get(uploadPath));

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, Paths.get(uploadPath).resolve(fileName), StandardCopyOption.REPLACE_EXISTING);
            }

            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            double weight = Double.parseDouble(request.getParameter("weight"));
            String breed = request.getParameter("breed");
            int cid = Integer.parseInt(request.getParameter("cid"));
            double price = Double.parseDouble(request.getParameter("price"));

            HttpSession session = request.getSession();
            users currentUser = (users) session.getAttribute("currentUser");
            if (currentUser == null) {
                response.getWriter().write("unauthorized");
                return;
            }

            cattle cattleObj = new cattle(name, age, weight, breed, cid, price, fileName, currentUser.getUsers_id());
            CattleDao dao = new CattleDao(DBConnection.getConnection());

            if (dao.saveCattle(cattleObj)) {
            	response.getWriter().write("done");

            } else {
                Files.deleteIfExists(Paths.get(uploadPath).resolve(fileName));
                response.getWriter().write("error");
            }


        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        }
    }
}
