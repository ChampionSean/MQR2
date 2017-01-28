/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MapeoBD;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Marco
 */
@Entity
@Table(name="Persona")
public class Persona {
    
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_persona")
    private long id_persona;
    
    @OneToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario_id;
    
    @OneToOne(mappedBy="persona_id")
    private Cliente cliente_persona;
    
    @OneToOne(mappedBy="persona_id")
    private Empleado empleado_persona;
    
    @Column(name = "correo")
    private String correo;
    
    @Column(name = "nombre")
    private String nombre;
    
    @Column(name = "apellido_paterno")
    private String apellido_paterno;
    
    @Column(name = "apellido_materno")
    private String apellido_materno;
    
    @Column(name = "telefono_local")
    private String telefono_local;
    
    @Column(name = "telefono_movil")
    private String telefono_movil;
    
    public Persona(){
        
    }

    public long getId_persona() {
        return id_persona;
    }

    public void setId_persona(long id_persona) {
        this.id_persona = id_persona;
    }

    public Usuario getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(Usuario usuario_id) {
        this.usuario_id = usuario_id;
    }

    public Cliente getCliente_persona() {
        return cliente_persona;
    }

    public void setCliente_persona(Cliente cliente_persona) {
        this.cliente_persona = cliente_persona;
    }

    public Empleado getEmpleado_persona() {
        return empleado_persona;
    }

    public void setEmpleado_persona(Empleado empleado_persona) {
        this.empleado_persona = empleado_persona;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    

    public String getTelefono_local() {
        return telefono_local;
    }

    public void setTelefono_local(String telefono_local) {
        this.telefono_local = telefono_local;
    }

    public String getTelefono_movil() {
        return telefono_movil;
    }

    public void setTelefono_movil(String telefono_movil) {
        this.telefono_movil = telefono_movil;
    }
    
    
    
}
