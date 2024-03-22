package com.mugabo.service;

import com.mugabo.domain.Student;
import com.mugabo.view.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object roleObj = session.getAttribute("role"); // Assuming 'role' attribute is set during login
        
        String role = null;
        if (roleObj != null) {
            role = roleObj.toString();
        }
        
        String regno = request.getParameter("regno");
        String fullname = request.getParameter("fullname");
        String dateofbirth = request.getParameter("dateofbirth");

        Student student = new Student(regno, fullname, dateofbirth);

        Transaction transaction = null;
        try (Session hibernateSession = HibernateUtil.getSession().openSession()) {
            // Start a transaction
            transaction = hibernateSession.beginTransaction();
            // Save the student object
            hibernateSession.save(student);
            // Commit the transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

        // Redirect based on the user role
        if ("admin".equalsIgnoreCase(role)) {
            response.sendRedirect("ListStudentsServlet"); // Redirecting admin to the list of students
        } else {
            response.sendRedirect("studentDashboard.jsp"); // Redirecting student to their dashboard
        }
    }
}
