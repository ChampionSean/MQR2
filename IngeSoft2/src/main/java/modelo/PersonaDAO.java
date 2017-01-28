/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import MapeoBD.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Marco
 */
public class PersonaDAO {
     private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
     public void crearPersona(Usuario usu){
      Session session = sessionFactory.openSession();
        Transaction tx = null;
        Usuario usuario = usu;
        try {
           tx = session.beginTransaction();
            session.save(usuario);
             
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
    
    
    
}
