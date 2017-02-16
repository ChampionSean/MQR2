/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import MapeoBD.Cliente;
import MapeoBD.Empleado;
import MapeoBD.Persona;
import MapeoBD.Proyecto;
import MapeoBD.Prueba;
import MapeoBD.Prueba_Cliente;
import MapeoBD.Usuario;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import javafx.beans.binding.Bindings;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Marco
 */
public class ClienteDAO implements ClienteDAOint {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public Persona porCorreo(String correo){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        Persona lista = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Persona where correo = :var");
            query.setParameter("var",correo);
            lista = (Persona) query.uniqueResult();
            
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;   
     }
    
    
    public void addProof(Cliente c, Prueba p){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            c = (Cliente) session.get(Cliente.class, c.getId_cliente());
            p = (Prueba) session.get(Prueba.class, p.getId_prueba());
            
            Query query = session.createQuery("from Prueba_Cliente where prueba_id = :var and cliente_id = :varr");
            query.setParameter("var",p.getId_prueba());
            query.setParameter("varr",c.getId_cliente());
            
           Prueba_Cliente pc = (Prueba_Cliente) query.uniqueResult();
           
           if(pc == null){
               pc = new Prueba_Cliente();
            pc.setCliente(c);
            pc.setPrueba(p);
            pc.setHabilitado(1);
            Hibernate.initialize(c.getPrueba_cliente());
            Hibernate.initialize(p.getPrueba_cliente());
            c.getPrueba_cliente().add(pc);
            p.getPrueba_cliente().add(pc);
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
    
    
    public Cliente porEmpresa(String empresa){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Cliente> lista = new LinkedList<>();
        Cliente cli=null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Cliente where nombre_empresa = :var");
            query.setParameter("var",empresa);
            lista = query.list();
            cli=lista.get(0);
            tx.commit();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return cli;   
     }
   
    public List<Cliente> getClientesHabilitados(){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        List lista = null;
        
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Cliente where habilitado = :var");
            query.setParameter("var",1);
            lista = query.list();
            
            
            tx.commit();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;   
     }
     
    
    public List<Cliente> getClientesDeshabilitados(){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        List lista = null;
        
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Cliente where habilitado = :var");
            query.setParameter("var",0);
            lista = query.list();
            
            
            tx.commit();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;   
     }
    
    
    public Set<Proyecto> Proyectos(String email){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        Set<Proyecto> lista = null;
        List lista2 = null;
        
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Persona where correo = :var");
            query.setParameter("var",email);
            lista2 = query.list();
            Persona persona = (Persona) lista2.get(0);
            Hibernate.initialize(persona.getCliente_persona().getProyecto());
            lista = persona.getCliente_persona().getProyecto();
            tx.commit();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;   
     }
  
    
    
     public Cliente verCliente(long numero){
      Session session = sessionFactory.openSession();
        Transaction tx = null;
        Cliente cli = null;
        try {
           tx = session.beginTransaction();
           cli = (Cliente) session.get(Cliente.class, numero);
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
        
        return cli;
      
}
     
     public void borrarCliente(long numero){
      Session session = sessionFactory.openSession();
        Transaction tx = null;
        Cliente cli = null;
        try {
           tx = session.beginTransaction();
           cli = (Cliente) session.get(Cliente.class, numero);
           Persona p = cli.getPersona_id();
           Usuario u = p.getUsuario_id();
           session.delete(cli);
           session.delete(p);
           session.delete(u);
           
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
     
     public void crearCliente(Cliente cliente, Persona persona, Usuario usuario){
      Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
           tx = session.beginTransaction();
           usuario.setPersona_usuario(persona);
           persona.setUsuario_id(usuario);
           
           persona.setCliente_persona(cliente);
           cliente.setPersona_id(persona);
            session.save(usuario);
            session.save(persona);
            session.save(cliente);
             
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
     
      public void modificaCliente(Cliente neo_cliente,long id_cliente, Persona neo_persona, String pass){
      Session session = sessionFactory.openSession();
        Transaction tx = null;
        Cliente cli =null;
        Usuario user =null;
        Persona per = null;
         try {
           tx = session.beginTransaction();
           cli=(Cliente) session.get(Cliente.class, id_cliente);
           per = cli.getPersona_id();
           per.setNombre(neo_persona.getNombre());
           per.setApellido_paterno(neo_persona.getApellido_paterno());
           per.setApellido_materno(neo_persona.getApellido_materno());
           per.setTelefono_local(neo_persona.getTelefono_local());
           per.setTelefono_movil(neo_persona.getTelefono_movil());
           per.setCorreo(neo_persona.getCorreo());
           
           cli.setArea(neo_cliente.getArea());
           cli.setPuesto(neo_cliente.getPuesto());
           cli.setNombre_empresa(neo_cliente.getNombre_empresa());
           cli.setHabilitado(neo_cliente.getHabilitado());
              if(pass!=null){
                  per.getUsuario_id().setPassword_usuario(pass);
              }
           session.update(per.getUsuario_id());    
           session.update(per);
           session.update(cli);
             
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
    /**
     * Consulta E
     * las pruebas de un cliente disponibles apartir del ID del cliente
     * @param id
     * @return 
     */
      public Set<Prueba_Cliente> daPruebas(String correo){
         
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List lista = null;
        Set<Prueba_Cliente> pruebas = null;
        try {
           tx = session.beginTransaction();
           Query query = session.createQuery("from Persona where correo = :var");
            query.setParameter("var",correo);
            lista = query.list();
            Persona p = (Persona) lista.get(0);
            query = session.createQuery("from Prueba_Cliente where cliente_id =:var");
            query.setParameter("var",p.getCliente_persona().getId_cliente());
            lista = query.list();
           
            for(Object pc: lista){
                p.getCliente_persona().getPrueba_cliente().add((Prueba_Cliente)pc);
            }
            session.update(p.getCliente_persona());
            Hibernate.initialize(p.getCliente_persona().getPrueba_cliente());
            pruebas = p.getCliente_persona().getPrueba_cliente();
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
        
        return pruebas;
      }
}
