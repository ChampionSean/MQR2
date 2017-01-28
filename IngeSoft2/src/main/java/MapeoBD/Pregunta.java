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
@Table(name="Pregunta")
public class Pregunta {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_pregunta")
    private long id_pregunta;
    
    @OneToMany(mappedBy = "pregunta")
    private Set<Pregunta_respuesta> pregunta_respuesta = new HashSet<>();
    
    @OneToMany(mappedBy = "pregunta")
    private Set<Pregunta_prueba> pregunta_prueba = new HashSet<>();
    
    @Column(name = "nombre_pregunta")
    private String nombre_pregunta;
    
    @Column(name = "habilitado")
    private int habilitado;

    public Pregunta() {
      
    }

    public Set<Pregunta_respuesta> getPregunta_respuesta() {
        return pregunta_respuesta;
    }

    public void setPregunta_respuesta(Set<Pregunta_respuesta> pregunta_respuesta) {
        this.pregunta_respuesta = pregunta_respuesta;
    }

    public Set<Pregunta_prueba> getPregunta_prueba() {
        return pregunta_prueba;
    }

    public void setPregunta_prueba(Set<Pregunta_prueba> pregunta_prueba) {
        this.pregunta_prueba = pregunta_prueba;
    }

   
    
    public long getId_pregunta() {
        return id_pregunta;
    }

    public void setId_pregunta(long id_pregunta) {
        this.id_pregunta = id_pregunta;
    }

    public String getNombre_pregunta() {
        return nombre_pregunta;
    }

    public void setNombre_pregunta(String nombre_pregunta) {
        this.nombre_pregunta = nombre_pregunta;
    }

    public int getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(int habilitado) {
        this.habilitado = habilitado;
    }

        
    
}
