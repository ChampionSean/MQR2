/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;



import MapeoBD.Cliente;
import MapeoBD.Empleado;
import MapeoBD.Empleado_proyecto;
import MapeoBD.Proyecto;
import MapeoBD.Prueba;
import MapeoBD.Prueba_Cliente;
import MapeoBD.Prueba_Proyecto;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;



/**
 *
 * @author Salvador
 */
public class ProyectoDAO {
     private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public List<Proyecto> getProyectos(){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Proyecto> lista = new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Proyecto");
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;   
     }
    
    
    
    
    
     public void addProof(Proyecto c, Prueba p){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            c = (Proyecto) session.get(Proyecto.class, c.getId_proyecto());
            p = (Prueba) session.get(Prueba.class, p.getId_prueba());
            
            
            Query query = session.createQuery("from Prueba_Proyecto where prueba_id = :var and proyecto_id = :varr");
            query.setParameter("var",p.getId_prueba());
            query.setParameter("varr",c.getId_proyecto());
            Prueba_Proyecto pc = (Prueba_Proyecto) query.uniqueResult();
            
            if(pc == null){
            pc = new Prueba_Proyecto();
            pc.setProyecto(c);
            pc.setPrueba(p);
            pc.setHabilitado(1);
            Hibernate.initialize(c.getPrueba_proyecto());
            Hibernate.initialize(p.getPrueba_proyecto());
            c.getPrueba_proyecto().add(pc);
            p.getPrueba_proyecto().add(pc);
            session.save(pc);
            session.update(c);
            session.update(p);
            }
            tx.commit();
            
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
          
     }
    
    
    
    
    /**
     * Consulta A
     * @param id
     * @return 
     */
    public Proyecto getProyecto(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Proyecto lista = null;
        try {
            tx = session.beginTransaction();
            lista = (Proyecto) session.get(Proyecto.class, id);
            tx.commit();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;   
     }
    
    /**
     * Consulta B
     * @param id_proyecto
     * @return 
     */
     public Cliente dameCliente(Long id_proyecto){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Cliente owner=null;
        try {
            tx = session.beginTransaction();
            Proyecto p = (Proyecto) session.get(Proyecto.class, id_proyecto);
            owner = p.getCliente();            
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return owner;
     }
    
     /**
      * Consulta C
      * @param id_proyecto
      * @return 
      */
     public Set<Prueba_Proyecto> damePruebas(Long id_proyecto){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Prueba_Proyecto> lista=new LinkedList<>();
        Set<Prueba_Proyecto> pruebas = null;
        try {
            tx = session.beginTransaction();
            Proyecto p = (Proyecto) session.get(Proyecto.class, id_proyecto);
            
            Query query = session.createQuery("from Prueba_Proyecto where proyecto_id =:var");
            query.setParameter("var", id_proyecto);
            lista = query.list();
           
            for(Object pc: lista){
                p.getPrueba_proyecto().add((Prueba_Proyecto)pc);
            }
            session.update(p);
            Hibernate.initialize(p.getPrueba_proyecto());
            pruebas = p.getPrueba_proyecto();
            
         
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return pruebas;  
         
     }
     
     /**
      * Consulta D
      * @param id_proyecto
      * @return 
      */
     public Set<Empleado_proyecto> dameEmpleados(Long id_proyecto){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        Set<Empleado_proyecto> lista= null;
        try {
            tx = session.beginTransaction();
            Proyecto p = (Proyecto) session.get(Proyecto.class, id_proyecto);
            Hibernate.initialize(p.getEmpleado_proyecto());
            lista = p.getEmpleado_proyecto();
            tx.commit();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        
        return lista;  
         
     }
     public void crearProyecto(Proyecto pro, long id_cliente){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
           tx = session.beginTransaction();
           Cliente c = (Cliente) session.get(Cliente.class, id_cliente);
           pro.setCliente(c);
           c.getProyecto().add(pro);
           
            session.save(pro);
           session.update(c);  
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
     
  
     
     public void modificaProyecto(Proyecto neo_pro, long id_proyecto){
         Session session = sessionFactory.openSession();
         Transaction tx = null;
         Proyecto proyecto;
         
          try {
           
            tx = session.beginTransaction();
          
            proyecto = (Proyecto) session.get(Proyecto.class, id_proyecto); 
            proyecto.setDescripcion(neo_pro.getDescripcion());
            proyecto.setFecha_fin(neo_pro.getFecha_fin() );
            proyecto.setFecha_inicio(neo_pro.getFecha_inicio() );
            proyecto.setHabilitado(neo_pro.getHabilitado() );  
            proyecto.setNombre_proyecto(neo_pro.getNombre_proyecto());
            session.update(proyecto);
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
     
    public void borrarProyecto(String nom){
        Session session = sessionFactory.openSession();
           Transaction tx = null;
        Proyecto pro = null;
         List<Proyecto> lista=null; 
        try {
           tx = session.beginTransaction();
            Query query = session.createQuery("from Proyecto "
                   + "where nombre_proyecto = :var");
           query.setParameter("var",nom );
           lista = query.list(); 
           pro=lista.get(0);    
           pro.setHabilitado(0);
           session.update(pro);
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
     
    public Proyecto consultaProyecto(String nom){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Proyecto pro = null;
        List<Proyecto> lista=null; 
        
        try {
           
           tx = session.beginTransaction();
           Query query = session.createQuery("from Proyecto "
                   + "where nombre_proyecto = :var");
           query.setParameter("var",nom );
           lista = query.list(); 
           pro=lista.get(0);
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
        return pro;
    }
     
    public Proyecto verProyecto(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Proyecto pro = null;
        List<Proyecto> lista=null; 
        
        try {
           
           tx = session.beginTransaction();
           pro = (Proyecto) session.get(Proyecto.class, id);
           
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
        return pro;
    }
}
