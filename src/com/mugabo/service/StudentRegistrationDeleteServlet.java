package com.mugabo.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mugabo.controller.StudentRegistrationDao;
import com.mugabo.domain.Eregistration;
import com.mugabo.domain.StudentRegistration;

public class StudentRegistrationDeleteServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private StudentRegistrationDao studentRegistrationDao = new StudentRegistrationDao();
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		doPost(req, res);		
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		saveStudentRegistration(req, res);
	}
	
	public void saveStudentRegistration(HttpServletRequest req, HttpServletResponse res) {
	    try {
	        String studentIdStr = req.getParameter("code");
	        int studentId = Integer.parseInt(studentIdStr);
	        
	        StudentRegistration registration = new StudentRegistration();
	        
	        registration.setId(studentId);
	        
	        studentRegistrationDao.deleteStudentRegistration(registration);

	        req.getRequestDispatcher("adminDashboard.jsp").forward(req, res);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
