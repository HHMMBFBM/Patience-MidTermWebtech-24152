package com.mugabo.controller;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.domain.Student;
import com.mugabo.view.HibernateUtil;

import java.util.Collections;
import java.util.List;

public class StudentDao {

  
    public void saveStudent(Student student) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSession().openSession()) {
            transaction = session.beginTransaction();
            session.save(student);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }


    public Student getStudentById(String studentId) {
        try (Session session = HibernateUtil.getSession().openSession()) {
            return session.get(Student.class, studentId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public void updateStudent(Student student) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSession().openSession()) {
            transaction = session.beginTransaction();
            session.update(student);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }


    public void deleteStudent(String studentId) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSession().openSession()) {
            transaction = session.beginTransaction();
            Student student = session.get(Student.class, studentId);
            if (student != null) {
                session.delete(student);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }


    public List<Student> getAllStudents() {
        try (Session session = HibernateUtil.getSession().openSession()) {
            return session.createQuery("from Student", Student.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
}
