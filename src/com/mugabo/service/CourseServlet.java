package com.mugabo.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mugabo.controller.AcademicUnitDao;
import com.mugabo.controller.CourseDao;
import com.mugabo.controller.CourseDefinitionDao;
import com.mugabo.controller.SemesterDao;
import com.mugabo.controller.TeacherDao;
import com.mugabo.domain.AcademicUnit;
import com.mugabo.domain.Course;
import com.mugabo.domain.CourseDefinition;
import com.mugabo.domain.Semester;
import com.mugabo.domain.Teacher;

public class CourseServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private CourseDao courseDao = new CourseDao();
	private CourseDefinitionDao courseDefinitionDao = new CourseDefinitionDao();
	private TeacherDao teacherDao = new TeacherDao();
	private SemesterDao semesterDao = new SemesterDao();
	private AcademicUnitDao academicUnitDao = new AcademicUnitDao();
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		doPost(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		saveCourse(req, res);
	}
	
	public void saveCourse(HttpServletRequest req, HttpServletResponse res) {

	    try {
	        String crcoursedefinition = req.getParameter("coursecode");
	        String crteacher = req.getParameter("teachercode");
	        String crsemester = req.getParameter("semestercode");
	        long crsemesterCode = Long.parseLong(crsemester);
	        String cracademicunit = req.getParameter("academicunitcode");
	        	        
	        // Retrieve the actual entities based on the codes
	        CourseDefinition courseDefinition = courseDefinitionDao.getCourseDefinitionByCode(crcoursedefinition);
	        Teacher teacher = teacherDao.getTeacherByCode(crteacher);
	        
	        Semester semester = semesterDao.getSemesterByCode(crsemesterCode);
	        
	        AcademicUnit academicUnit = academicUnitDao.getAcademicUnitByCode(cracademicunit);

	        Course course = new Course();

	        course.setCousedefinition(courseDefinition);
	        course.setTeacher(teacher);
	        course.setSemester(semester);
	        course.setAcademicunit(academicUnit);

	        courseDao.saveCourse(course);

	        req.getRequestDispatcher("adminDashboard.jsp").forward(req, res);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	}


}
