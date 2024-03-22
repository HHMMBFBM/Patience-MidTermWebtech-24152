package com.mugabo.service;

import com.mugabo.domain.Student;
import com.mugabo.view.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.query.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ListStudentsServlet")
public class ListStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Session session = HibernateUtil.getSession().openSession()) {
            Query<Student> query = session.createQuery("from Student", Student.class);
            List<Student> studentList = query.list();
            request.setAttribute("studentList", studentList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/list-students.jsp").forward(request, response);
    }
}
