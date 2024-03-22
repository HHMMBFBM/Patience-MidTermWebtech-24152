package com.mugabo.controller;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.domain.Semester;
import com.mugabo.view.HibernateUtil;

public class SemesterDao {

	public void saveSemester(Semester semester) {
		
		Transaction transaction = null;
		try {
			
			Session session = HibernateUtil.getSession().openSession();
			transaction = session.beginTransaction();
			
			session.save(semester);
			transaction.commit();
			session.close();
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		
	}
	public Semester getSemesterByCode(Long code) {
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        Semester semester = (Semester) session
	            .createQuery("from Semester where id = :code")
	            .setParameter("code", code)
	            .uniqueResult();
	        session.close();
	        return semester;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}


}
