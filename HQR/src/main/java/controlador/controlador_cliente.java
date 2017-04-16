/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import MapeoBD.Cliente;
import MapeoBD.Persona;
import MapeoBD.Proyecto;
import MapeoBD.Prueba;
import MapeoBD.Prueba_Cliente;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import modelo.ClienteDAO;
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
 * @author Marco
 */
@Controller
public class controlador_cliente {
    
    @Autowired
    private ClienteDAO cliente_bd;
    
    @Autowired
    private ProyectoDAO proyecto_bd;
    
     @Autowired
    private PruebaDAO prueba_bd;
    
@RequestMapping(value = "/cliente/home", method=RequestMethod.GET)
public ModelAndView homeClie(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      String currentPrincipalName = authentication.getName();
    model.addAttribute("username", currentPrincipalName);
  
       Set<Proyecto> ppp = cliente_bd.Proyectos(currentPrincipalName);
       model.addAttribute("proyectos", ppp);
       
       return new ModelAndView("home_cliente", model);
}


@RequestMapping(value = "/cliente/crear_proyecto", method=RequestMethod.GET)
public ModelAndView create_p_Clie(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
    Persona p = cliente_bd.porCorreo(currentPrincipalName);
       model.addAttribute("p",p);
       model.addAttribute("username", currentPrincipalName);
       return new ModelAndView("clienteCreaProyecto", model);
}



@RequestMapping(value = "/cliente/crear_proyectov", method=RequestMethod.POST)
public ModelAndView create_p_Cliev(ModelMap model, HttpServletRequest a, RedirectAttributes redirect) throws ServletException, IOException, ParseException{
    Proyecto p = new Proyecto();
    p.setNombre_proyecto(a.getParameter("nombrep"));
    
    p.setDescripcion(a.getParameter("descripcion"));
    String fecha_inicio = (a.getParameter("fi"));
    System.out.println(a.getParameter("fi"));
    String fecha_fin = (a.getParameter("ff"));
    System.out.println(a.getParameter("ff"));
   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date inicio;
       Date fin;
      inicio = formatter.parse(fecha_inicio);
      fin = formatter.parse(fecha_fin);
       
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
    Persona cli = cliente_bd.porCorreo(currentPrincipalName);
       p.setFecha_inicio(inicio);
       p.setFecha_fin(fin);
       p.setHabilitado(1);
       proyecto_bd.crearProyecto(p,cli.getCliente_persona().getId_cliente());
       
       return new ModelAndView("redirect:/cliente/home");
}
@RequestMapping(value = "/cliente/agregaPrueba", method=RequestMethod.GET)
public ModelAndView addProof(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Proyecto proyecto = proyecto_bd.getProyecto(Long.parseLong(a.getParameter("dd")));
    System.out.println(a.getParameter("id"));
    Prueba prueba = prueba_bd.getPrueba(Long.parseLong(a.getParameter("id")));
    proyecto_bd.addProof(proyecto, prueba);
    return new ModelAndView("redirect:/cliente/show_cp?id="+proyecto.getId_proyecto());
    
}

@RequestMapping(value = "/cliente/quitarPrueba", method=RequestMethod.GET)
public ModelAndView quitProof(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Proyecto proyecto = proyecto_bd.getProyecto(Long.parseLong(a.getParameter("dd")));
    System.out.println(a.getParameter("id"));
    Prueba prueba = prueba_bd.getPrueba(Long.parseLong(a.getParameter("id")));
    proyecto_bd.quitProof(proyecto, prueba);
    return new ModelAndView("redirect:/cliente/show_cp?id="+proyecto.getId_proyecto());
    
}

    @RequestMapping(value = "/cliente/formEmpleado", method=RequestMethod.GET)
public ModelAndView formEmpleado(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    String id = a.getParameter("id");
    model.addAttribute("id", id);
     Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      String currentPrincipalName = authentication.getName();
    model.addAttribute("username", currentPrincipalName);
    return new ModelAndView("crearEm");
    
}
}
