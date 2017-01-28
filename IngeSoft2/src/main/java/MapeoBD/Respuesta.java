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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Salvador
 */
@Entity
@Table(name="Respuesta")
public class Respuesta {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_respuesta")
    private long id_respuesta;
    
    @Column(name = "nombre_respuesta")
    private String nombre_respuesta;
    
    @Column(name = "habilitado")
    private int habilitado;
    
    @OneToMany(mappedBy = "respuesta")
    private Set<Pregunta_respuesta> pregunta_respuesta = new HashSet<>();

    public Respuesta() {
      
    }

    public long getId_respuesta() {
        return id_respuesta;
    }

    public void setId_respuesta(long id_respuesta) {
        this.id_respuesta = id_respuesta;
    }

    public Set<Pregunta_respuesta> getPregunta_respuesta() {
        return pregunta_respuesta;
    }

    public void setPregunta_respuesta(Set<Pregunta_respuesta> pregunta_respuesta) {
        this.pregunta_respuesta = pregunta_respuesta;
    }

 

    

    public long getId_repuesta() {
        return id_respuesta;
    }

    public void setId_repuesta(long id_repuesta) {
        this.id_respuesta = id_repuesta;
    }

    public String getNombre_respuesta() {
        return nombre_respuesta;
    }

    public void setNombre_respuesta(String nombre_respuesta) {
        this.nombre_respuesta = nombre_respuesta;
    }

    public int getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(int habilitado) {
        this.habilitado = habilitado;
    }
    
    
    
}
