/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MapeoBD;

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
@Table(name="Pregunta_respuesta")
public class Pregunta_respuesta {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_pregunta_respuesta")
    private long id_pregunta_respuesta;
     
    @ManyToOne
    @JoinColumn(name = "pregunta_id")
    private Pregunta pregunta;
    
    @ManyToOne
    @JoinColumn(name = "respuesta_id")
    private Respuesta respuesta;
    
    @Column(name = "puntaje_respuesta")
    private long puntaje_respuesta;
    
    
    
    @OneToMany(mappedBy = "pregunta_respuesta")
    private Set<Respuesta_empleado> respuesta_empleado = new HashSet<>();
    
    public Pregunta_respuesta(){
        
    };

   
    public long getId_pregunta_respuesta() {
        return id_pregunta_respuesta;
    }

    public void setId_pregunta_respuesta(long id_pregunta_respuesta) {
        this.id_pregunta_respuesta = id_pregunta_respuesta;
    }

    public Pregunta getPregunta() {
        return pregunta;
    }

    public void setPregunta(Pregunta pregunta) {
        this.pregunta = pregunta;
    }

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }

    public Set<Respuesta_empleado> getRespuesta_empleado() {
        return respuesta_empleado;
    }

    public void setRespuesta_empleado(Set<Respuesta_empleado> respuesta_empleado) {
        this.respuesta_empleado = respuesta_empleado;
    }

    

    public long getPuntaje_respuesta() {
        return puntaje_respuesta;
    }

    public void setPuntaje_respuesta(long puntaje_respuesta) {
        this.puntaje_respuesta = puntaje_respuesta;
    }
    
    
    
    
    
}
