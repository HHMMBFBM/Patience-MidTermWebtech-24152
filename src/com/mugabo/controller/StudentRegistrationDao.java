package com.mugabo.controller;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.domain.Eregistration;
import com.mugabo.domain.StudentRegistration;
import com.mugabo.view.HibernateUtil;

public class StudentRegistrationDao {

	public void saveStudentRegistration(StudentRegistration studentRegistration) {
		
		Transaction transaction = null;
		try {
			
			Session session = HibernateUtil.getSession().openSession();
			transaction = session.beginTransaction();
			
			session.save(studentRegistration);
			transaction.commit();
			session.close();
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		
	}
	public void updateStudentRegistrationStatus(Integer registrationId, Eregistration newStatus) {
	    Transaction transaction = null;
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        transaction = session.beginTransaction();

	        StudentRegistration studentRegistration = session.get(StudentRegistration.class, registrationId);
	        if (studentRegistration != null) {
	            studentRegistration.setStatus(newStatus);
	            session.update(studentRegistration);
	        }

	        transaction.commit();
	        session.close();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    }
	}

	
	public void deleteStudentRegistration(StudentRegistration studentRegistration) {
		
		Transaction transaction = null;
		try {
			
			Session session = HibernateUtil.getSession().openSession();
			transaction = session.beginTransaction();
			
			session.delete(studentRegistration);
			transaction.commit();
			session.close();
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		
	}
	
	public StudentRegistration getStudentRegistrationByCode(Integer code) {
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        StudentRegistration studentRegistration = (StudentRegistration) session
	            .createQuery("from StudentRegistration where id = :code")
	            .setParameter("code", code)
	            .uniqueResult();
	        session.close();
	        return studentRegistration;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

}
