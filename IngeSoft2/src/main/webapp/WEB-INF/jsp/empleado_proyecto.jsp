<%-- 
    Document   : empleado_proyecto
    Created on : 30-nov-2016, 3:54:06
    Author     : Marco
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
   <link href="<c:url value="/css/bootstrap.min.css" /> " rel="stylesheet"/>
    <link href="<c:url value="/css/datepicker3.css" /> " rel="stylesheet"/>
    <link href="<c:url value="/css/styles.css" /> " rel="stylesheet"/>
    <link href="<c:url value="/css/bootstrap-table.css" /> " rel="stylesheet"/>
    
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
				<h1 class="page-header">Cuenta de cliente</h1>
			</div>
		</div><!--/.row-->
                
                
                
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg> Información</div>
					<div class="panel-body">
						<form class="form-horizontal" method="POST" action="/HQR/modificaProyecto">
							<fieldset>
								<!-- Name input-->
                                                               <h2> Proyecto: ${proyecto.nombre_proyecto}   </h2>
                                                                
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="id">Id Proyecto</label>
									<div class="col-md-9">
									<input id="id_proyecto" class="form-control" value="${proyecto.id_proyecto}" name="id_proyecto" type="text" placeholder=" id_pro" readonly>
									</div>
								</div>
                                                                
                                                                
                                                                        
                                                                
                                                                
                                                                
                                                                <div class="form-group">
									<label class="col-md-3 control-label" for="Nombre_Cliente">Nombre del responsable</label>
									<div class="col-md-9">
									 <input id="cli_id" class="form-control" value="${cliente.persona_id.nombre} - Empresa:  ${cliente.nombre_empresa}" type="text" placeholder=" cli_id" readonly>
									</div>
								</div>
                                                                
                                                                
                                                   
                                                                
								<div class="form-group">
									<label class="col-md-3 control-label" for="apellidom">Descripcion del proyecto</label>
									<div class="col-md-9">
                                                                             <input id="descripcion" class="form-control" value="${proyecto.descripcion}" name="descripcion" type="text" placeholder=" descripcion" readonly>
									</div>
								</div>
							
								<!-- Email input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="correo">Nombre del proyecto</label>
									<div class="col-md-9">
										<input id="nom_pro" class="form-control" value="${proyecto.nombre_proyecto}" name="nom_pro" type="text" placeholder=" nom_pro" readonly>
									</div>
								</div>
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="telefono_local">Fecha inicio proyecto</label>
									<div class="col-md-9">
                                                                             <input id="fecha_inicio" class="form-control" value="${proyecto.fecha_inicio}" name="fecha_inicio" type="text" placeholder="inicio DD/MM/YYYY" readonly>
									</div>
								</div>  
                                                                        
                                                                        <div class="form-group">
									<label class="col-md-3 control-label" for="telefono_Movil">Fecha fin proyecto</label>
									<div class="col-md-9">
                                                                            <input id="fecha_fin" class="form-control" value="${proyecto.fecha_fin}" name="fecha_fin" type="text" placeholder="fin DD/MM/YYYY" readonly>  
									</div>
								</div>  
                                                                        
                                                                        
                                                                       
                                                                         
                                                                        
                                                                        
                                                                     
                                                                        
								
								<!-- Message body -->
							
								
								<!-- Form actions -->
								<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Indice de pruebas</div>
					<div class="panel-body">
						<table data-toggle="table"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
						    <tr>
						        <th data-field="state" data-sortable="true">Contestar</th>
						        <th data-field="id" data-sortable="true">Nombre</th>
						        
                                                        
                                                        
						    </tr>
						    </thead>
                                                    <c:forEach var="prueba" items="${pruebas}">
      <tr>
          
          <td><a href="<c:url value="/empleado/show_prueba?id=${prueba.id_prueba}" />">Contestar</a></td>
          <td>${prueba.nombre_prueba}</td> 
         
  
          
          
          
      </tr>
        </c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
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
               <script src="<c:url value="/js/bootstrap-table.js" /> "></script>
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
