/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import MapeoBD.Respuesta_empleado;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Marco
 */
public class Respuesta_empleadoDAO {
     private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
     public List<Respuesta_empleado> reporte(){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Respuesta_empleado> lista = null;
        
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Respuesta_empleado");
            
            lista = query.list();
            for(Respuesta_empleado v:lista){
                Hibernate.initialize(v.getPregunta_respuesta().getPregunta().getPregunta_prueba());
                
            }
            
            tx.commit();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;   
     }
}
