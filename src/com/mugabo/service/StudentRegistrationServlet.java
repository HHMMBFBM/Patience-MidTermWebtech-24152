package com.mugabo.service;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mugabo.controller.AcademicUnitDao;
import com.mugabo.controller.SemesterDao;
import com.mugabo.controller.StudentDao;
import com.mugabo.controller.StudentRegistrationDao;
import com.mugabo.domain.AcademicUnit;
import com.mugabo.domain.Eregistration;
import com.mugabo.domain.Semester;
import com.mugabo.domain.Student;
import com.mugabo.domain.StudentRegistration;

public class StudentRegistrationServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private StudentRegistrationDao studentRegistrationDao = new StudentRegistrationDao();
	private StudentDao studentDao = new StudentDao();
	private AcademicUnitDao academicUnitDao = new AcademicUnitDao();
	private SemesterDao SemesterDao = new SemesterDao();
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		doPost(req, res);		
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		saveStudentRegistration(req, res);
	}
	
	public void saveStudentRegistration(HttpServletRequest req, HttpServletResponse res) {
		
		try {
		    String studentId = req.getParameter("code");
		    String registrationDate = req.getParameter("date");
		    String academicUnitCode = req.getParameter("academicunitcode");
		    Eregistration status = Eregistration.valueOf("PENDING");
		    
		    Long semesterCode = Long.parseLong(req.getParameter("semestercode"));

		    // Retrieve the student based on the studentId
		    Student student = studentDao.getStudentById(studentId);

		    if (student == null) {
		        // Handle the case when the student is not found
		        // You can redirect or return an error message
		    } else {
		        StudentRegistration registration = new StudentRegistration();

		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		        java.util.Date startDate = dateFormat.parse(registrationDate);
		        Date sqlStartDate = new Date(startDate.getTime());
		        registration.setRegistrationDate(sqlStartDate);

		        registration.setRegno(student);
		        // Retrieve the academic unit based on its code
		        AcademicUnit academicUnit = academicUnitDao.getAcademicUnitByCode(academicUnitCode);
		        registration.setAcademicunit(academicUnit);
		        // Retrieve the semester based on its code
		        Semester semester = SemesterDao.getSemesterByCode(semesterCode);
		        registration.setSemester(semester);
		        registration.setStatus(status);

		        studentRegistrationDao.saveStudentRegistration(registration);
		        req.getRequestDispatcher("studentDashboard.jsp").forward(req, res);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}

		
	}
}
