
package controlador;

import MapeoBD.Password_token;
import MapeoBD.Usuario;
import modelo.RestablecerPasswordDAOImpl;
import modelo.UsuarioDAO;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import modelo.ClienteDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author aaron
 */
@Controller
public class controlador_RestablecerPassword {
    
    @Autowired
    RestablecerPasswordDAOImpl restablecerPassword_bd;
    
    @Autowired
    UsuarioDAO usuario_bd;
    
    @Autowired
    JavaMailSender mail_sender;
    
    @Autowired
    private ClienteDAO cliente_bd;
    
    @RequestMapping(value="/restablecerPassword", method = RequestMethod.POST)
    @ResponseBody
    public String restablecerPassword(HttpServletRequest request, @RequestParam String correo){
    
        Usuario usuario = cliente_bd.porCorreo(correo).getUsuario_id();
        
        if(usuario == null){
            return "error";
        }
        String token = UUID.randomUUID().toString();
        restablecerPassword_bd.registrarRestablecerPassword(usuario, token);
        String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        mail_sender.send(construirResetTokenEmail(url,token,correo,usuario));
        
        return "exito";
        
    }
    
    private MimeMessagePreparator construirResetTokenEmail(String contextPath, String token, final String correo ,Usuario usuario) {
        
        final String texto = "Utiliza la siguiente URL para cambiar tu password";
        final String url = contextPath + "/cambioPassword?id=" + usuario.getId_usuario() + "&token=" + token;
        
        MimeMessagePreparator message_preparator = new MimeMessagePreparator() {
 
            @Override
            public void prepare(MimeMessage message) throws Exception {
                message.setFrom(new InternetAddress("validar.correo.sistema@gmail.com"));
                message.setRecipient(Message.RecipientType.TO,
                        new InternetAddress(correo));
                message.setText(texto + "\n" + url);
                message.setSubject("Reset Password");
            }
        };
        
        return message_preparator;        
    }

    @RequestMapping(value = "/cambioPassword", method = RequestMethod.GET)
    public String cambioPassword(ModelMap model, @RequestParam("id") long id_usuario, @RequestParam("token") String token) {

        Password_token passwordtoken = restablecerPassword_bd.revisarRestablecerPassword(id_usuario, token);
        
        // Revisar si el token y el usuario estan en la tabla de tokens
        if(passwordtoken == null){
            return "redirect:/error403";    
        }

        // Revisar si no ha pasado del limite de tiempo establecido
        // Para checar limite ir a RestablecerPasswordDAOImpl.java
        Calendar cal = Calendar.getInstance();
        if((passwordtoken.getDate_password_token().getTime() - cal.getTime().getTime()) <= 0){
            return "redirect:/errorToken?mensaje_error=El periodo para renovar tu password ha vencido, solicita un nuevo correo";  
        }
    
        List<GrantedAuthority> grantedAuths = new ArrayList();
        grantedAuths.add(new SimpleGrantedAuthority("ROLE_PASSWORD")); 
        Authentication auth = new UsernamePasswordAuthenticationToken(id_usuario,null, grantedAuths); 
        SecurityContextHolder.getContext().setAuthentication(auth);
        
        return "cambioPassword";
        
    }

    @RequestMapping(value = "/cambiarPassword")
    public String cambiarPassword(@RequestParam String password , @RequestParam String confirmacion_password, Principal principal){
        Md5PasswordEncoder passwordEncoder = new Md5PasswordEncoder();
       String  hash_password = passwordEncoder.encodePassword(password, this);        
        //BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
       //String hash_password = passwordEncoder.encode(password) ;
        usuario_bd.cambiarPassword(Long.parseLong(principal.getName()), hash_password);
        SecurityContextHolder.getContext().setAuthentication(null);
        return "index";
    }
    
     @RequestMapping(value="/restablecimientoPassword")
    public String restablecimientoPassword(){
        return "restablecimientoPassword";
    }
    
    @RequestMapping(value="/error403")
    public String error403(){
        return "error403";
    }
    
    @RequestMapping(value="/errorToken")
    public ModelAndView errorToken(ModelMap model,@RequestParam String mensaje_error){
        System.out.println(mensaje_error);
        model.addAttribute("mensaje_error", mensaje_error);
        return new ModelAndView("errorToken",model);
    }
    
    @RequestMapping(value="/enviarPruebas")
    public ModelAndView enviarPruebas(){
        return new ModelAndView("enviar_prueba");
    }    
    
    
}
    
    