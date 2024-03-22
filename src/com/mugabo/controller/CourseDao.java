package com.mugabo.controller;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.domain.Course;
import com.mugabo.view.HibernateUtil;

public class CourseDao {

	public void saveCourse(Course course) {
		Transaction transaction = null;
		try {
			
			Session session = HibernateUtil.getSession().openSession();
			transaction = session.beginTransaction();
			session.save(course);
			transaction.commit();
			session.close();
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	public Course getCourseByCode(Integer code) {
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        Course course = (Course) session
	            .createQuery("from Course where code = :code")
	            .setParameter("code", code)
	            .uniqueResult();
	        session.close();
	        return course;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

}
