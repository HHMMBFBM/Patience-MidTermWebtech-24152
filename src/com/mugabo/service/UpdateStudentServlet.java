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
import java.io.IOException;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String regno = request.getParameter("regno");
        String fullname = request.getParameter("fullname");
        String dateofbirth = request.getParameter("dateofbirth");

        Transaction transaction = null;
        try (Session session = HibernateUtil.getSession().openSession()) {
            transaction = session.beginTransaction();
            Student student = session.get(Student.class, regno);
            if (student != null) {
                student.setFullname(fullname);
                student.setDateofbirth(dateofbirth);
                session.update(student);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        response.sendRedirect("ListStudentsServlet");
    }
}
