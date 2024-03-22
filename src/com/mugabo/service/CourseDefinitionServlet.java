package com.mugabo.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mugabo.controller.CourseDefinitionDao;
import com.mugabo.domain.CourseDefinition;

public class CourseDefinitionServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private CourseDefinitionDao courseDefinitionDao = new CourseDefinitionDao();
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		doPost(req, res);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		saveCourseDefinition(req, res);
	}
	
	public void saveCourseDefinition(HttpServletRequest req, HttpServletResponse res) {
		
		try {
			
			String coursecode = req.getParameter("code");
			String coursename = req.getParameter("name");
			String coursedescription = req.getParameter("description");
			
			CourseDefinition courseDefinition = new CourseDefinition();
			
			courseDefinition.setCode(coursecode);
			courseDefinition.setName(coursename);
			courseDefinition.setDescription(coursedescription);
			
			courseDefinitionDao.saveCourseDefinition(courseDefinition);
			
			req.getRequestDispatcher("adminDashboard.jsp").forward(req, res);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
