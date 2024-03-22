package com.mugabo.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mugabo.controller.AcademicUnitDao;
import com.mugabo.domain.AcademicUnit;
import com.mugabo.domain.Eacademicunit;

public class AcademicUnitServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private AcademicUnitDao academicUnitDao = new AcademicUnitDao();
	
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        List<AcademicUnit> allAcademicUnits = academicUnitDao.getAllAcademicUnits();
        req.setAttribute("allAcademicUnits", allAcademicUnits);
        req.getRequestDispatcher("AcademicUnit.jsp").forward(req, res);
    }

    // Handles the POST request to save the academic unit
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        saveAcademicUnit(req, res);
    }

	
	public void saveAcademicUnit(HttpServletRequest req, HttpServletResponse res) {
		
		try {
		    String acacode = req.getParameter("code");
		    String acaname = req.getParameter("name");
		    String acatype = req.getParameter("type");
		    String acapcode = req.getParameter("parent");
		    AcademicUnit parentAcademicUnit = academicUnitDao.getAcademicUnitByCode(acapcode);

		    // Convert the string to the enum value
		    Eacademicunit academicType = Eacademicunit.valueOf(acatype);

		    AcademicUnit academicUnit = new AcademicUnit();
		    academicUnit.setCode(acacode);
		    academicUnit.setName(acaname);
		    academicUnit.setAcademicType(academicType); // Set the enum value
		    academicUnit.setParentAcademic(parentAcademicUnit);

		    academicUnitDao.saveAcademicUnit(academicUnit);

		    req.getRequestDispatcher("AcademicUnit.jsp").forward(req, res);
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}
		
	
}
