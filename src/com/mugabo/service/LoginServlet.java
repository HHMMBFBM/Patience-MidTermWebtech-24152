package com.mugabo.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mugabo.controller.UsersDao;
import com.mugabo.domain.Users;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private UsersDao usersDao = new UsersDao();

 // ... other parts of the LoginServlet ...

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Users user = usersDao.getUserByEmailAndPassword(email, password);

        if (user != null) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("user", user); // Store user object in session
            session.setAttribute("role", user.getRole()); // Store user role in session for later checks
            
            // Consider session security practices here
            session.setMaxInactiveInterval(30 * 60); // for example, 30 minutes

            // Redirect to appropriate dashboard
            dispatchUser(request, response, user.getRole());
        } else {
            // Login failed
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }


    private void dispatchUser(HttpServletRequest request, HttpServletResponse response, String role)
            throws IOException {
        if ("admin".equals(role)) {
            response.sendRedirect("adminDashboard.jsp");
        } else if ("teacher".equals(role)) {
            response.sendRedirect("teacherDashboard.jsp");
        } else if ("student".equals(role)) {
            response.sendRedirect("studentDashboard.jsp");
        } else {
            response.sendRedirect("loginFailure.jsp");
        }
    }
}