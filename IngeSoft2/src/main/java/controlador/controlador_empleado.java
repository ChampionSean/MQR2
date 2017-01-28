/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import MapeoBD.Cliente;
import MapeoBD.Empleado;
import MapeoBD.Empleado_proyecto;
import MapeoBD.Persona;
import MapeoBD.Proyecto;
import MapeoBD.Prueba;
import MapeoBD.Prueba_Proyecto;
import MapeoBD.Usuario;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import modelo.ClienteDAO;
import modelo.EmpleadoDAO;
import modelo.PruebaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Salvador
 */

@Controller
public class controlador_empleado {

 @Autowired
 private EmpleadoDAO empleado_bd;
 @Autowired
 private ClienteDAO cliente_bd;
 
  @Autowired
   private PruebaDAO prueba_bd;
 
 
 
 
 @RequestMapping(value = "/empleado/pruebaR", method=RequestMethod.POST)
public ModelAndView pruebaR(ModelMap model, HttpServletRequest request, RedirectAttributes redirect){
    System.out.println("hola prueba");
    LinkedList<Long> respuestas = new LinkedList<Long>();
    for(int i = 1; i < 31; i++){
        Long b = Long.parseLong(request.getParameter(String.valueOf(i)));
        System.out.println(b);
        respuestas.add(b);
    }
    for(Long b:respuestas){
        System.out.println(b);
        if(b==0){
            return new ModelAndView("redirect:/error");   
        }
        
    }
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
    Empleado doe = empleado_bd.consultaEmpleadoEma(currentPrincipalName);
    
    empleado_bd.contestar(respuestas, 1,doe.getId_empleado());
    
    model.addAttribute("respuestas", respuestas);
    return new ModelAndView("redirect:/empleado/home");   
    
    
}

@RequestMapping(value = "/empleado/show_prueba", method=RequestMethod.GET)
public String empleShowP(ModelMap model, HttpServletRequest request, RedirectAttributes redirect){
    long b = Long.parseLong(request.getParameter("id"));
    if(b == 1){
        return "prueba";
    }
    return "prueba2";
}

@RequestMapping(value = "/empleado/pruebaClima", method=RequestMethod.POST)
public ModelAndView pruebaClima(ModelMap model, HttpServletRequest request, RedirectAttributes redirect){
    System.out.println("hola prueba");
    LinkedList<Long> respuestas = new LinkedList<Long>();
    for(int i = 1; i < 21; i++){
        Long b = Long.parseLong(request.getParameter(String.valueOf(i)));
        System.out.println(b);
         respuestas.add(b);
        
    }
    for(Long b:respuestas){
        System.out.println(b);
        if(b==0){
            return new ModelAndView("redirect:/error");   
        }
        
    }
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
    Empleado doe = empleado_bd.consultaEmpleadoEma(currentPrincipalName);
    
    empleado_bd.contestarClima(respuestas, 1,doe.getId_empleado());
    
    model.addAttribute("respuestas", respuestas);
    return new ModelAndView("redirect:/empleado/home");   
    
    
}
 
 
 
 
 
