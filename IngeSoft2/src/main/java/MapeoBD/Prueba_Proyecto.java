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
@Table(name="Prueba_Proyecto")
public class Prueba_Proyecto {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_prueba_proyecto")
    private long id_prueba_proyecto;
    
    
    @ManyToOne
    @JoinColumn(name = "prueba_id")
    private Prueba prueba;
    
    @ManyToOne
    @JoinColumn(name = "proyecto_id")
    private Proyecto proyecto;
    
    
    @Column(name = "puntaje_prueba")
    private int puntaje_prueba;
    
    @Column(name = "fecha_creacion")
    private Date fecha_creacion;
    
    @Column(name = "habilitado")
    private int habilitado;
    
   public Prueba_Proyecto(){
        
    }

    

    public long getId_prueba_proyecto() {
        return id_prueba_proyecto;
    }

    public void setId_prueba_proyecto(long id_prueba_proyecto) {
        this.id_prueba_proyecto = id_prueba_proyecto;
    }

    public Prueba getPrueba() {
        return prueba;
    }

    public void setPrueba(Prueba prueba) {
        this.prueba = prueba;
    }

    public Proyecto getProyecto() {
        return proyecto;
    }

    public void setProyecto(Proyecto proyecto) {
        this.proyecto = proyecto;
    }


    public int getPuntaje_prueba() {
        return puntaje_prueba;
    }

    public void setPuntaje_prueba(int puntaje_prueba) {
        this.puntaje_prueba = puntaje_prueba;
    }

    public Date getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(Date fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public int getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(int habilitado) {
        this.habilitado = habilitado;
    }
    
    
    
    
    
}
