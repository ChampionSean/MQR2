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

/**
 *
 * @author Salvador
 */

@Entity
@Table(name="prueba_empleado")
public class Prueba_empleado {
    
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
   
    
    @ManyToOne
    @JoinColumn(name = "empleado_id")
    private Empleado empleado;
    
    @ManyToOne
    @JoinColumn(name = "prueba_id")
    private Prueba prueba;
    
    @Column(name = "puntaje_prueba")
    private double puntaje_prueba;
    
    @Column(name = "fecha_prueba")
    private Date fecha_prueba;

    public Prueba_empleado() {
        
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Prueba getPrueba() {
        return prueba;
    }

    public void setPrueba(Prueba prueba) {
        this.prueba = prueba;
    }

    public double getPuntaje_prueba() {
        return puntaje_prueba;
    }

    public void setPuntaje_prueba(double puntaje_prueba) {
        this.puntaje_prueba = puntaje_prueba;
    }

    public Date getFecha_prueba() {
        return fecha_prueba;
    }

    public void setFecha_prueba(Date fecha_prueba) {
        this.fecha_prueba = fecha_prueba;
    }
    
    
}
