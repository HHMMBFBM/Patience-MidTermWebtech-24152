package com.mugabo.controller;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.domain.CourseDefinition;
import com.mugabo.view.HibernateUtil;


public class CourseDefinitionDao {

	public void saveCourseDefinition(CourseDefinition courseDefinition) {
		Transaction transaction = null;
		try {
			
			Session session = HibernateUtil.getSession().openSession();
			transaction = session.beginTransaction();
			session.save(courseDefinition);
			transaction.commit();
			session.close();
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		
	}
	public CourseDefinition getCourseDefinitionByCode(String code) {
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        CourseDefinition courseDefinition = (CourseDefinition) session
	            .createQuery("from CourseDefinition where code = :code")
	            .setParameter("code", code)
	            .uniqueResult();
	        session.close();
	        return courseDefinition;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

}
