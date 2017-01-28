/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import MapeoBD.Pregunta;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Salvador
 */
public class PreguntaDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Pregunta> getPreguntas(){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Pregunta> lista=new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Pregunta");
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista; 
        
    
    }
    
    public List<Pregunta> getPregunta(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Pregunta> lista=new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Pregunta where id_pregunta = :var");
             query.setParameter("var",id);
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;
    }
    
    public void crearPrueba(Pregunta pregunta){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
           tx = session.beginTransaction();
            session.save(pregunta);
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
    
    public void modificaPregunta(Pregunta pregunta,Long id){
         Session session = sessionFactory.openSession();
         Transaction tx = null;
         Pregunta viejo;
         
          try {
           
            tx = session.beginTransaction();
            viejo = (Pregunta) session.get(Pregunta.class, id);
            
            viejo.setId_pregunta(pregunta.getId_pregunta());
            viejo.setNombre_pregunta(pregunta.getNombre_pregunta());
            viejo.setHabilitado(pregunta.getHabilitado());
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
    
    public void borrarPregunta(String nombre){
          Session session = sessionFactory.openSession();
          Transaction tx = null;
          Pregunta pru=null;
          List<Pregunta> lista=null;
          
          try{
              tx = session.beginTransaction();
            Query query = session.createQuery("from Pregunta "
                   + "where nombre_pregunta = :var");
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
    
    
    
    public Pregunta verPregunta(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Pregunta pregunta = null;
        
        
        try {
           
           tx = session.beginTransaction();
           pregunta = (Pregunta) session.get(Pregunta.class, id);
           
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
        return pregunta;
    }
}
