/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MapeoBD;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Salvador
 */
@Entity
@Table(name="Proyecto")
public class Proyecto {
     @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_proyecto")
    private long id_proyecto;
     
    @Column(name = "nombre_proyecto")
    private String nombre_proyecto;
    
    @Column(name = "descripcion")
    private String descripcion;
    
    @Column(name = "fecha_inicio")
    private Date fecha_inicio;
    
    @Column(name = "fecha_fin")
    private Date fecha_fin;
    
    @Column(name = "habilitado")
    private int habilitado;

    
    @OneToMany(mappedBy = "proyecto")
    private Set<Empleado_proyecto> empleado_proyecto = new HashSet<>(); 
    
    @OneToMany(mappedBy = "proyecto")
    private Set<Prueba_Proyecto> prueba_proyecto = new HashSet<>();
    
    @ManyToOne
    @JoinColumn(name="cliente_id")
    private Cliente cliente;

    public Set<Prueba_Proyecto> getPrueba_proyecto() {
        return prueba_proyecto;
    }

    public void setPrueba_proyecto(Set<Prueba_Proyecto> prueba_proyecto) {
        this.prueba_proyecto = prueba_proyecto;
    }
    
    
    public Proyecto() {
    }
    
    public long getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(long id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getNombre_proyecto() {
        return nombre_proyecto;
    }

    public void setNombre_proyecto(String nombre_proyecto) {
        this.nombre_proyecto = nombre_proyecto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public int getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(int habilitado) {
        this.habilitado = habilitado;
    }

    public Set<Empleado_proyecto> getEmpleado_proyecto() {
        return empleado_proyecto;
    }

    public void setEmpleado_proyecto(Set<Empleado_proyecto> empleado_proyecto) {
        this.empleado_proyecto = empleado_proyecto;
    }
    
    
}
