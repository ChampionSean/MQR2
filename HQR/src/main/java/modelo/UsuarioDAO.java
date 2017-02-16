/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;


import MapeoBD.Usuario;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Salvador
 */
public class UsuarioDAO {
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    
    
     public Usuario getUsuario(String correo_usuario) {
        System.out.println("\n\n\n\n\n\n\n\n\n\n" + correo_usuario + "\n\n\n\n\n\n\n\n\n\n");
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Usuario usuario = null;

        int id_usuario = -1;

        try {
            tx = session.beginTransaction();

            String hql = "SELECT U "
                    + "FROM Usuario U JOIN U.cliente_usuario P "
                    + "WHERE P.correo = :correo_usuario";
            Query query_profesor = session.createQuery(hql);
            query_profesor.setParameter("correo_usuario", correo_usuario);
            usuario = (Usuario) query_profesor.uniqueResult();
            System.out.println("\n\n\n\n\n\n\n\n\n\n" + hql + "\n\n\n\n\n\n\n\n\n\n");

//            if (usuario == null) {
//
//                hql = "SELECT U "
//                        + "FROM Usuario U JOIN U.alumno_usuario A "
//                        + "WHERE A.correo_alumno = :correo_usuario";
//                Query query_alumno = session.createQuery(hql);
//                query_alumno.setParameter("correo_usuario", correo_usuario);
//                usuario = (Usuario) query_alumno.uniqueResult();
//                System.out.println("\n\n\n\n\n\n\n\n\n\n" + hql + "\n\n\n\n\n\n\n\n\n\n");
//
//            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        return usuario;

    }
    
    public List<Usuario> getUsuario(){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Usuario> lista = new LinkedList<>();
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Usuario usuario order by usuario.id_usuario");
            lista = query.list();
        }catch(Exception e){
            e.printStackTrace(); 
        }finally{
            session.close();
        }
        return lista;   
     }
    
    public Usuario verCliente(long numero){
      Session session = sessionFactory.openSession();
        Transaction tx = null;
        Usuario cli = null;
        try {
           tx = session.beginTransaction();
           cli = (Usuario) session.get(Usuario.class, numero);
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
      
    public void modificaCliente(Usuario usu,long id){
      Session session = sessionFactory.openSession();
        Transaction tx = null;
        Usuario user =null;
        try {
          
           user.setId_cliente(id);
           user.setLogin_usuario(usu.getLogin_usuario());
           user.setPassword_usuario(usu.getPassword_usuario());
           user.setRol_usuario(usu.getRol_usuario());
                
           session.update(user);
             
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
     
    public void crearUsuario(Usuario usu){
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
    
    
    public boolean cambiarPassword(long id_usuario, String password) {

        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean exito = false;

        try {
            tx = session.beginTransaction();

            Usuario usuario = (Usuario) session.load(Usuario.class, id_usuario);
            usuario.setPassword_usuario(password);
            session.update(usuario);

            tx.commit();
            exito = true;

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        return exito;
    }
    
     public Usuario daID(String login_usu){
         Session session = sessionFactory.openSession();
        Transaction tx = null;
        Usuario cli = null;
        List<Usuario> lista = new LinkedList<>();
        try {
           tx = session.beginTransaction();
            Query query = session.createQuery("from Usuario where login_usuario = :var");
              query.setParameter("var",login_usu);
             lista = query.list();
           tx.commit();
           if (lista.get(0)!=null){
               cli=lista.get(0);
           }
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
}
