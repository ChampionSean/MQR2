/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import MapeoBD.Password_token;
import MapeoBD.Usuario;
import java.util.Calendar;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
/**
 *
 * @author Marco
 */
public class RestablecerPasswordDAOImpl {
     private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public boolean registrarRestablecerPassword(Usuario usuario, String token){
     
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Password_token password_token = new Password_token();
        boolean exito = false;
        
        Calendar fecha = Calendar.getInstance();
        
        fecha.add(Calendar.HOUR , 1);        
        try {
           tx = session.beginTransaction();
    
           password_token.setUsuario_password_token(usuario);
           password_token.setToken_password_token(token);
           password_token.setDate_password_token(fecha.getTime());
           
           session.persist(password_token);
           
           tx.commit();
           exito = true;
        }
        catch (Exception e) {
           if (tx!=null) tx.rollback();
           e.printStackTrace(); 
        }finally {
           session.close();
        }
        
        return exito;
    }
    
    
    public Password_token revisarRestablecerPassword(long id_usuario, String token){
        
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<Password_token> password_tokens = null;
        
        try {
           tx = session.beginTransaction();
    
            String hql = "SELECT P "
                    +    "FROM Password_token P "
                    +    "WHERE P.usuario_password_token.id_usuario = :id_usuario AND "
                    +    "P.token_password_token = :token ";
            //System.out.println("\n\n\n\n\n\n\n\n\n\n"+hql+"\n\n\n\n\n\n\n\n\n\n");
            Query query = session.createQuery(hql);
            query.setParameter("id_usuario", id_usuario);
            query.setParameter("token", token);
            password_tokens = query.list(); 
            tx.commit();
            
             if(password_tokens.isEmpty()){
                return null;
            }
             
        }
        catch (HibernateException e) {
           if (tx!=null) tx.rollback();
           e.printStackTrace(); 
        }finally {
           session.close();
        }
        
        return password_tokens == null ? null : password_tokens.get(0);
    }
    
    
    
}
