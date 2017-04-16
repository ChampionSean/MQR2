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
import MapeoBD.Prueba_Cliente;
import MapeoBD.Prueba_Proyecto;
import MapeoBD.Prueba_empleado;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import modelo.ClienteDAO;
import modelo.EmpleadoDAO;
import modelo.ProyectoDAO;
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
public class controlador_proyecto {
 @Autowired
 private ProyectoDAO proyecto_bd;
 
  @Autowired
 private ClienteDAO cliente_bd;
  
  @Autowired
 private EmpleadoDAO empleado_bd;
  
  @Autowired
 private PruebaDAO prueba_bd;
 
@RequestMapping(value = "/administrador/show_p", method=RequestMethod.GET)
public ModelAndView show_proyecto(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Proyecto proyecto = proyecto_bd.verProyecto(Long.parseLong(a.getParameter("id")));
    if(proyecto.getHabilitado() == 1){
        model.addAttribute("checado", "checked");
    }
    Cliente e = proyecto.getCliente();
    
    Set<Prueba_Proyecto> pc = proyecto_bd.damePruebas(Long.parseLong(a.getParameter("id")));
    Set<Empleado_proyecto> empleados = proyecto_bd.dameEmpleados(proyecto.getId_proyecto());
    model.addAttribute("pruebas", pc);
    model.addAttribute("cliente",e);
    model.addAttribute("proyecto", proyecto);
    model.addAttribute("empleados", empleados);
    return new ModelAndView("remodificadoPro", model);
    
}



@RequestMapping(value = "/empleado/show_ep", method=RequestMethod.GET)
public ModelAndView showep_proyecto(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Proyecto proyecto = proyecto_bd.verProyecto(Long.parseLong(a.getParameter("id")));
    if(proyecto.getHabilitado() == 1){
        model.addAttribute("checado", "checked");
    }
     Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      String currentPrincipalName = authentication.getName();
    model.addAttribute("username", currentPrincipalName);
    Cliente e = proyecto.getCliente();
    
    Set<Prueba_Proyecto> pruebas = proyecto_bd.damePruebas(proyecto.getId_proyecto());
     
 
    
    Persona p = cliente_bd.porCorreo(currentPrincipalName);
    Set<Prueba_empleado> pe = empleado_bd.getPruebas(p.getEmpleado_persona().getId_empleado());
    
    LinkedList<Long> indices = new LinkedList<Long>();
    LinkedList<Prueba> s = new LinkedList<Prueba>();
   
     for(Prueba_Proyecto pp:pruebas){
        indices.add(pp.getPrueba().getId_prueba());
     }
     for(Prueba_empleado pee:pe){
        
             indices.remove(pee.getPrueba().getId_prueba());    
     }
     for(Long b:indices){
         s.add(prueba_bd.getPrueba(b));
     }
     
    
    model.addAttribute("pruebas", s);
  
    model.addAttribute("cliente",e);
    model.addAttribute("proyecto", proyecto);
    return new ModelAndView("empleado_proyecto", model);
    
}





@RequestMapping(value = "/cliente/show_cp", method=RequestMethod.GET)
public ModelAndView showcp_proyecto(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Proyecto proyecto = proyecto_bd.verProyecto(Long.parseLong(a.getParameter("id")));
    if(proyecto.getHabilitado() == 1){
        model.addAttribute("checado", "checked");
    }
    Cliente e = proyecto.getCliente();
    Set<Prueba_Cliente> pruebas = cliente_bd.daPruebas(e.getPersona_id().getCorreo());
   Set<Prueba_Proyecto> pc = proyecto_bd.damePruebas(Long.parseLong(a.getParameter("id")));
   
   Set<Prueba_Cliente> pruebasFaltantes = cliente_bd.daPruebas(e.getPersona_id().getCorreo());
   pruebasFaltantes.clear();
    boolean esta = false;
   for(Prueba_Cliente p:pruebas){
       for(Prueba_Proyecto k:pc){
           if(p.getPrueba().getNombre_prueba().equals(k.getPrueba().getNombre_prueba())){
               esta = true;
           }
       }
       if(!esta){
       pruebasFaltantes.add(p);
       }
       esta = false;
   }
   
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      String currentPrincipalName = authentication.getName();
    model.addAttribute("username", currentPrincipalName);
    model.addAttribute("personas", proyecto_bd.dameEmpleados(Long.parseLong(a.getParameter("id"))));
    model.addAttribute("pruebak", pc);
    model.addAttribute("pruebas", pruebasFaltantes);
    model.addAttribute("cliente",e);
    model.addAttribute("proyecto", proyecto);
  
    
    return new ModelAndView("proyecto_c", model);
    
}
 
