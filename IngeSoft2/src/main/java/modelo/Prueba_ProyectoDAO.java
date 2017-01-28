/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import MapeoBD.Empleado;
import MapeoBD.Prueba_Proyecto;
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
public class Prueba_ProyectoDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public Prueba_Proyecto consultaPrueba_pro(long id_prueba_proyecto ){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Prueba_Proyecto> lista = new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Prueba_Proyecto where id_prueba_proyecto = :var");
            query.setParameter("var",id_prueba_proyecto);
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista.get(0);
    }
    
    public List<Prueba_Proyecto> getPruebas_pros(long id_prueba_proyecto ){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Prueba_Proyecto> lista = new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Prueba_Proyecto where id_prueba_proyecto = :var");
            query.setParameter("var",id_prueba_proyecto);
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;
    }
    
    
    public void crearPrueba_Proyecto(Prueba_Proyecto prueba_pro){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
           tx = session.beginTransaction();
            session.save(prueba_pro);
             
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
    
   
    
    public void borrarPrueba_Proyecto(long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Prueba_Proyecto prueba = null;
        try {
           tx = session.beginTransaction();
           prueba = (Prueba_Proyecto) session.get(Empleado.class, id);
           prueba.setHabilitado(0);
           session.update(prueba);
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
