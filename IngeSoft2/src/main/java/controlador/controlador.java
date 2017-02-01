/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import ExcelView.ClientesExcelView;
import MapeoBD.Cliente;
import MapeoBD.Comentario;
import MapeoBD.Empleado;
import MapeoBD.Empleado_proyecto;
import MapeoBD.Persona;
import MapeoBD.Proyecto;
import MapeoBD.Prueba;
import MapeoBD.Prueba_Cliente;
import MapeoBD.Respuesta_empleado;
import MapeoBD.Usuario;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import modelo.ClienteDAO;
import modelo.ComentarioDAO;
import modelo.EmpleadoDAO;
import modelo.ProyectoDAO;
import modelo.PruebaDAO;
import modelo.Respuesta_empleadoDAO;
import modelo.UsuarioDAO;
import static org.apache.commons.codec.digest.DigestUtils.md5;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Marco
 */
@Controller
public class controlador {
    
    @Autowired
    JavaMailSender mail_sender;
    
    @Autowired
    private ClienteDAO cliente_bd;
    
    @Autowired
    private ProyectoDAO proyecto_bd;

    @Autowired
    private UsuarioDAO usuario_bd;
    
    @Autowired
    private EmpleadoDAO empleado_bd;
    
    @Autowired
    private PruebaDAO prueba_bd;
    
    @Autowired
    private ComentarioDAO comentario_bd;
    