 @RequestMapping(value = "/administrador/proyectos", method=RequestMethod.GET)
public ModelAndView admin_proyecto(HttpServletRequest a, ModelMap b){
     
     List c = proyecto_bd.getProyectos();
     b.addAttribute("proyectos", c);
     return new ModelAndView("datos_proyecto",b);   
}
 
@RequestMapping(value = "/verificaProyecto", method=RequestMethod.GET)
public String crearProyecto(HttpServletRequest a){
     
    return "crearpro";
}
 @RequestMapping(value = "/verProyecto", method = RequestMethod.POST)
    public ModelAndView ConsultarProyecto(ModelMap model,HttpServletRequest request){
        String id_proyecto = request.getParameter("nom_pro"); 
       Proyecto pro= proyecto_bd.consultaProyecto(id_proyecto);
       
       long id_pro=pro.getId_proyecto();
       
       String nom_pro=pro.getNombre_proyecto();
       String descripcion=pro.getDescripcion();
       Date fecha_inicio=pro.getFecha_inicio();
       Date fecha_fin=pro.getFecha_fin();
       int habilitado=pro.getHabilitado();
       
       model.addAttribute("id_pro", id_pro);
       
       model.addAttribute("nom_pro", nom_pro);
       model.addAttribute("descripcion", descripcion);
       model.addAttribute("fecha_inicio", fecha_inicio);
       model.addAttribute("fecha_fin", fecha_fin);
       model.addAttribute("habilitado", habilitado);
       
       return new ModelAndView("datos_proyecto",model);   
       
       
    }
    /**
     * Consulta A 
     * todos los proyectos que son de un cliente por id
     * @param model
     * @param request
     * @return 
     */
    @RequestMapping(value = "/verProyectos_cliente", method = RequestMethod.POST)
    public ModelAndView ConsultarProyectos_cliente(ModelMap model,HttpServletRequest request){
        String id_cliente = request.getParameter("id_cliente"); 
       //List<Proyecto> proyectos= proyecto_bd.getProyecto(Long.parseLong(id_cliente));
       
      // model.addAttribute("proyectos", proyectos);
       
       return new ModelAndView("proyectos_cliente",model);   
    }
    
    /**
     * Consulta B
     * obtener el cliente dado un proyecto por id
     * @param model
     * @param request
     * @return 
     */
    @RequestMapping(value = "/clientede_proyecto", method = RequestMethod.POST)
    public ModelAndView ConsultarCliente_proyecto(ModelMap model,HttpServletRequest request){
        String id_proyecto = request.getParameter("id_proyecto");
        Cliente cliente=proyecto_bd.dameCliente(Long.parseLong(id_proyecto));
        
        model.addAttribute("cliente", cliente);
       
       return new ModelAndView("cliente_proyecto",model);   
        
    }
    
