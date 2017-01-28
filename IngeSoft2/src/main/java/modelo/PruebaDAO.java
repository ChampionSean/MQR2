package modelo;



import MapeoBD.Empleado;
import MapeoBD.Prueba;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Salvador
 */
public class PruebaDAO {
 
     private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
   
    
    public List<Prueba> getPruebas(){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Prueba> lista = new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Prueba");
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;  
    }
    
     public Prueba getPrueba(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Prueba prueba = null;
        try {
            tx = session.beginTransaction();
            prueba = (Prueba) session.get(Prueba.class, id);
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return prueba;   
     }
     
      public void crearPrueba(Prueba pro){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
           tx = session.beginTransaction();
            session.save(pro);
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
      
      public void modificaPrueba(Prueba prueba,Long id){
         Session session = sessionFactory.openSession();
         Transaction tx = null;
         Prueba viejo;
         
          try {
           
            tx = session.beginTransaction();
            viejo = (Prueba) session.get(Prueba.class, id);
            viejo.setDescripcion_prueba(prueba.getDescripcion_prueba());
            viejo.setNombre_prueba(prueba.getNombre_prueba());
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
      
      public void borrarPrueba(String nombre){
          Session session = sessionFactory.openSession();
          Transaction tx = null;
          Prueba pru=null;
          List<Prueba> lista=null;
          
          try{
              tx = session.beginTransaction();
            Query query = session.createQuery("from Proyecto "
                   + "where nombre_prueba = :var");
           query.setParameter("var",nombre );
           lista = query.list(); 
           pru=lista.get(0);    
           pru.setHabilitado(0); 
           session.update(pru);
           tx.commit();
          }catch(Exception e){
              if (tx!=null){
               tx.rollback();
           }
           e.printStackTrace(); 
          }finally {
           session.close();
        }
      }
      
      public Prueba consultaPrueba(String nombre){
          Session session = sessionFactory.openSession();
          Transaction tx = null;
          Prueba pru =null;
          List<Prueba> lista=null;
          
          try {
           
           tx = session.beginTransaction();
           Query query = session.createQuery("from Prueba "
                   + "where nombre_prueba = :var");
           query.setParameter("var",nombre );
           lista = query.list(); 
           pru=lista.get(0);
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
        return pru;
          
      }
      
      
      public Prueba verPrueba(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Prueba pru = null;
         
        
        try {
           
           tx = session.beginTransaction();
           pru = (Prueba) session.get(Prueba.class, id);
           
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
        return pru;
    }
}
