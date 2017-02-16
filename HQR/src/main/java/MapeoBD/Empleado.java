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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Salvador
 */
@Entity
@Table(name="Empleado")
public class Empleado {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_empleado")
    private long id_empleado;
    
    @OneToOne
    @JoinColumn(name="persona_id")
    private Persona persona_id;
    
    @Column(name = "direccion")
    private String direccion;
    
    @Column(name = "horas_x_semana")
    private int horas_x_semana;
    
    @Column(name = "carrera")
    private String carrera;
    
    @Column(name = "estado_civil")
    private String estado_civil;
    
    @Column(name = "numero_hijos")
    private int numero_hijos;
    
    @Column(name = "fecha_nacimiento")
    private Date fecha_nacimiento;
    
    @Column(name = "antiguedad")
    private String antiguedad;
    
    @Column(name = "sueldo_mensual")
    private String sueldo_mensual;
    
    @Column(name = "sexo")
    private String sexo;
    
    @Column(name = "candidato")
    private String candidato;
    
    @Column(name = "habilitado")
    private int habilitado;
    
     @Column(name = "area")
    private String area;
    
    @Column(name = "puesto")
    private String puesto;
    
    @Column(name = "nombre_empresa")
    private String nombre_empresa;
    
    
    @OneToMany(mappedBy = "empleado")
    private Set<Empleado_proyecto> empleado_proyecto = new HashSet<>();
    
    @OneToMany(mappedBy = "empleado")
    private Set<Respuesta_empleado> respuesta_empleado = new HashSet<>();
    
    @OneToMany(mappedBy = "empleado")
    private Set<Prueba_empleado> prueba_empleado = new HashSet<>();

    
    
    public Empleado(){
        
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
    
    

    public void setAntiguedad(String antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    

    public Set<Prueba_empleado> getPrueba_empleado() {
        return prueba_empleado;
    }

    public void setPrueba_empleado(Set<Prueba_empleado> prueba_empleado) {
        this.prueba_empleado = prueba_empleado;
    }
    
   
    
    public long getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(long id_empleado) {
        this.id_empleado = id_empleado;
    }

  
    public Set<Respuesta_empleado> getRespuesta_empleado() {
        return respuesta_empleado;
    }

    public void setRespuesta_empleado(Set<Respuesta_empleado> respuesta_empleado) {
        this.respuesta_empleado = respuesta_empleado;
    }

   

    public String getDireccion() {
        return direccion;
    }

    public Persona getPersona_id() {
        return persona_id;
    }

    public void setPersona_id(Persona persona_id) {
        this.persona_id = persona_id;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getHoras_x_semana() {
        return horas_x_semana;
    }

    public void setHoras_x_semana(int horas_x_semana) {
        this.horas_x_semana = horas_x_semana;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getEstado_civil() {
        return estado_civil;
    }

    public void setEstado_civil(String estado_civil) {
        this.estado_civil = estado_civil;
    }

    public int getNumero_hijos() {
        return numero_hijos;
    }

    public void setNumero_hijos(int numero_hijos) {
        this.numero_hijos = numero_hijos;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getAntiguedad() {
        return antiguedad;
    }

    
    public String getSueldo_mensual() {
        return sueldo_mensual;
    }

    public void setSueldo_mensual(String sueldo_mensual) {
        this.sueldo_mensual = sueldo_mensual;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCandidato() {
        return candidato;
    }

    public void setCandidato(String candidato) {
        this.candidato = candidato;
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