     @Autowired
    private Respuesta_empleadoDAO respuestaE_bd;
   
    
    
@RequestMapping(value = "/administrador/prueba", method=RequestMethod.GET)
public ModelAndView prueba(ModelMap model, HttpServletRequest a){
    List<Prueba> p = prueba_bd.getPruebas();
    model.addAttribute("pruebas", p);
    return new ModelAndView("index_prueba", model);
}

@RequestMapping(value = "/crear", method=RequestMethod.GET)
public String crear(HttpServletRequest a){
     
    return "crear";
}

@RequestMapping(value = "/login", method=RequestMethod.GET)
public String logear(HttpServletRequest a){
     
    return "logeo";
}


@RequestMapping(value = "/checkEmail", method=RequestMethod.GET)
@ResponseBody
public boolean checkEmail(HttpServletRequest a){
    String email = a.getParameter("correo");
    Persona p = cliente_bd.porCorreo(email);
    System.out.println("El correo es:"+email);
    if(p == null){
        return true;
    }
    return false;
}




@RequestMapping(value = "/administrador/show_prueba", method=RequestMethod.GET)
public String adminShowP(ModelMap model, HttpServletRequest request, RedirectAttributes redirect){
    long b = Long.parseLong(request.getParameter("id"));
    if(b == 1){
        return "prueba";
    }
    return "prueba2";
}





@RequestMapping(value = "/administrador/pruebaR", method=RequestMethod.POST)
public ModelAndView pruebaRadmin(ModelMap model, HttpServletRequest request, RedirectAttributes redirect){
    System.out.println("hola prueba");
    LinkedList<Integer> respuestas = new LinkedList<Integer>();
    for(int i = 1; i < 31; i++){
        Integer b = Integer.parseInt(request.getParameter(String.valueOf(i)));
        respuestas.add(b);
    }
    for(Integer b:respuestas){
        System.out.println(b);
        if(b==0){
            return new ModelAndView("redirect:/error");   
        }
        
    }
    model.addAttribute("respuestas", respuestas);
    return new ModelAndView("prueba", model);   
    
    
}
@RequestMapping(value = "/administrador/agregaPrueba", method=RequestMethod.GET)
public ModelAndView addProof(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Cliente cliente = cliente_bd.verCliente(Long.parseLong(a.getParameter("dd")));
    System.out.println(a.getParameter("id"));
    Prueba prueba = prueba_bd.getPrueba(Long.parseLong(a.getParameter("id")));
    cliente_bd.addProof(cliente, prueba);
    return new ModelAndView("redirect:/administrador/show_cuenta?id="+cliente.getId_cliente());
    
}

@RequestMapping(value = "/administrador/show_cuenta", method=RequestMethod.GET)
public ModelAndView mostrarc(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Cliente cliente = cliente_bd.verCliente(Long.parseLong(a.getParameter("id")));
    LinkedList<Cliente> datos_e = new LinkedList<Cliente>();
    if(cliente.getHabilitado() == 1){
        model.addAttribute("checado", "checked");
    }
    List<Prueba> pruebas = prueba_bd.getPruebas();
   model.addAttribute("pruebah",pruebas);
    
   Set<Prueba_Cliente> pc = cliente_bd.daPruebas(cliente.getPersona_id().getCorreo());
    model.addAttribute("pruebas",pc);
    model.addAttribute("cliente", cliente);
    
    model.addAttribute("datos_e", datos_e);
    
    return new ModelAndView("cliente_show", model);
    
}

@RequestMapping(value = "/cliente/show", method=RequestMethod.GET)
public ModelAndView perfil(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Persona cliente = cliente_bd.porCorreo(a.getParameter("correo"));
    Cliente ab = cliente.getCliente_persona();
    model.addAttribute("cliente", ab);
    return new ModelAndView("clientec", model);
    
}



@RequestMapping(value = "/administrador/home", method=RequestMethod.GET)
public ModelAndView homeAdmin(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
  List b = cliente_bd.getClientesHabilitados();
    b.remove(0);
    List<Proyecto> k = proyecto_bd.getProyectos();
    int m = 0;
    for(Proyecto p:k){
        if (p.getHabilitado()==1){
            m++;
        }
    }
    List<Comentario> l = comentario_bd.getComentarios();
    model.addAttribute("numFaltantes", empleado_bd.getFaltantes());
    model.addAttribute("numPro", m);
    model.addAttribute("clientes", b);
    model.addAttribute("username", currentPrincipalName);
    model.addAttribute("numContestadas", empleado_bd.numContestadas());
    return new ModelAndView("home", model);   
}

//Funcion para desplegar las cuentas que no estan habilitadas.
@RequestMapping(value = "/administrador/cuentas_deshabilitadas", method=RequestMethod.GET)
public ModelAndView c_deshabilitadasAdmin(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
  List b = cliente_bd.getClientesDeshabilitados();
    
    model.addAttribute("clientes", b);
    model.addAttribute("username", currentPrincipalName);
    return new ModelAndView("cliente_deshabilitado", model);   
}

@RequestMapping(value = "/administrador/comentarios", method=RequestMethod.GET)
public ModelAndView c_comentarios(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
  List b = comentario_bd.getComentarios();
    model.addAttribute("comentarios",b);
    
    model.addAttribute("username", currentPrincipalName);
    return new ModelAndView("Comentarios", model);   
}


@RequestMapping(value = "/administrador/reporte", method=RequestMethod.GET)
public ModelAndView reporte(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
    List<Respuesta_empleado> re = respuestaE_bd.reporte();
 
    
    model.addAttribute("respuestaE", re);
    model.addAttribute("username", currentPrincipalName);
    
    return new ModelAndView("reporte", model);   
}






@RequestMapping(value = "home", method=RequestMethod.GET)
public ModelAndView home(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
  if(String.valueOf(SecurityContextHolder.getContext().getAuthentication().getAuthorities()).equals("[ROLE_ADMIN]")){
    return new ModelAndView("redirect:/administrador/home");
   }
      
      if(String.valueOf(SecurityContextHolder.getContext().getAuthentication().getAuthorities()).equals("[ROLE_CLIENTE]")){
    return new ModelAndView("redirect:/cliente/home");
   }
      if(String.valueOf(SecurityContextHolder.getContext().getAuthentication().getAuthorities()).equals("[ROLE_EMPLEADO]")){
    return new ModelAndView("redirect:/empleado/home");
   }
      return new ModelAndView("redirect:/error");
   
}

