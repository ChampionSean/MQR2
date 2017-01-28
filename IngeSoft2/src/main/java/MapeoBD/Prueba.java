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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Salvador
 */
@Entity
@Table(name="Prueba")
public class Prueba {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_prueba")
    private long id_prueba;
   
    @Column(name = "nombre_prueba" )
    private String nombre_prueba;
   
    @OneToMany(mappedBy = "prueba")
    private Set<Pregunta_prueba> pregunta_prueba = new HashSet<>();
    
    @OneToMany(mappedBy = "prueba")
    private Set<Prueba_Proyecto> prueba_proyecto = new HashSet<>();
    
    @OneToMany(mappedBy = "prueba")
    private Set<Prueba_Cliente> prueba_cliente = new HashSet<>();
    
    @OneToMany(mappedBy ="prueba")
    private Set<Prueba_empleado> prueba_empleado = new HashSet<>();
    
    @Column(name = "descripcion_prueba"  )
    private String descripcion_prueba ;
    
    @Column(name = "habilitado"  )
    private int habilitado ;

 
    
    public Prueba(){
        
    }

    public Set<Prueba_Cliente> getPrueba_cliente() {
        return prueba_cliente;
    }

    public void setPrueba_cliente(Set<Prueba_Cliente> prueba_cliente) {
        this.prueba_cliente = prueba_cliente;
    }

    public Set<Prueba_empleado> getPrueba_empleado() {
        return prueba_empleado;
    }

    public void setPrueba_empleado(Set<Prueba_empleado> prueba_empleado) {
        this.prueba_empleado = prueba_empleado;
    }
    
    

    public Set<Prueba_Proyecto> getPrueba_proyecto() {
        return prueba_proyecto;
    }

    public void setPrueba_proyecto(Set<Prueba_Proyecto> prueba_proyecto) {
        this.prueba_proyecto = prueba_proyecto;
    }
    
    

    public Set<Pregunta_prueba> getPregunta_prueba() {
        return pregunta_prueba;
    }

    public void setPregunta_prueba(Set<Pregunta_prueba> pregunta_prueba) {
        this.pregunta_prueba = pregunta_prueba;
    }
    
    
    
   
    public long getId_prueba() {
        return id_prueba;
    }

    public void setId_prueba(long id_prueba) {
        this.id_prueba = id_prueba;
    }

    public String getNombre_prueba() {
        return nombre_prueba;
    }

    public void setNombre_prueba(String nombre_prueba) {
        this.nombre_prueba = nombre_prueba;
    }

    public String getDescripcion_prueba() {
        return descripcion_prueba;
    }

    public void setDescripcion_prueba(String descripcion_prueba) {
        this.descripcion_prueba = descripcion_prueba;
    }

    public int getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(int habilitado) {
        this.habilitado = habilitado;
    }

    
}
