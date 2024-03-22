package com.mugabo.controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.domain.AcademicUnit;
import com.mugabo.domain.Course;
import com.mugabo.domain.CourseDefinition;
import com.mugabo.domain.Semester;
import com.mugabo.domain.Student;
import com.mugabo.domain.StudentCourse;
import com.mugabo.domain.StudentRegistration;
import com.mugabo.domain.Teacher;
import com.mugabo.view.HibernateUtil;

public class ReportDao {

	public List<Student> liststudents;
	public List<Semester> listsemester;
	public List<Teacher> listteacher;
	public List<AcademicUnit> listacademicunit;
	public List<CourseDefinition> listcoursedefinition;
	public List<Course> listcourse;
	public List<StudentCourse> liststudentcourse;
	public List<StudentRegistration> listStudentRegistration;


	
	@SuppressWarnings("unchecked")
	public List<Student> students(){
		Transaction transaction = null;
		
		try {
			
			Session session = HibernateUtil.getSession().openSession();
			transaction = session.beginTransaction();
			liststudents = session.createQuery("from Student").getResultList();
			
			transaction.commit();
			session.close();
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return liststudents;
	}
	
	@SuppressWarnings("unchecked")
	public List<Semester> semesters(){
		Transaction transaction = null;
		try {
			
			Session session = HibernateUtil.getSession().openSession();
			transaction = session.beginTransaction();
			System.out.println("Fetching teacher data...");
			listsemester = session.createQuery("from Semester").getResultList();
			System.out.println("Teacher data fetched successfully.");


			
			transaction.commit();
			session.close();
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listsemester;
	}
	
	@SuppressWarnings("unchecked")
	public List<Teacher> teachers() {
	    Transaction transaction = null;
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        transaction = session.beginTransaction();
	        listteacher = session.createQuery("from Teacher").getResultList();
	        
	        transaction.commit();
	        session.close();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    }
	    return listteacher;
	}

	
	@SuppressWarnings("unchecked")
	public List<AcademicUnit> academicUnits(){
		Transaction transaction = null;
		try {
			
			Session session = HibernateUtil.getSession().openSession();
			transaction = session.beginTransaction();
			System.out.println("Fetching AcademicUnit data...");
			listacademicunit = session.createQuery("from AcademicUnit").getResultList();
			System.out.println("AcademicUnit data fetched successfully.");
			
			transaction.commit();
			session.close();
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listacademicunit;
	}
	
	@SuppressWarnings("unchecked")
	public List<CourseDefinition> courseDefinitions() {
	    Transaction transaction = null;
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        transaction = session.beginTransaction();
	        System.out.println("Fetching CourseDefinition data...");
	        listcoursedefinition = session.createQuery("from CourseDefinition").getResultList();
	        System.out.println("CourseDefinition data fetched successfully.");

	        
	        transaction.commit();
	        session.close();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    }
	    return listcoursedefinition;
	}

	@SuppressWarnings("unchecked")
	public List<Course> course() {
	    Transaction transaction = null;
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        transaction = session.beginTransaction();
	        System.out.println("Fetching Course data...");
	        listcourse = session.createQuery("from Course").getResultList();
	        System.out.println("Course data fetched successfully.");

	        
	        transaction.commit();
	        session.close();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    }
	    return listcourse;
	}
	
	@SuppressWarnings("unchecked")
	public List<StudentCourse> studentcourse() {
	    Transaction transaction = null;
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        transaction = session.beginTransaction();
	        System.out.println("Fetching studentcourse data...");
	        liststudentcourse = session.createQuery("from StudentCourse").getResultList();
	        System.out.println("studentcourse data fetched successfully.");

	        
	        transaction.commit();
	        session.close();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    }
	    return liststudentcourse;
	}
	
	@SuppressWarnings("unchecked")
	public List<StudentRegistration> studentRegistrations() {
	    Transaction transaction = null;
	    try {
	        Session session = HibernateUtil.getSession().openSession();
	        transaction = session.beginTransaction();
	        listStudentRegistration = session.createQuery("from StudentRegistration").getResultList();
	        transaction.commit();
	        session.close();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    }
	    return listStudentRegistration;
	}


}
