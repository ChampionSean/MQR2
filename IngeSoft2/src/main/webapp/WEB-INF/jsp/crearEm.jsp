<%-- 
    Document   : crearEmpleado
    Created on : 24-oct-2016, 0:10:41
    Author     : Salvador
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<c:url value="/imagenes/LogoHQRmediana.png" /> "/>
   

     <link href="<c:url value="/css/bootstrap.min.css" /> " rel="stylesheet"/>
    <link href="<c:url value="/css/datepicker3.css" /> " rel="stylesheet"/>
    <link href="<c:url value="/css/styles.css" /> " rel="stylesheet"/>
    <script src="<c:url value="/js/lumino.glyphs.js" /> "></script>
   
    <title>HQR</title>
  	
    </head>
    
    
   <body>
    
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>HQR</span></a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> ${username} <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/HQR/logout"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Salir</a></li>
						</ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<img src="<c:url value="/imagenes/LogoHQRmediana.png" /> " style="width:100%; height:100%;">
			</div>
		</form>
		<ul class="nav menu">
			<li class="active"><a href="<c:url value="/cliente/home" /> "><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> Inicio</a></li>
			<li class="parent ">
				
				<ul class="children collapse" id="sub-item-1">
					<li>
						<a class="" href="#">
							<svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Sub Item 1
						</a>
					</li>
					<li>
						<a class="" href="#">
							<svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Sub Item 2
						</a>
					</li>
					<li>
						<a class="" href="#">
							<svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Sub Item 3
						</a>
					</li>
				</ul>
			</li>
			<li role="presentation" class="divider"></li>
			
		</ul>
		
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">		
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Icons</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Crear cuenta de cliente</h1>
			</div>
		</div><!--/.row-->
                
           
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg> Información</div>
					<div class="panel-body">
						<form class="form-horizontal" name="crear_empleado" method="POST" action="/HQR/cliente/crearEmpleado">
							<fieldset>
								<!-- Name input-->
                                                                <p>Aqui podras crear un empleado asociado al proyecto </p>
                                                                
                                                                <input type="hidden" name="proyecto" value="${id}">
                                                                 <div class="form-group">
									<label class="col-md-3 control-label" for="Nombre_Cliente">Nombre</label>
									<div class="col-md-9">
									<input id="Nombre_Cliente" name="Nombre_Cliente" placeholder=" Nombre" type="text" class="form-control" value="${cliente.nombre_cliente}">
									</div>
								</div>
                                                                
                                                                
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="apellidop">Apellido paterno</label>
									<div class="col-md-9">
                                                                            <input id="apellidop" name="apellidop" type="text" placeholder="Apellido paterno" class="form-control" value="${cliente.apellido_paterno_cliente}">
									</div>
								</div>
                                                                
                                                                
								<div class="form-group">
									<label class="col-md-3 control-label" for="apellidom">Apellido materno</label>
									<div class="col-md-9">
                                                                            <input id="apellidom" name="apellidom" type="text" placeholder="Apellido materno" class="form-control" value="${cliente.apellido_materno_cliente}">
									</div>
								</div>
							
								<!-- Email input-->
                                                                
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="Puesto">Puesto</label>
									<div class="col-md-9">
                                                                            <input id="Puesto" name="Puesto" type="text" placeholder="Puesto" class="form-control" value="${cliente.puesto}">
									</div>
								</div>  
                                                                
								<div class="form-group">
									<label class="col-md-3 control-label" for="correo">Correo electrónico</label>
									<div class="col-md-9">
										<input id="correo" name="correo" type="text" placeholder="ejemplo@.com" class="form-control" value="${cliente.correo}">
									</div>
								</div>
                                                                        
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="Nombre_Empresa">Contraseña</label>
									<div class="col-md-9">
                                                                            <input id="password" name="password" type="password" placeholder="password" class="form-control" value="${cliente.nombre_empresa}">
									</div>
								</div>  
                                                                        
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="Nombre_Empresa">Contraseña</label>
									<div class="col-md-9">
                                                                            <input id="password" name="confirm_password" type="password" placeholder="password" class="form-control" value="${cliente.nombre_empresa}">
									</div>
								</div>  
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="telefono_local">Teléfono local</label>
									<div class="col-md-9">
                                                                            <input id="telefono_local" name="Telefono_Local" placeholder="telefono local" class="form-control" value="${cliente.telefono_local}">
									</div>
								</div>  
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="telefono_Movil">Teléfono movil</label>
									<div class="col-md-9">
                                                                            <input id="telefono_Movil" name="Telefono_Movil" type="text" placeholder="telefono movil" class="form-control" value="${cliente.telefono_movil}">
									</div>
								</div>  
                                                                        
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="area">Area</label>
									<div class="col-md-9">
                                                                            <input id="Area" name="area" type="text" placeholder="Area" class="form-control" value="${cliente.area}">
									</div>
								</div>  
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="id">Nombre empresa</label>
									<div class="col-md-9">
									<input class="form-control" id="Nombre_Empresa" name="Nombre_Empresa" type="text" placeholder=" Nombre de la Empresa">
									</div>
								</div>
                                                                        
								<div class="form-group">
									<label class="col-md-3 control-label" for="apellidom">Ultimo grado de estudios</label>
									<div class="col-md-9">
                                                                            
                                                                            <select class="form-control" id="carrera" name="carrera">
                                                                                <option> Menciona tu último grado de estudios completo:</option>
										<option value="Primaria">Primaria</option>
										<option value="Secundaria">Secundaria</option>
										<option value="Preparatoria/Bachillerato">Preparatoria/Bachillerato</option>
										<option value="Licenciatura Trunca">Licenciatura Trunca</option>
                                                                                <option value="Licenciatura">Licenciatura</option>
                                                                                <option value="Maestria">Maestria</option>
                                                                                <option value="Doctorado">Doctorado</option>
                                                                                <option value="Post-Doctorado">Post-Doctorado</option>
									</select>
									</div>
								</div>
							
								<!-- Email input-->
                                                                
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="correo">Estado Civil</label>
									<div class="col-md-9">
										 <input class="form-control" id="estado_civil" name="estado_civil" type="text" placeholder="estado_civil">
									</div>
								</div>
                                                                
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="Puesto">Número de hijos</label>
									<div class="col-md-9">
                                                                            <input class="form-control" id="numero_hijos" name="numero_hijos" type="number" min="0" max="18" placeholder="numero_hijos"> 
									</div>
								</div>  
                                                                
								<div class="form-group">
									<label class="col-md-3 control-label" for="correo">Fecha de naciemiento</label>
									<div class="col-md-9">
										 <input class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" type="date" placeholder="fecha_nacimiento">
									</div>
								</div>
                                                                        
                                                                        
                                                                       
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="telefono_local">Sueldo mensual</label>
									<div class="col-md-9">
                                                                   <select class="form-control" id="sueldo_mensual" name="sueldo_mensual">
                                                                                <option> Menciona tu último/actual sueldo mensual:</option>
										<option value="$ 0 MXN - $ 5,000 MXN">$ 0 MXN - $ 5,000 MXN</option>
										<option value="$ 6,000 MXN - $ 10,000 MXN">$ 6,000 MXN - $ 10,000 MXN</option>
										<option value="$ 11,000 MXN - $ 15,000 MXN">$ 11,000 MXN - $ 15,000 MXN</option>
										<option value="$ 16,000 MXN - $ 20,000 MXN">$ 16,000 MXN - $ 20,000 MXN</option>
                                                                                <option value="$ 21,000 MXN - $ 25,000 MXN">$ 21,000 MXN - $ 25,000 MXN</option>
                                                                                <option value="$ 26,000 MXN - $ 30,000 MXN">$ 26,000 MXN - $ 30,000 MXN</option>
                                                                                <option value="$ 31,000 MXN - $ 35,000 MXN">$ 31,000 MXN - $ 35,000 MXN</option>
                                                                                <option value="$ 36,000 MXN - $ 40,000 MXN">$ 36,000 MXN - $ 40,000 MXN</option>
                                                                                
                                                                                <option value="$ 41,000 MXN - $ 45,000 MXN">$ 41,000 MXN - $ 45,000 MXN</option>
										<option value="$ 46,000 MXN - $ 50,000 MXN">$ 46,000 MXN - $ 50,000 MXN</option>
										<option value="$ 51,000 MXN - $ 55,000 MXN">$ 51,000 MXN - $ 55,000 MXN</option>
										<option value="$ 56,000 MXN - $ 60,000 MXN">$ 56,000 MXN - $ 60,000 MXN</option>
                                                                                <option value="$ 61,000 MXN - $ 65,000 MXN">$ 61,000 MXN - $ 65,000 MXN</option>
                                                                                <option value="$ 66,000 MXN - $ 70,000 MXN">$ 66,000 MXN - $ 70,000 MXN</option>
                                                                                <option value="$ 71,000 MXN - $ 75,000 MXN">$ 71,000 MXN - $ 75,000 MXN</option>
                                                                                <option value="$ 76,000 MXN - $ 80,000 MXN">$ 76,000 MXN - $ 80,000 MXN</option>
                                                                                
                                                                                
                                                                                <option value="$ 81,000 MXN - $ 85,000 MXN">$ 81,000 MXN - $ 85,000 MXN</option>
                                                                                <option value="$ 86,000 MXN - $ 90,000 MXN">$ 86,000 MXN - $ 90,000 MXN</option>
                                                                                <option value="$ 91,000 MXN - $ 95,000 MXN">$ 91,000 MXN - $ 95,000 MXN</option>
                                                                                <option value="$ 96,000 MXN - $ 100,000 MXN">$ 96,000 MXN - $ 100,000 MXN</option>
                                                                                <option value="Más de  - $ 100,000 MXN">Más de  - $ 100,000 MXN</option>
                                                                                
									</select>
                                                                            
                                                                            
									</div>
								</div>  
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="telefono_Movil">Sexo</label>
									<div class="col-md-9">
                                                                           
                                                                           
                                                                           <input id="1" type="radio" name="sexo" value="h"> 
				                                           <label for="1">Hombre</label>
				
				                                               <br>
                                                                            <input id="2" type="radio" name="sexo" value="m"> 
				                                            <label for="2">Mujer</label>
									</div>
								</div>  
                                                                        
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="can2">Candidato</label>
									<div class="col-md-9">
                                                                            
                                                                            <input id="can2" type="radio" name="candidato" value="1" >
                                                                           
                                                                            
									</div>
								</div>  
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="em2">Empleado</label>
									<div class="col-md-9">
                                                                            
                                                                           
                                                                            <input id="em2" type="radio" name="candidato" value="0" >
                                                                            
									</div>
								</div>  
                   			<!-- Message body -->
							
								
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-primary btn-md pull-right">Registrar</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				
				
				
			</div><!--/.col-->
                </div>
			

	 <script src="<c:url value="/js/jquery-1.11.1.min.js" /> "></script>
          <script src="<c:url value="/js/bootstrap.min.js" /> "></script>
           <script src="<c:url value="/js/chart.min.js" /> "></script>
            <script src="<c:url value="/js/chart-data.js" /> "></script>
             <script src="<c:url value="/js/easypiechart.js" /> "></script>
              <script src="<c:url value="/js/easypiechart-data.js" /> "></script>
               <script src="<c:url value="/js/bootstrap-datepicker.js" /> "></script>
                <script src="<c:url value="/js/jquery.validate.js" />" ></script>
                <script src="<c:url value="/js/nueva.js" /> "></script>
                 
       
	<script>
		$('#calendar').datepicker({
		});

		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>    
   
        
    
</html>
