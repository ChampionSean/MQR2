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
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Salvador
 */
@Entity
@Table(name="Respuesta_empleado")
public class Respuesta_empleado {
    
     @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
     @Column(name = "id")
     private long id;
     
     
    @ManyToOne
    @JoinColumn(name = "empleado_id")
    private Empleado empleado;
     
     
    @ManyToOne
    @JoinColumn(name = "pregunta_respuesta_id")
    private Pregunta_respuesta pregunta_respuesta;

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

    public Pregunta_respuesta getPregunta_respuesta() {
        return pregunta_respuesta;
    }

    public void setPregunta_respuesta(Pregunta_respuesta pregunta_respuesta) {
        this.pregunta_respuesta = pregunta_respuesta;
    }
     
     
    
    
     
     

}
