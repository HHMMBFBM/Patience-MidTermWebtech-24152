package com.mugabo.service;

import com.mugabo.controller.TeacherDao;
import com.mugabo.domain.Equalification;
import com.mugabo.domain.Teacher;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddTeacherServlet")
public class AddTeacherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String qualificationString = request.getParameter("qualification");
        String courseIdString = request.getParameter("courseId");
        
        Equalification qualification = Equalification.valueOf(qualificationString.toUpperCase());
        
        UUID courseId = null;
        if (courseIdString != null && !courseIdString.isEmpty()) {
            courseId = UUID.fromString(courseIdString);
        }

        Teacher teacher = new Teacher(code, firstName + " " + lastName, qualification);
        TeacherDao dao = new TeacherDao();
        dao.addTeacher(teacher);

        response.sendRedirect("adminDashboard.jsp"); // Redirect back to the admin dashboard or to a confirmation page
    }
}
