package com.mugabo.controller;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mugabo.domain.Course;
import com.mugabo.domain.StudentRegistration;
import com.mugabo.view.HibernateUtil;

public class ResultDao {

	public List<StudentRegistration> getStudentsBySemesterWithJoin(Long semesterId) {
	    Session session = HibernateUtil.getSession().openSession();
	    Transaction transaction = session.beginTransaction();

	    String hql = "SELECT sr FROM StudentRegistration sr " +
	                 "JOIN FETCH sr.regno student " +
	                 "JOIN FETCH sr.academicunit academicunit " +
	                 "WHERE sr.semester.id = :semesterId";

	    Query<StudentRegistration> query = session.createQuery(hql, StudentRegistration.class);
	    query.setParameter("semesterId", semesterId);

	    List<StudentRegistration> students = query.getResultList();

	    transaction.commit();
	    session.close();

	    return students;
	}

	public List<StudentRegistration> getStudentsInDifferentDepartments(Long semesterId) {
        Session session = HibernateUtil.getSession().openSession();
        Transaction transaction = session.beginTransaction();

        String hql = "SELECT sr FROM StudentRegistration sr " +
                     "JOIN FETCH sr.regno student " +
                     "JOIN FETCH sr.academicunit academicunit " +
                     "WHERE sr.semester.id = :semesterId " +
                     "AND academicunit.academicType = 'DEPARTMENT'";

        Query<StudentRegistration> query = session.createQuery(hql, StudentRegistration.class);
        query.setParameter("semesterId", semesterId);

        List<StudentRegistration> students = query.getResultList();

        transaction.commit();
        session.close();

        return students;
    }
	
	public List<Course> getCoursesBySemester(Long semesterId) {
	    Session session = HibernateUtil.getSession().openSession();
	    Transaction transaction = session.beginTransaction();

	    String hql = "SELECT c FROM Course c " +
	                 "WHERE c.semester.id = :semesterId";

	    Query<Course> query = session.createQuery(hql, Course.class);
	    query.setParameter("semesterId", semesterId);

	    List<Course> courses = query.getResultList();

	    transaction.commit();
	    session.close();

	    return courses;
	}

	public List<Course> getCoursesBySemesterAndDepartment(Long semesterId, String department) {
	    Session session = HibernateUtil.getSession().openSession();
	    Transaction transaction = session.beginTransaction();

	    String hql = "SELECT c FROM Course c " +
	             "JOIN FETCH c.cousedefinition courseDef " + // Correct the property name here
	             "WHERE c.semester.id = :semesterId AND c.academicunit.code = :department";

	Query<Course> query = session.createQuery(hql, Course.class);
	query.setParameter("semesterId", semesterId);
	query.setParameter("department", department);

	List<Course> courses = query.getResultList();

	    transaction.commit();
	    session.close();

	    return courses;
	}
	
	public List<StudentRegistration> getStudentsWithCourses() {
	    Session session = HibernateUtil.getSession().openSession();
	    Transaction transaction = session.beginTransaction();

	    String hql = "SELECT sr FROM StudentRegistration sr " +
	            "JOIN FETCH sr.regno student " +
	            "JOIN FETCH sr.academicunit academicunit " +
	            "JOIN FETCH sr.studentCourses studentCourse " + // Use "studentCourses" here
	            "JOIN FETCH studentCourse.course course";


	    Query<StudentRegistration> query = session.createQuery(hql, StudentRegistration.class);

	    List<StudentRegistration> students = query.getResultList();

	    transaction.commit();
	    session.close();

	    return students;
	}


	
}

