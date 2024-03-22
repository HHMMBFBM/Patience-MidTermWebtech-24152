package com.mugabo.view;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.mugabo.domain.AcademicUnit;
import com.mugabo.domain.Course;
import com.mugabo.domain.CourseDefinition;
import com.mugabo.domain.Semester;
import com.mugabo.domain.Student;
import com.mugabo.domain.StudentCourse;
import com.mugabo.domain.StudentRegistration;
import com.mugabo.domain.Teacher;
import com.mugabo.domain.Users;

import java.util.Properties;    


public class HibernateUtil {
	
	private static SessionFactory sessionFactory;

	public static final String PERSISTENCE_UNIT_NAME = "YourPersistenceUnit";
	
	public static String getPersistenceUnitName() {
        return PERSISTENCE_UNIT_NAME;
    }
	
    public static SessionFactory getSession() {

        try {
            Configuration configuration = new Configuration();

            Properties settings = new Properties();
            settings.put("hibernate.connection.driver_class", "com.mysql.cj.jdbc.Driver");
            settings.put("hibernate.connection.url", "jdbc:mysql://localhost:3306/studentmanagement?createDatabaseIfNotExist=true");
            settings.put("hibernate.connection.username", "root");
            settings.put("hibernate.connection.password", "Patience123@");
            settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");

            settings.put(Environment.SHOW_SQL, "true");

			settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

			settings.put(Environment.HBM2DDL_AUTO, "update");

           
            configuration.setProperties(settings);
            configuration.addAnnotatedClass(Users.class);
            configuration.addAnnotatedClass(Teacher.class);
            configuration.addAnnotatedClass(CourseDefinition.class);
            configuration.addAnnotatedClass(Semester.class);
            configuration.addAnnotatedClass(Student.class);
            configuration.addAnnotatedClass(AcademicUnit.class);
            configuration.addAnnotatedClass(Course.class);
            configuration.addAnnotatedClass(StudentRegistration.class);
            configuration.addAnnotatedClass(StudentCourse.class);


                        
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
					.applySettings(configuration.getProperties()).build();
			System.out.println("Hibernate Java Config serviceRegistry created");
			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
			return sessionFactory;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return sessionFactory;
    }

}
