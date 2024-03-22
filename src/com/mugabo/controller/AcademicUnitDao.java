package com.mugabo.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.domain.AcademicUnit;
import com.mugabo.view.HibernateUtil;

public class AcademicUnitDao {

	public void saveAcademicUnit(AcademicUnit academicUnit) {
		
		Transaction transaction = null;
		try {
			
			Session session = HibernateUtil.getSession().openSession();
			transaction = session.beginTransaction();
			session.save(academicUnit);
			transaction.commit();
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public AcademicUnit getAcademicUnitByCode(String code) {
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        AcademicUnit academicUnit = (AcademicUnit) session
	            .createQuery("from AcademicUnit where code = :code")
	            .setParameter("code", code)
	            .uniqueResult();
	        System.out.println("Parent Code fetched successfully."+academicUnit);
	        session.close();
	        return academicUnit;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	public List<AcademicUnit> getAllAcademicUnits() {
	    List<AcademicUnit> units = null;
	    Session session = null;
	    try {
	        session = HibernateUtil.getSession().openSession();
	        units = session.createQuery("from AcademicUnit", AcademicUnit.class).list();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    return units;
	}


}
