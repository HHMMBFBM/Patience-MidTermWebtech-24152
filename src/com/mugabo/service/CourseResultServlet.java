package com.mugabo.service;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mugabo.controller.ResultDao;
import com.mugabo.domain.Course;

public class CourseResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ResultDao resultDao = new ResultDao();

 // CourseResultServlet.java
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long courseSemesterId = Long.parseLong(request.getParameter("courseSemesterId"));
        String selectedDepartment = request.getParameter("department"); // Get the selected department

        // Get courses based on the selected course semester ID and department
        List<Course> courses = resultDao.getCoursesBySemesterAndDepartment(courseSemesterId, selectedDepartment);

        // Set the retrieved course data as an attribute in the request
        request.setAttribute("courses", courses);

        RequestDispatcher dispatcher = request.getRequestDispatcher("Result.jsp");
        dispatcher.forward(request, response);
    }

}
