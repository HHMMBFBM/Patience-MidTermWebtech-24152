package com.mugabo.service;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mugabo.controller.SemesterDao;
import com.mugabo.domain.Semester;


public class SemesterServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private SemesterDao semesterDao = new SemesterDao();
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		doPost(req, res);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
			saveSemester(req, res);
	}
	
	public void saveSemester(HttpServletRequest req, HttpServletResponse res){
	    try {
	        String semname = req.getParameter("name");
	        String semstartdate = req.getParameter("start");
	        String semenddate = req.getParameter("end");
	        
	            Semester semester = new Semester();

	            semester.setName(semname);
	            
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            
	            
	                java.util.Date startDate = dateFormat.parse(semstartdate);
	                Date sqlStartDate = new Date(startDate.getTime());
	                semester.setStartDate(sqlStartDate);
	    
	                java.util.Date endDate = dateFormat.parse(semenddate);
	                Date sqlEndDate = new Date(endDate.getTime());
	                semester.setEndDate(sqlEndDate);
	            
	            
	            semesterDao.saveSemester(semester);
	            req.getRequestDispatcher("adminDashboard.jsp").forward(req, res);
	        
	        
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


}