 @RequestMapping(value="/exportarExcelCliente", method = RequestMethod.GET)
    public ClientesExcelView exportarExcelAlumnoNombre(Model model, HttpServletRequest request, RedirectAttributes redirect){
       
        model.addAttribute("clientes", cliente_bd.getClientesHabilitados());    
        
        return new ClientesExcelView();
    }



    
     @RequestMapping(value = "/administrador/borraCliente", method = RequestMethod.POST)
    public ModelAndView borrarCliente(ModelMap model,HttpServletRequest request){

       String id_cliente = request.getParameter("id_cliente"); 
       cliente_bd.borrarCliente(Long.parseLong(id_cliente));
     
       model.addAttribute("id_cliente", id_cliente);
       
   
       return new ModelAndView("confirmacion",model);   
   }
    
    
    //metodo para crear clientes
     @RequestMapping(value = "/administrador/crearCliente", method = RequestMethod.POST)
    public String creaCliente(ModelMap model,HttpServletRequest request) throws UnsupportedEncodingException{
         
        Usuario u= new Usuario();
        Persona p = new Persona();
        Cliente c =new Cliente();
        
       String pass = request.getParameter("confirm_password");
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
        
        u.setLogin_usuario("Nombre_Usuario");
        u.setPassword_usuario(password);
        u.setRol_usuario("ROLE_CLIENTE");
       
       p.setCorreo(request.getParameter("correo"));
       p.setNombre(request.getParameter("Nombre_Cliente"));
       p.setApellido_paterno(request.getParameter("apellidop"));
       p.setApellido_materno(request.getParameter("apellidom"));
       p.setTelefono_local(request.getParameter("Telefono_Local"));
       p.setTelefono_movil(request.getParameter("Telefono_Movil"));
      
       c.setArea(request.getParameter("Area"));
       c.setNombre_empresa(request.getParameter("Nombre_Empresa"));
       c.setPuesto(request.getParameter("Puesto"));
       c.setHabilitado(1);
       
       cliente_bd.crearCliente(c, p, u);
       
        List b = cliente_bd.getClientesHabilitados();
        b.remove(0);
        model.addAttribute("clientes", b);
       return "redirect:/home";   
   }
    
    
    @RequestMapping(value = "/administrador/eliminarCliente", method = RequestMethod.POST)
    public ModelAndView eliminarCliente(ModelMap model, HttpServletRequest request){
        String id = request.getParameter("id_cliente");
        cliente_bd.borrarCliente(Long.parseLong(id));
        return new ModelAndView("redirect:/administrador/cuentas_deshabilitadas");
    }

    
    
    
     @RequestMapping(value = "/administrador/modificarCliente", method = RequestMethod.POST)
    public ModelAndView modificarCliente(ModelMap model,HttpServletRequest request){

       String id_cliente = request.getParameter("id_cliente");
       String pass = request.getParameter("confirm_password");
       String password= null;
       MessageDigest md;
       if(pass!=null){
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
        }}
       
       Persona p=new Persona();
       Cliente c = new Cliente();
       
       p.setCorreo(request.getParameter("correo"));
       p.setNombre(request.getParameter("Nombre_Cliente"));
       p.setApellido_paterno(request.getParameter("apellidop"));
       p.setApellido_materno(request.getParameter("apellidom"));
       p.setTelefono_local(request.getParameter("Telefono_Local"));
       p.setTelefono_movil(request.getParameter("Telefono_Movil"));
       
       
       c.setPuesto(request.getParameter("Puesto"));
       c.setArea(request.getParameter("Area"));
       c.setNombre_empresa(request.getParameter("Nombre_Empresa"));
       
       int habilitado;
       if (request.getParameter("habilitado") == null ){
           habilitado = 0;
           
       }else{
           habilitado = 1;
       }
       
      
       c.setHabilitado(habilitado);
      