 @RequestMapping(value = "/empleado/home", method=RequestMethod.GET)
public ModelAndView homeEmpl(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
    Persona persona = cliente_bd.porCorreo(currentPrincipalName);
     Set<Empleado_proyecto> s = empleado_bd.getProyectos(persona.getEmpleado_persona().getId_empleado());
     model.addAttribute("proyectos", s);
     model.addAttribute("username", currentPrincipalName);
     return new ModelAndView("home_empleado", model);
   
}


 



@RequestMapping(value = "/empleado/prueba", method=RequestMethod.GET)
public ModelAndView pruebaEmpl(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
   // List b = empleado_bd.getProyectos(1);
    //model.addAttribute("proyectos", b);
     model.addAttribute("username", currentPrincipalName);
     return new ModelAndView("empleado_prueba", model);
   
}


 
 @RequestMapping(value = "/empleados", method=RequestMethod.GET)
public ModelAndView listaEmpleados(HttpServletRequest a, ModelMap b){
     if(a.getSession().getAttribute("login") == null){
         return new ModelAndView("redirect:/");
     }
     List c = empleado_bd.getEmpleados();
     b.addAttribute("empleados", c);
     return new ModelAndView("datos_empleado",b);   
}

@RequestMapping(value = "/verificaEmpleado", method=RequestMethod.GET)
public String crearEmpleado(HttpServletRequest a){
     
    return "crearEm";
}

@RequestMapping(value = "/verEmpleado", method = RequestMethod.POST)
    public ModelAndView consultarEmpleado(ModelMap model,HttpServletRequest request){
        String nombre = request.getParameter("nombre_cliente"); 
        Empleado empleado= empleado_bd.consultaEmpleadoNom(nombre);
       
       Long id_empleado=empleado.getId_empleado();
       String direcciones=empleado.getDireccion();
       int h_x_s=empleado.getHoras_x_semana();
       String carrera=empleado.getCarrera();
       String edo_civil=empleado.getEstado_civil();
       int numero_hijos=empleado.getNumero_hijos();
       Date fecha_nac=empleado.getFecha_nacimiento();
       String antiguedad=empleado.getAntiguedad();
       String sueldo=empleado.getSueldo_mensual();
       String sexo=empleado.getSexo();
       String candidato=empleado.getCandidato();
       int habilitado=empleado.getHabilitado();
       
       model.addAttribute("id_empleado",id_empleado);
       model.addAttribute("direccion",direcciones);
       model.addAttribute("horas_x_semana",h_x_s);
       model.addAttribute("carrera",carrera);
       model.addAttribute("estado_civil",edo_civil);
       model.addAttribute("numero_hijos",numero_hijos);
       model.addAttribute("fecha_nacimiento",fecha_nac);
       model.addAttribute("antiguiedad",antiguedad);
       model.addAttribute("sueldo_mensual",sueldo);
       model.addAttribute("sexo",sexo);
       model.addAttribute("candidato",candidato );
       model.addAttribute("habilitado", habilitado);
       
       return new ModelAndView("datos_empleado",model);   
       
       
    }
    
     @RequestMapping(value = "/borraEmpleado", method = RequestMethod.POST)
    public ModelAndView borrarEmpleado(ModelMap model,HttpServletRequest request){
         String nombre_empleado = request.getParameter("nombre_empleado"); 
         empleado_bd.borrarEmpleadoNom(nombre_empleado);
         
         model.addAttribute("nombre_empleado", nombre_empleado);
     
       return new ModelAndView("modificadoEmpleado",model);   
       
    }
    
    
    @RequestMapping(value = "/cliente/crearEmpleado", method = RequestMethod.POST)
    public ModelAndView creaEmpleado(ModelMap model,HttpServletRequest request){
        
       SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
       
       
       Usuario u = new Usuario();
       
        String pass = request.getParameter("password");
       String password= null;
       MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(pass.getBytes());
            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b & 0xff));
                } 
            password=sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        u.setLogin_usuario("usuario");
        u.setPassword_usuario(password);
        u.setRol_usuario("ROLE_EMPLEADO");
       
        Persona p = new Persona();
       p.setCorreo(request.getParameter("correo"));
       p.setNombre(request.getParameter("Nombre_Cliente"));
       p.setApellido_paterno(request.getParameter("apellidop"));
       p.setApellido_materno(request.getParameter("apellidom"));
       p.setTelefono_local(request.getParameter("Telefono_Local"));
       p.setTelefono_movil(request.getParameter("Telefono_Movil"));
       
       String fecha_nac=request.getParameter("fecha_nacimiento"); 
       
       Date nacimiento= new Date();
       
       try {
       nacimiento= formatter.parse(fecha_nac);
       
       } catch (ParseException ex) {
         Logger.getLogger(controlador_empleado.class.getName()).log(Level.SEVERE, null, ex);
       }
       Empleado e=new Empleado();
       
       e.setDireccion("");
       e.setHoras_x_semana(0);
       e.setCarrera(request.getParameter("carrera"));
       e.setEstado_civil(request.getParameter("estado_civil"));
       e.setNumero_hijos(Integer.parseInt(request.getParameter("numero_hijos")));
       e.setFecha_nacimiento(nacimiento);
       e.setAntiguedad("");
       e.setSueldo_mensual(request.getParameter("sueldo_mensual"));
       e.setSexo(request.getParameter("sexo"));
       e.setCandidato(request.getParameter("candidato"));
       e.setHabilitado(1);
       e.setArea(request.getParameter("area"));
       e.setNombre_empresa(request.getParameter("Nombre_Empresa"));
       e.setPuesto(request.getParameter("Puesto"));
       
       empleado_bd.crearEmpleado(e, p, u, request.getParameter("proyecto"));
       
       model.addAttribute("empleado", e);
       return new ModelAndView("redirect:/cliente/home"); 
       
    }
}
