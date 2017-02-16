
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Cambiar Password</title>
        <meta charset="utf-8">
    </head>
    <body>    
                   
        <form  method="POST" action="/HQR/cambiarPassword">
            <h2>Cambiar Password</h2>           
            <div class="campo_formulario">                
                <label class="col1-2" for="password">Nuevo password :</label>
                <input class="col2-2" name="password" type="text" placeholder="Ingresa password">
            </div>
              <div class="campo_formulario">                
                <label class="col1-2" for="">Confirmar password</label>
                <input class="col2-2" name="confirmacion_password" type="text" placeholder="Confirma password">
            </div>
            <button>Cambiar Password</button>
        </form>
    </body>
</html>