       cliente_bd.modificaCliente(c,Long.parseLong(id_cliente),p, password);
       model.addAttribute("id_cliente", id_cliente);
       return new ModelAndView("redirect:/administrador/show_cuenta?id="+id_cliente);   
   }
    
   
        
  @RequestMapping(value = "/")
  public String index(ModelMap model){
      return "index";
  }
  
  @RequestMapping(value = "/comentario")
  public ModelAndView comentario(ModelMap model, HttpServletRequest request){
      Comentario c = new Comentario();
      c.setComentario(request.getParameter("comentario"));
      c.setCorreo(request.getParameter("correo"));
      c.setNombre(request.getParameter("nombre"));
      comentario_bd.guardar(c);
      
      mail_sender.send(construirEmail(c.getCorreo(), c.getComentario(), c.getNombre()));
      
      mail_sender.send(construirEmailManuel(c.getCorreo(), c.getComentario(), c.getNombre()));
      return  new ModelAndView("redirect:/");
  }
  
  
   private MimeMessagePreparator construirEmailManuel(final String correo , String mensaje, String nombre) {
        
        final String texto = "La persona " + nombre + " con email " +correo;
        final String url = "dejo el siguiente comentario: " + mensaje;
        
        MimeMessagePreparator message_preparator = new MimeMessagePreparator() {
 
            @Override
            public void prepare(MimeMessage message) throws Exception {
                message.setFrom(new InternetAddress("validar.correo.sistema@gmail.com"));
                message.setRecipient(Message.RecipientType.TO,
                        new InternetAddress("juanmanuel_s_n@hotmail.com"));
                message.setText(texto + "\n" + url);
                message.setSubject("Nuevo comentario para HQR");
            }
        };
        
        return message_preparator;        
    }
  
   private MimeMessagePreparator construirEmail(final String correo , String mensaje, String nombre) {
        
        final String texto = "La persona " + nombre + " con email " +correo;
        final String url = "dejo el siguiente comentario: " + mensaje;
        
        MimeMessagePreparator message_preparator = new MimeMessagePreparator() {
 
            @Override
            public void prepare(MimeMessage message) throws Exception {
                message.setFrom(new InternetAddress("validar.correo.sistema@gmail.com"));
                message.setRecipient(Message.RecipientType.TO,
                        new InternetAddress("celara91@gmail.com"));
                message.setText(texto + "\n" + url);
                message.setSubject("Nuevo comentario para HQR");
            }
        };
        
        return message_preparator;        
    }
  
  //nota solo sirve con windows y el excel debe estar en C:\\
  
  /*
    @RequestMapping(value = "/cliente/abreExcel", method = RequestMethod.POST)
   public ModelAndView abreExcel(ModelMap model,
            @RequestParam("archivo") File archivo, HttpServletRequest request) {
      
       try{
        String var="C:\\"+archivo.getPath();   
        System.out.print(var);

        File objeto=new File (var);
        Workbook wb;
        //wb= WorkbookFactory.create(new FileInputStream(objeto));
        FileInputStream inp=new FileInputStream(var);
        HSSFWorkbook workbook = new HSSFWorkbook(inp);
        
        HSSFSheet sheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = sheet.iterator();
        Row row;

        if(rowIterator.hasNext()){
            row=rowIterator.next();
        }
        
	while (rowIterator.hasNext()) {
                row=rowIterator.next();
                Usuario u=new Usuario();      
		Cliente cliente;            
                Empleado empleado;
                
                String pass =row.getCell(9).getStringCellValue() ;
                String rol=row.getCell(10).getStringCellValue();
                String login_u = row.getCell(11).getStringCellValue(); 
                String password=null;
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
                
                u.setLogin_usuario(login_u);
                u.setPassword_usuario(password);
                u.setRol_usuario(rol);
                usuario_bd.crearUsuario(u);
                
                Usuario usu=usuario_bd.daID(login_u);
                System.out.print(usu.getId_usuario() +"  "+ login_u);
                cliente = new Cliente (usu,
                row.getCell(0).getStringCellValue(),
                row.getCell(1).getStringCellValue(),
                row.getCell(2).getStringCellValue(),
                row.getCell(3).getStringCellValue(),
                row.getCell(4).getStringCellValue(),
                row.getCell(5).getStringCellValue(),
                row.getCell(6).getStringCellValue(),
                row.getCell(7).getStringCellValue(),
                row.getCell(8).getStringCellValue(),
                1);
                String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
                String token ="";
                mail_sender.send(construirResetTokenEmail(url,token,cliente.getCorreo(),null));
                
                cliente_bd.crearCliente(cliente);
                List clientes=cliente_bd.porCorreo(row.getCell(0).getStringCellValue());
                Cliente auxCli=(Cliente) clientes.get(0);
                
                System.out.print(row.getCell(13));
                int horas=(int)(row.getCell(13).getNumericCellValue());
                int hijos=(int)(row.getCell(16).getNumericCellValue());
                int sueldo=(int)( row.getCell(19).getNumericCellValue());
                int candidato=(int)( row.getCell(21).getNumericCellValue());
                Date fecha=row.getCell(17).getDateCellValue();

                empleado=new Empleado(auxCli.getId_cliente(),
                row.getCell(12).getStringCellValue(),
                horas,
                row.getCell(14).getStringCellValue(),
                row.getCell(15).getStringCellValue(),
                hijos,
                fecha,
                row.getCell(18).getStringCellValue(),
                String.valueOf(sueldo),
                row.getCell(20).getStringCellValue(),
                String.valueOf(candidato),
                1);
                
                empleado_bd.crearEmpleado(empleado);
                
			}			
			
       }catch (Exception e) {
	e.printStackTrace();
	}
       //workbook.close();
       model.addAttribute("clientes",cliente_bd.getClientes());
       return new ModelAndView("redirect:/home");    
   }
   */
   
    private MimeMessagePreparator construirResetTokenEmail(String contextPath, String token, final String correo ,Usuario usuario) {
        
        final String texto = "Utiliza la siguiente URL para contestar la prueba";
        final String url = contextPath + "/prueba_adaptabilidad";
        
        MimeMessagePreparator message_preparator = new MimeMessagePreparator() {
 
            @Override
            public void prepare(MimeMessage message) throws Exception {
                message.setFrom(new InternetAddress("validar.correo.sistema@gmail.com"));
                message.setRecipient(Message.RecipientType.TO,
                        new InternetAddress(correo));
                message.setText(texto + "\n" + url);
                message.setSubject("Link de la prueba");
            }
        };
        
        return message_preparator;        
    }
   
   
}
