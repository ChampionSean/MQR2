/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import MapeoBD.Cliente;
import MapeoBD.Empleado;
import MapeoBD.Empleado_proyecto;
import MapeoBD.Persona;
import MapeoBD.Pregunta_respuesta;
import MapeoBD.Proyecto;
import MapeoBD.Prueba;
import MapeoBD.Prueba_empleado;
import MapeoBD.Respuesta_empleado;
import MapeoBD.Usuario;
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
public class EmpleadoDAO {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    
    
    
    public Set<Empleado_proyecto> getProyectos(long id_empleado){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Set<Empleado_proyecto> lista = null;
        try {
            tx = session.beginTransaction();
            Empleado f = (Empleado) session.get(Empleado.class, id_empleado);
            Hibernate.initialize(f.getEmpleado_proyecto());
           lista = f.getEmpleado_proyecto();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;
    }
    
    
     public Set<Prueba_empleado> getPruebas(long id_empleado){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Set<Prueba_empleado> lista = null;
        try {
            tx = session.beginTransaction();
            Empleado f = (Empleado) session.get(Empleado.class, id_empleado);
            Hibernate.initialize(f.getPrueba_empleado());
           lista = f.getPrueba_empleado();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;
    }
    
    
    
    
    
    
    
    
    public Empleado getEmpleadosP(long id_empleado){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Empleado> lista = new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Empleado where id_empleado = :var");
            query.setParameter("var",id_empleado);
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista.get(0);
    }
    
    public List getEmpleados(){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Empleado> lista=new LinkedList();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Empleado");
            lista = query.list();
            
        }catch(Exception e){
            e.printStackTrace();  
        }finally{
            session.close();
        }    
        return lista;
    }
    
    public int getFaltantes(){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Prueba_empleado> lista=new LinkedList();
        List<Empleado> lis = new LinkedList();
        List<Empleado> no = new LinkedList();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Prueba_empleado");
            lista = query.list();
            
            Query query2 = session.createQuery("from Empleado");
            lis = query2.list();
            for(Prueba_empleado a :lista){
               
                   lis.remove(a);
               
            }
            
            
        }catch(Exception e){
            e.printStackTrace();  
        }finally{
            session.close();
        }    
        return lis.size();
    }
    
    
    public int numContestadas(){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Prueba_empleado> lista=new LinkedList();
       
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Prueba_empleado");
            lista = query.list();
            
            
            
            
        }catch(Exception e){
            e.printStackTrace();  
        }finally{
            session.close();
        }    
        return lista.size();
    }
    
    
    
    
    
    public void crearEmpleado(Empleado empleado, Persona persona, Usuario usuario, String proyecto){
      Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
           tx = session.beginTransaction();
           usuario.setPersona_usuario(persona);
           persona.setUsuario_id(usuario);
           
           persona.setEmpleado_persona(empleado);
           empleado.setPersona_id(persona);
            
           Proyecto m = (Proyecto) session.get(Proyecto.class, Long.parseLong(proyecto));
           Empleado_proyecto ep = new Empleado_proyecto();
           Hibernate.initialize(m.getEmpleado_proyecto());
           Hibernate.initialize(empleado.getEmpleado_proyecto());
           ep.setHabilitado(1);
           ep.setEmpleado(empleado);
           ep.setProyecto(m);
           m.getEmpleado_proyecto().add(ep);
           empleado.getEmpleado_proyecto().add(ep);
            session.save(usuario);
            session.save(persona);
            session.save(empleado);
            session.save(ep);
            session.update(m);
             
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
    
    
  
    
    public void modificaEmpleado(Empleado neo_empleado, Persona neo_persona,long id){
         Session session = sessionFactory.openSession();
         Transaction tx = null;
         Empleado empleado=null;
         Persona persona = null;
          try {
           tx = session.beginTransaction();
            empleado =(Empleado) session.get(Empleado.class,id);
            persona = empleado.getPersona_id();
            persona.setNombre(neo_persona.getNombre());
            persona.setApellido_paterno(neo_persona.getApellido_materno());
            persona.setApellido_materno(neo_persona.getApellido_materno());
            persona.setCorreo(neo_persona.getCorreo());
            persona.setTelefono_local(neo_persona.getTelefono_local());
            persona.setTelefono_movil(neo_persona.getTelefono_movil());
            
            
            
            empleado.setDireccion(neo_empleado.getDireccion());
            empleado.setHoras_x_semana(neo_empleado.getHoras_x_semana());
            empleado.setCarrera(neo_empleado.getCarrera());
            empleado.setEstado_civil(neo_empleado.getEstado_civil());
            empleado.setNumero_hijos(neo_empleado.getNumero_hijos());
            empleado.setFecha_nacimiento(neo_empleado.getFecha_nacimiento());
            empleado.setAntiguedad(neo_empleado.getAntiguedad());
            empleado.setSueldo_mensual(neo_empleado.getSueldo_mensual());
            empleado.setSexo(neo_empleado.getSexo());
            empleado.setCandidato(neo_empleado.getCandidato());
            empleado.setHabilitado(neo_empleado.getHabilitado());
            
            
            
            session.update(empleado);
            session.update(persona);
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

   
  
    public void borrarEmpleado(long num){
     Session session = sessionFactory.openSession();
        Transaction tx = null;
        Empleado em = null;
        try {
           tx = session.beginTransaction();
           em = (Empleado) session.get(Empleado.class, num);
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

    public void borrarEmpleadoNom(String nombre){
     Session session = sessionFactory.openSession();
         Transaction tx = null;
         List<Cliente> lista=null; 
         List<Empleado> lista_1=null;
         Empleado viejo=null;
         Cliente aux=null;
          try {
           tx = session.beginTransaction();
           Query query = session.createQuery("from Cliente "
                   + "where nombre_cliente = :var");
           query.setParameter("var",nombre );
           lista = query.list(); 
           aux=lista.get(0);
           
           Query query_1 = session.createQuery("from Empleado "
                   + "where cliente_id = :var");
           query.setParameter("var",aux.getId_cliente() );
           lista_1=query_1.list();
           viejo=lista_1.get(0);
         
           viejo.setHabilitado(0);
           aux.setHabilitado(0);
           session.update(viejo);
           session.update(aux);
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
   
    public Empleado consultaEmpleado(Long id){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Empleado em = null;
        
        
        try {
           tx = session.beginTransaction();
           em = (Empleado) session.get(Empleado.class, id);
             
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
    
    public Empleado consultaEmpleadoNom(String nombre){
        Session session = sessionFactory.openSession();
         Transaction tx = null;
         List<Cliente> lista=null; 
         List<Empleado> lista_1=null;
         Empleado viejo=null;
         Cliente aux=null;
          try {
           tx = session.beginTransaction();
           Query query = session.createQuery("from Cliente "
                   + "where nombre_cliente = :var");
           query.setParameter("var",nombre );
           lista = query.list(); 
           aux=lista.get(0);
           
           Query query_1 = session.createQuery("from Empleado "
                   + "where cliente_id = :var");
           query.setParameter("var",aux.getId_cliente() );
           lista_1=query_1.list();
           viejo=lista_1.get(0);
             
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
        return viejo;
    }

    
    
    
     public void contestarClima(LinkedList<Long> a, long id_prueba, long id_empleado){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Pregunta_respuesta> lista = new LinkedList<>();
        Prueba_empleado pe = null;
        Respuesta_empleado re = null;
        try {
            tx = session.beginTransaction();
            
            Empleado participante = (Empleado) session.get(Empleado.class, id_empleado);
            Prueba prueba = (Prueba) session.get(Prueba.class, id_prueba);
            int k = 31;
            for(Long bbb:a){
                System.out.println("puntaje = "+bbb + "pregunta = "+ k);
                re = new Respuesta_empleado();
                re.setEmpleado(participante);
                Query query = session.createQuery("from Pregunta_respuesta where puntaje_respuesta = :var and pregunta_id = :varr");
           query.setParameter("var",bbb);
           query.setParameter("varr",k);
           System.out.println("puntaje = "+bbb + "pregunta = "+ k);
           Pregunta_respuesta prrr = (Pregunta_respuesta) query.uniqueResult();
                re.setPregunta_respuesta(prrr);
                Hibernate.initialize(prrr.getRespuesta_empleado());
                 Hibernate.initialize(participante.getRespuesta_empleado());
                 prrr.getRespuesta_empleado().add(re);
                 participante.getRespuesta_empleado().add(re);
                 session.save(re);
                 session.update(prrr);
                 session.update(participante);
                 k++;
            }
            //falta codgigo para contestar
            tx.commit();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
       
    }
    
    
    
    public void contestar(LinkedList<Long> a, long id_prueba, long id_empleado){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Pregunta_respuesta> lista = new LinkedList<>();
        Prueba_empleado pe = null;
        Respuesta_empleado re = null;
        try {
            tx = session.beginTransaction();
            pe = new Prueba_empleado();
            Empleado participante = (Empleado) session.get(Empleado.class, id_empleado);
            Prueba prueba = (Prueba) session.get(Prueba.class, id_prueba);
            int k = 1;
            for(Long bbb:a){
                re = new Respuesta_empleado();
                re.setEmpleado(participante);
                Query query = session.createQuery("from Pregunta_respuesta where puntaje_respuesta = :var and pregunta_id = :varr");
           query.setParameter("var",bbb);
           query.setParameter("varr",k);
           System.out.println("puntaje = "+bbb + "pregunta = "+ k);
           Pregunta_respuesta prrr = (Pregunta_respuesta) query.uniqueResult();
                re.setPregunta_respuesta(prrr);
                Hibernate.initialize(prrr.getRespuesta_empleado());
                 Hibernate.initialize(participante.getRespuesta_empleado());
                 prrr.getRespuesta_empleado().add(re);
                 participante.getRespuesta_empleado().add(re);
                 pe.setEmpleado(participante);
                 pe.setPrueba(prueba);
                 participante.getPrueba_empleado().add(pe);
                 prueba.getPrueba_empleado().add(pe);
                 pe.setPuntaje_prueba(0);
                 pe.setFecha_prueba(new Date());
                 
                 session.save(pe);
                 session.save(re);
                 session.update(prrr);
                 session.update(participante);
                 session.update(prueba);
                 k++;
            }
            //falta codgigo para contestar
            tx.commit();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
       
    }
    
    
    public Empleado consultaEmpleadoEma(String email){
        Session session = sessionFactory.openSession();
         Transaction tx = null;
         Persona p=null; 
         Empleado emp = null;
          try {
           tx = session.beginTransaction();
           Query query = session.createQuery("from Persona "
                   + "where correo = :var");
           query.setParameter("var",email);
           
           p = (Persona) query.uniqueResult();
             emp = p.getEmpleado_persona();
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
        return emp;
    }
   
}
