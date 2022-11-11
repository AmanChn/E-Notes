package com.Hibernate.Dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.User.User;
import com.helper.FactoryProvider;


public class UserDao {

    public boolean saveUser(User user) {
    	boolean f = false;
        Transaction transaction = null;
        try{
        	Session session = FactoryProvider.getFactory().openSession();
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(user);
            // commit transaction
            
            if( session.save(user) != null ) {
            	f = true;
            }
            
            transaction.commit();
            
            session.close();
            
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public User validate(String email, String password) {

        Transaction transaction = null;
        User user = null;
        try{
        	Session session = FactoryProvider.getFactory().openSession();
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            user = (User) session.createQuery("FROM User U WHERE U.email = :email").setParameter("email", email).uniqueResult();
            
            if (user != null && user.getPassword().equals(password)) {
				 return user;
            }
            // commit transaction
            transaction.commit();
            
            session.close();
            
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return null;
    }
    
    
}