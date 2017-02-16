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
@Table(name="Pregunta_prueba")
public class Pregunta_prueba {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    
    
    @ManyToOne
    @JoinColumn(name = "pregunta_id")
    private Pregunta pregunta;
    
    @ManyToOne
    @JoinColumn(name = "prueba_id")
    private Prueba prueba;
    
   
    @Column(name = "numero_pregunta")
    private int numero_pregunta;
    
    
    

    public Pregunta_prueba() {
       
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Pregunta getPregunta() {
        return pregunta;
    }

    public void setPregunta(Pregunta pregunta) {
        this.pregunta = pregunta;
    }

    public Prueba getPrueba() {
        return prueba;
    }

    public void setPrueba(Prueba prueba) {
        this.prueba = prueba;
    }

    public int getNumero_pregunta() {
        return numero_pregunta;
    }

    public void setNumero_pregunta(int numero_pregunta) {
        this.numero_pregunta = numero_pregunta;
    }
    
    
}
