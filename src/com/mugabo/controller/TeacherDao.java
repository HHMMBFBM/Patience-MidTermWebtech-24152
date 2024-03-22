package com.mugabo.controller;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.domain.Teacher;
import com.mugabo.view.HibernateUtil;
import com.mysql.cj.Query;


public class TeacherDao {

    public void addTeacher(Teacher teacher) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSession().openSession()) {
           
            transaction = session.beginTransaction();
            
            
            session.save(teacher);
            
           
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    public Teacher getTeacherByCode(String code) {
        Teacher teacher = null;
        try (Session session = HibernateUtil.getSession().openSession()) {
            String hql = "FROM Teacher T WHERE T.code = :code";
            org.hibernate.query.Query<Teacher> query = session.createQuery(hql, Teacher.class);
            query.setParameter("code", code);
            teacher = query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return teacher;
    }


}