    /**
     * Consulta C
     * dado un proyecto obtener las pruebas asociadas a el
     * @param model
     * @param request
     * @return 
     */
     
    
    /**
     * Consulta D
     * dado un proyecto obtener las pruebas asociadas a el 
     * @param model
     * @param request
     * @return 
     */
    @RequestMapping(value = "/proyecto_empleados", method = RequestMethod.POST)
    public ModelAndView proyecto_empleados(ModelMap model,HttpServletRequest request){
        String id_proyecto = request.getParameter("id_proyecto");
        Set<Empleado_proyecto> empleados=proyecto_bd.dameEmpleados(Long.parseLong(id_proyecto));
        model.addAttribute("pruebas", empleados);
       
       return new ModelAndView("verproyecto_empleado",model);  
        
    }
     @RequestMapping(value = "/borraProyecto", method = RequestMethod.POST)
    public ModelAndView borrarProyecto(ModelMap model,HttpServletRequest request){
         String nom_Pro = request.getParameter("nom_Pro"); 
         proyecto_bd.borrarProyecto(nom_Pro);
         
         model.addAttribute("nom_Pro", nom_Pro);
     
       return new ModelAndView("modificadoPro",model);   
       
    }
    
    @RequestMapping(value = "/crearProyecto", method = RequestMethod.POST)
    public String creaProyecto(ModelMap model,HttpServletRequest request){
        
       SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
       
       String id_pro=request.getParameter("id_proyecto");
       String cli_id=request.getParameter("cli_id");
       String prueba_id=request.getParameter("prueba_id");
       String descripcion=request.getParameter("descripcion");
       String nom_Pro=request.getParameter("nom_pro");
       String fecha_inicio=request.getParameter("fecha_inicio");
       String fecha_fin=request.getParameter("fecha_fin");
       
       Date inicio=null;
       Date fin=null;
       try {
       inicio= formatter.parse(fecha_inicio);
       fin=formatter.parse(fecha_fin);
       } catch (ParseException ex) {
         Logger.getLogger(controlador_proyecto.class.getName()).log(Level.SEVERE, null, ex);
       }
       Proyecto p=new Proyecto();
       
      // proyecto_bd.crearProyecto(p);
       
       return "home";
       
    }
    
    
    @RequestMapping(value = "/remodificaProyecto", method = RequestMethod.POST)
    public ModelAndView remodificaProyecto(ModelMap model,HttpServletRequest request){
        String nom_Pro=request.getParameter("nom_Pro");
        
        
        Proyecto ve=(Proyecto) proyecto_bd.consultaProyecto(nom_Pro);
       model.addAttribute("id_pro", ve.getId_proyecto());
       model.addAttribute("nom_pro", ve.getNombre_proyecto());
       model.addAttribute("descripcion", ve.getDescripcion());
       model.addAttribute("fecha_inicio", ve.getFecha_inicio());
       model.addAttribute("fecha_fin", ve.getFecha_fin());
       model.addAttribute("habilitado", ve.getHabilitado());
       
      return new ModelAndView("remodificadoPro",model);   
    }
       
    
    @RequestMapping(value = "/cliente/modificaProyecto", method = RequestMethod.POST)
    public ModelAndView modificaProyecto(ModelMap model,HttpServletRequest request){
       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
       String descripcion=request.getParameter("descripcion");
       String nom_Pro=request.getParameter("nom_pro");
       String fecha_inicio=request.getParameter("fecha_inicio");
       String fecha_fin=request.getParameter("fecha_fin");
       String habilitado=request.getParameter("habilitado");
       String id_proyecto =request.getParameter("id_proyecto");
       if(habilitado == null){
           habilitado = "0";
       }else{
           habilitado = "1";
       }
       Date inicio=null;
       Date fin=null;
       try {
       inicio= format.parse(fecha_inicio);
       fin=format.parse(fecha_fin);
       } catch (ParseException ex) {
         Logger.getLogger(controlador_proyecto.class.getName()).log(Level.SEVERE, null, ex);
       }
       Proyecto p;
     
         p = new Proyecto();
         p.setNombre_proyecto(nom_Pro);
         p.setDescripcion(descripcion);
         p.setFecha_fin(fin);
         p.setFecha_inicio(inicio);
         p.setHabilitado(Integer.parseInt(habilitado));
     
       
       proyecto_bd.modificaProyecto(p,Long.parseLong(id_proyecto));
       
       
       return new ModelAndView("redirect:/cliente/home");   
       
       
    }
    
    
       
}
