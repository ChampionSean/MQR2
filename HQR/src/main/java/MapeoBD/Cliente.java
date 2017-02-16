/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MapeoBD;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Salvador
 */
@Entity
@Table(name="Cliente")
public class Cliente {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_cliente")
    private long id_cliente;
    
    
    
    @OneToOne
    @JoinColumn(name="persona_id")
    private Persona persona_id;
    
    
    
    @Column(name = "area")
    private String area;
    
    @Column(name = "puesto")
    private String puesto;
    
    @Column(name = "nombre_empresa")
    private String nombre_empresa;
    
    @Column(name = "habilitado")
    private int habilitado;
    
    @OneToMany(mappedBy="cliente")
    private Set<Proyecto> proyecto = new HashSet<>(); ;
    
    @OneToMany(mappedBy="prueba")
    private Set<Prueba_Cliente> prueba_cliente = new HashSet<>();

   

    public Cliente() {
    }

    
    public long getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(long id_cliente) {
        this.id_cliente = id_cliente;
    }

    public Persona getPersona_id() {
        return persona_id;
    }

    public void setPersona_id(Persona persona_id) {
        this.persona_id = persona_id;
    }

    public Set<Proyecto> getProyecto() {
        return proyecto;
    }

    public void setProyecto(Set<Proyecto> proyecto) {
        this.proyecto = proyecto;
    }

    public Set<Prueba_Cliente> getPrueba_cliente() {
        return prueba_cliente;
    }

    public void setPrueba_cliente(Set<Prueba_Cliente> prueba_cliente) {
        this.prueba_cliente = prueba_cliente;
    }

   

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    public String getNombre_empresa() {
        return nombre_empresa;
    }

    public void setNombre_empresa(String nombre_empresa) {
        this.nombre_empresa = nombre_empresa;
    }

    public int getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(int habilitado) {
        this.habilitado = habilitado;
    }
    
        
}
