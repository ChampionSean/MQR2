/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import MapeoBD.Password_token;
import MapeoBD.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Salvador
 */
public class Password_tokenDAO {
      private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public void crearEmpleado(Password_token em){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
           tx = session.beginTransaction();
            session.save(em);
             
           tx.commit();
        }
        catch (Exception e) {
           if (tx!=null){
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
    }
    
    
     public void modificaPassword(Password_token em,long id){
         Session session = sessionFactory.openSession();
         Transaction tx = null;
         Password_token viejo=null;
          try {
           tx = session.beginTransaction();
           viejo=(Password_token) session.get(Password_token.class,id);
           viejo.setUsuario_password_token(em.getUsuario_password_token());
           viejo.setToken_password_token(em.getToken_password_token());
           viejo.setDate_password_token(em.getDate_password_token());
           
           session.update(viejo);
             tx.commit();
        }
        catch (Exception e) {
           if (tx!=null){
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
     
     }
     
     public void borrarPassword(long num){
     Session session = sessionFactory.openSession();
        Transaction tx = null;
        Password_token em = null;
        try {
           tx = session.beginTransaction();
           em = (Password_token) session.get(Password_token.class, num);
           em.setUsuario_password_token(new Usuario());
           session.update(em);
           tx.commit();
        }
        catch (Exception e) {
           if (tx!=null){
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
     
     }
     
     public Password_token consultaPassword(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Password_token em = null;
        
        
        try {
           tx = session.beginTransaction();
           em = (Password_token) session.get(Password_token.class, id);
             
           tx.commit();
        }
        catch (Exception e) {
           if (tx!=null){
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
        return em;
    }
    
}
