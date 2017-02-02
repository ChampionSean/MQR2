<%-- 
    Document   : verEmpleado
    Created on : 24-oct-2016, 1:23:09
    Author     : Salvador
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="<c:url value="/js/jquery-1.12.4.min.js" />" ></script>
        <script src="<c:url value="/js/jquery.validate.js" />" ></script>
        <script src="<c:url value="/js/form-validation.js" />" ></script>
        
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<c:url value="/imagenes/LogoHQRmediana.png" /> "/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

    <style>
</style>
    <title>HQR</title>
  	<nav class="navbar navbar-default w3-cyan" role="navigation">
        <!-- El logotipo y el icono que despliega el menú se agrupan
             para mostrarlos mejor en los dispositivos móviles -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-ex1-collapse">
                <span class="sr-only">Desplegar navegación</span>
                <span class="icon-bar">f</span>
                <span class="icon-bar">g</span>
                <span class="icon-bar">h</span>
            </button>
        </div>

        <!-- Agrupar los enlaces de navegación, los formularios y cualquier
             otro elemento que se pueda ocultar al minimizar la barra -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li><a href="<c:url value="/home"/> ">Cuentas</a></li>
                <li><a href="<c:url value="/administrador/prueba"/>">Pruebas</a></li>
                <li><a href="<c:url value="/administrador/proyectos"/>">Proyectos</a></li>
                <li><a href="#">Reportes</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Usuario: ${username}</a></li>
                <li><a href="/HQR/salir">Salir</a></li>
                
            </ul>
        </div>
    </nav>
    </head>
    <body>
    <center><h2>Datos Empleado:</h2>
      <br>
      <table>
          <tr>
              <th><h3>Direccion</h3></th>
              <th><h3>horas x semana</h3></th>
              <th><h3>carrera</h3></th>
              <th><h3>estado civil</h3></th>
              <th><h3>numero hijos</h3></th>
              <th><h3>fecha nacimiento</h3></th>
              <th><h3>antiguedad</h3></th>
              <th><h3>sueldo mensual</h3></th>
              <th><h3>sexo</h3></th>
              <th><h3>candidato</h3></th>
          </tr>
 
      <tr <c:if test="${empleado.habilitado == 0}"> bgcolor="#FD6C84" </c:if>>
          
          
          <td>${empleado.direccion}</td> 
          <td>${empleado.horas_x_semana}</td> 
          <td>${empleado.carrera}</td> 
          <td>${empleado.estado_civil}</td> 
          <td>${empleado.numero_hijos}</td> 
          <td>${empleado.fecha_nacimiento}</td> 
          <td>${empleado.antiguedad}</td> 
          <td>${empleado.sueldo_mensual}</td> 
          <td>${empleado.sexo}</td> 
          <td>${empleado.candidato}</td> 
          
          
      </tr>
        
      </table>
  </center>
    </body>
    <hr>
      <footer class="text-muted">
      <div class="col-sm-6">
          <center><p>&copy; <img src="<c:url value="/imagenes/miztli.png" /> " width="70" ></p></center>
        </div>      
    </footer>
</html>
