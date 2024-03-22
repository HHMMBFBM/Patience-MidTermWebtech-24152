package com.mugabo.controller;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mugabo.domain.Users;
import com.mugabo.view.HibernateUtil;

import org.hibernate.query.Query;

public class UsersDao {

    public void saveUser(Users user) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSession().openSession()) {
        
            transaction = session.beginTransaction();
           
            session.save(user);

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public Users getUserByEmailAndPassword(String email, String password) {
        try (Session session = HibernateUtil.getSession().openSession()) {
            
            String hql = "FROM Users WHERE email = :email";
            Query<Users> query = session.createQuery(hql, Users.class);
            query.setParameter("email", email);
            Users user = query.uniqueResult();


            if (user != null && user.getPassword().equals(password)) {
                return user; 
            }

            return null; 
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
