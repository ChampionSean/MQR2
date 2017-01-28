
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Restablecer Password</title>
        <meta charset="utf-8">
        <script src=" <c:url value="/js/jquery-1.12.4.min.js" /> "></script>
        <script src=" <c:url value="/js/restablecimientoPassword.js" /> "></script>
    </head>
    <body>
            
         <form id="busqueda_correo" method="POST">

            <h2>Restablecer Password</h2>
            
            <div class="campo_formulario">                
                <label class="col1-2" for="correo">Correo :</label>
                <input class="col2-2" name="correo" type="text" placeholder="ejemplo@email.com">
            </div>
            
            <span id="mensaje"></span>
          
            <button type="button" onclick="verificar_correo();" >Restablecer Contraseña</button>
            
        </form>
         
        

    </body>
</html>
