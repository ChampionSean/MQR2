/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MapeoBD;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author Salvador
 */
@Entity
@Table(name="password_token")
public class Password_token {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_password_token")
    private long id_password_token;
    
    @ManyToOne
    @JoinColumn(name="usuario_password_token")
    private Usuario usuario_password_token;
    
    @Column(name = "token_password_token")
    private String token_password_token;
    
   @Column(name="date_password_token")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date date_password_token;

    public Password_token(long id_password_token, Usuario usuario_password_token, String token_password_token, Date date_password_token) {
        this.id_password_token = id_password_token;
        this.usuario_password_token = usuario_password_token;
        this.token_password_token = token_password_token;
        this.date_password_token = date_password_token;
    }

    public Password_token() {
        //To change body of generated methods, choose Tools | Templates.
    }

    public Usuario getUsuario_password_token() {
        return usuario_password_token;
    }

    public void setUsuario_password_token(Usuario usuario_password_token) {
        this.usuario_password_token = usuario_password_token;
    }

    

    public long getId_password_token() {
        return id_password_token;
    }

    public void setId_password_token(long id_password_token) {
        this.id_password_token = id_password_token;
    }

    public String getToken_password_token() {
        return token_password_token;
    }

    public void setToken_password_token(String token_password_token) {
        this.token_password_token = token_password_token;
    }

    public Date getDate_password_token() {
        return date_password_token;
    }

    public void setDate_password_token(Date date_password_token) {
        this.date_password_token = date_password_token;
    }
    
    
}
