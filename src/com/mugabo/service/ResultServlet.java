package com.mugabo.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.controller.ResultDao;
import com.mugabo.domain.CourseData;
import com.mugabo.domain.StudentRegistration;
import com.mugabo.view.HibernateUtil;


public class ResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ResultDao resultDao = new ResultDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long semesterId = Long.parseLong(request.getParameter("semesterId"));
        String selectedDepartment = request.getParameter("department");

        List<StudentRegistration> students = resultDao.getStudentsBySemesterWithJoin(semesterId);

        // Filter students based on the selected department
        List<StudentRegistration> departmentStudents = new ArrayList<>();
        for (StudentRegistration student : students) {
            if (student.getAcademicunit().getCode().equals(selectedDepartment)) {
                departmentStudents.add(student);
            }
        }

        request.setAttribute("students", students);
        request.setAttribute("departmentStudents", departmentStudents); // Add department students to the request

        Session session2 = HibernateUtil.getSession().openSession();
        Transaction transaction = session2.beginTransaction();

        List<Object[]> data = session2.createSQLQuery(
            "SELECT sr.id, sr.regno, sr.registrationdate, c.code, cd.name " +
            "FROM studentregistration sr " +
            "INNER JOIN studentcourse sc ON sr.id = sc.studentregistration " +
            "INNER JOIN course c ON sc.course_code = c.code " +
            "INNER JOIN coursedefinition cd ON c.coursedefinition_code = cd.code " +
            "ORDER BY sr.regno"
        ).list();

        transaction.commit();
        session2.close();
        
     // Convert the data to CourseData objects
        List<CourseData> courseDataList = new ArrayList<>();
        for (Object[] row : data) {
            CourseData courseData = new CourseData();
            courseData.setId((Integer) row[0]);
            courseData.setRegNo((String) row[1]);
            courseData.setRegistrationDate((Date) row[2]);
            courseData.setCourseCode((Integer) row[3]);
            courseData.setCourseName((String) row[4]);
            courseDataList.add(courseData);
        }

        // Set the courseDataList as a request attribute
        request.setAttribute("courseDataList", courseDataList);



        RequestDispatcher dispatcher = request.getRequestDispatcher("Result.jsp");
        dispatcher.forward(request, response);
    }

}
