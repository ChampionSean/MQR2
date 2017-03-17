<%-- 
    Document   : crear
    Created on : 26-sep-2016, 21:01:49
    Author     : Marco
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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Admin <span class="caret"></span></a>
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
			<li class="active"><a href="<c:url value="/home" /> "><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> Cuentas Empresas</a></li>
			<li><a href="<c:url value="/administrador/prueba" /> "><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Pruebas</a></li>
			<li><a href="<c:url value="/administrador/proyectos" /> "><svg class="glyph stroked calendar"><use xlink:href="#stroked-calendar"></use></svg> Proyectos</a></li>
			<li><a href="<c:url value="/administrador/cuentas_deshabilitadas" /> "><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> Cuentas deshabilitadas</a></li>
			<li><a href="<c:url value="/administrador/reporte" /> "><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>Reporte</a></li>
			
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
			<li><a href="login.html"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Login Page</a></li>
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
						<form class="form-horizontal" name="clientval" method="POST" action="<c:url value = '/administrador/crearCliente' />">
							<fieldset>
								<!-- Name input-->
                                                                <p>Aqui podras crear una cuenta grupal</p>
                                                                
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="id">Nombre empresa*</label>
									<div class="col-md-9">
									<input id="Nombre_Empresa" name="Nombre_Empresa" type="text" placeholder="Empresa" class="form-control" value="${cliente.id_cliente}">
									</div>
								</div>
                                                                
                                                                
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="Nombre_Cliente">Nombre del titular*</label>
									<div class="col-md-9">
									<input id="Nombre_Cliente" name="Nombre_Cliente" placeholder=" Nombre_Cliente" type="text" class="form-control" value="${cliente.nombre_cliente}">
									</div>
								</div>
                                                                
                                                                
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="apellidop">Apellido paterno*</label>
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
									<label class="col-md-3 control-label" for="Puesto">Puesto*</label>
									<div class="col-md-9">
                                                                            <input id="Puesto" name="Puesto" type="text" placeholder="Puesto" class="form-control" value="${cliente.puesto}">
									</div>
								</div>  
                                                                
								<div class="form-group">
									<label class="col-md-3 control-label" for="correo">Correo electrónico*</label>
									<div class="col-md-9">
										<input id="correo" name="correo" type="text" placeholder="ejemplo@.com" class="form-control" value="${cliente.correo}">
									</div>
								</div>
                                                                        
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="Nombre_Empresa">Contraseña*</label>
									<div class="col-md-9">
                                                                            <input id="password" name="password" type="password" placeholder="password" class="form-control" value="${cliente.nombre_empresa}">
									</div>
								</div>  
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="Nombre_Empresa">Contraseña confirmación*</label>
									<div class="col-md-9">
                                                                            <input id="confirm_password" name="confirm_password" type="password" placeholder="password" class="form-control" value="${cliente.nombre_empresa}">
									</div>
								</div>  
                                                                        
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="telefono_local">Teléfono local*</label>
									<div class="col-md-9">
                                                                            <input id="telefono_local" name="Telefono_Local" placeholder="telefono local" class="form-control" value="${cliente.telefono_local}">
									</div>
								</div>  
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="telefono_Movil">Teléfono movil*</label>
									<div class="col-md-9">
                                                                            <input id="telefono_Movil" name="Telefono_Movil" type="text" placeholder="telefono movil" class="form-control" value="${cliente.telefono_movil}">
									</div>
								</div>  
                                                                        
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="area">Area*</label>
									<div class="col-md-9">
                                                                            <input id="Area" name="Area" type="text" placeholder="Area" class="form-control" value="${cliente.area}">
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
        <script src="<c:url value="/js/client_form.js" />" ></script>
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
