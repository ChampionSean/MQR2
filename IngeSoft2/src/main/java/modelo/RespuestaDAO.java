/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;



import MapeoBD.Respuesta;
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
public class RespuestaDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public List<Respuesta> getRespuestas(){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Respuesta> lista = new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Respuesta");
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;  
    }
    
    public List<Respuesta> getRespuesta(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Respuesta> lista = new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Respuesta where id_respuesta = :var");
             query.setParameter("var",id);
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;   
     }
    
     public void crearRespuesta(Respuesta respuesta){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
           tx = session.beginTransaction();
            session.save(respuesta);
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
     
      public void modificaRespuesta(Respuesta respuesta,Long id){
         Session session = sessionFactory.openSession();
         Transaction tx = null;
         Respuesta viejo;
         
          try {
           
            tx = session.beginTransaction();
            viejo = (Respuesta) session.get(Respuesta.class, id);
            viejo.setId_repuesta(respuesta.getId_repuesta());
            viejo.setNombre_respuesta(respuesta.getNombre_respuesta());
            viejo.setHabilitado(respuesta.getHabilitado());
            
          }catch (Exception e) {
           if (tx!=null){
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
      }
      
      public void borrarRespuesta(String nombre){
          Session session = sessionFactory.openSession();
          Transaction tx = null;
          Respuesta pru=null;
          List<Respuesta> lista=null;
          
          try{
              tx = session.beginTransaction();
            Query query = session.createQuery("from Respuesta "
                   + "where nombre_respuesta = :var");
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

      public Respuesta consultaRespuesta(String nombre){
          Session session = sessionFactory.openSession();
          Transaction tx = null;
          Respuesta pru =null;
          List<Respuesta> lista=null;
          
          try {
           
           tx = session.beginTransaction();
           Query query = session.createQuery("from Respuesta "
                   + "where nombre_respuesta = :var");
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
      
      public Respuesta verRespuesta(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Respuesta pru = null;
         
        
        try {
           
           tx = session.beginTransaction();
           pru = (Respuesta) session.get(Respuesta.class, id);
           
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
