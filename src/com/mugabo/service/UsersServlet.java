package com.mugabo.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mugabo.controller.UsersDao;
import com.mugabo.domain.Users;

public class UsersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UsersDao usersDao = new UsersDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        saveUser(req, res);
    }

    protected void saveUser(HttpServletRequest req, HttpServletResponse res) {
        try {
            // Parsing 'id' from request. Adjust the parsing as needed based on the actual type of 'id'.
            Integer id = null;
            try {
                id = Integer.parseInt(req.getParameter("id"));
            } catch (NumberFormatException e) {
                // Handle case where 'id' is not a valid integer, if necessary
            }
            
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String role = "student"; // Assuming a default role, adjust as needed.

            Users user = new Users();
            if(id != null) {
                user.setId(id); // Only set the ID if it was successfully parsed
            }
            user.setEmail(email);
            user.setPassword(password);
            user.setRole(role);

            usersDao.saveUser(user); // Make sure this method exists and properly saves the user to the database.

            req.getRequestDispatcher("Login.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            // Consider adding error handling here, such as redirecting to an error page or showing an error message.
        }
    }
}
