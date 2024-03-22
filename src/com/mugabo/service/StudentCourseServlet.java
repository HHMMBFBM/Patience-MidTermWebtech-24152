package com.mugabo.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mugabo.controller.CourseDao;
import com.mugabo.controller.StudentCourseDao;
import com.mugabo.controller.StudentRegistrationDao;
import com.mugabo.domain.Course;
import com.mugabo.domain.StudentCourse;
import com.mugabo.domain.StudentRegistration;

public class StudentCourseServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private StudentCourseDao studentCourseDao = new StudentCourseDao();
	private CourseDao courseDao = new CourseDao();
	private StudentRegistrationDao studentRegistrationDao = new StudentRegistrationDao();
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		doPost(req, res);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		saveStudentCourse(req, res);
	}
	
	public void saveStudentCourse(HttpServletRequest req, HttpServletResponse res) {
		
		try {
		    String credits = req.getParameter("credits"); // Use the correct field name
		    String results = req.getParameter("results"); // Use the correct field name
		    String studentregistration = req.getParameter("regig").trim(); // Trim leading/trailing whitespace
		    Integer courseCode = Integer.parseInt(req.getParameter("course")); // Parse to Integer

		    StudentCourse studentCourse = new StudentCourse();

		    studentCourse.setCredits(Integer.parseInt(credits)); // Assuming credits is an integer
		    studentCourse.setResults(results);

		    // You should retrieve the StudentRegistration and Course based on their codes
		    StudentRegistration studentRegistration = studentRegistrationDao.getStudentRegistrationByCode(Integer.parseInt(studentregistration));
		    Course course = courseDao.getCourseByCode(courseCode);

		    studentCourse.setStudentregistration(studentRegistration);
		    studentCourse.setCourse(course);

		    studentCourseDao.saveStudentCourse(studentCourse);

		    req.getRequestDispatcher("adminDashboard.jsp").forward(req, res);
		} catch (Exception e) {
		    e.printStackTrace();
		}


		
	}
}
