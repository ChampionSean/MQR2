/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import MapeoBD.Empleado_proyecto;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Salvador
 */
public class Empleado_proyectoDAO {
    
     private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public void crearEmpleado_pro(Empleado_proyecto em){
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

    public void modificaEmpleado_pro(Empleado_proyecto em,long id){
         Session session = sessionFactory.openSession();
         Transaction tx = null;
         Empleado_proyecto viejo=null;
          try {
           tx = session.beginTransaction();
            viejo=(Empleado_proyecto) session.get(Empleado_proyecto.class,id);
            
           viejo.setHabilitado(em.getHabilitado());
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

    public void borrarEmpleado_proyecto(long num){
     Session session = sessionFactory.openSession();
        Transaction tx = null;
        Empleado_proyecto em = null;
        try {
           tx = session.beginTransaction();
           em = (Empleado_proyecto) session.get(Empleado_proyecto.class, num);
           em.setHabilitado(0);
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
    
    public Empleado_proyecto consultaEmpleado_proyecto(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Empleado_proyecto em = null;
        
        
        try {
           tx = session.beginTransaction();
           em = (Empleado_proyecto) session.get(Empleado_proyecto.class, id);
             
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
