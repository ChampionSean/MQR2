<%-- 
    Document   : verpro
    Created on : 30-sep-2016, 17:33:22
    Author     : Salvador
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es-MX">
   <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<c:url value="/imagenes/LogoHQRmediana.png" /> "/>
    
    <title>HQR</title>
    
     <link href="<c:url value="/css/bootstrap.min.css" /> " rel="stylesheet"/>
    <link href="<c:url value="/css/datepicker3.css" /> " rel="stylesheet"/>
    <link href="<c:url value="/css/bootstrap-table.css" /> " rel="stylesheet"/>
    <link href="<c:url value="/css/styles.css" /> " rel="stylesheet"/>
    
    
    <script src="<c:url value="/js/lumino.glyphs.js" /> "></script>
  	
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
							<li><a href="/IngeSoft2/logout"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Salir</a></li>
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
                      <li><a href="<c:url value="/home" /> "><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> Cuentas Empresas</a></li>
			<li><a href="<c:url value="/administrador/prueba" /> "><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Pruebas</a></li>
			<li><a href="<c:url value="/administrador/proyectos" /> "><svg class="glyph stroked calendar"><use xlink:href="#stroked-calendar"></use></svg> Proyectos</a></li>
			<li><a href="<c:url value="/administrador/cuentas_deshabilitadas" /> "><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> Cuentas deshabilitadas</a></li>
			<li><a href="<c:url value="/administrador/reporte" /> "><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>Reporte</a></li>
                        <li class="active"><a href="<c:url value="/administrador/comentarios" /> "><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>Comentarios</a></li>
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
				<h1 class="page-header">Tables</h1>
			</div>
		</div><!--/.row-->
                
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Proyectos</div>
					<div class="panel-body">
						<table data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
						    <tr>
						        <th data-field="Nombre" data-sortable="true">Nombre</th>
						        <th data-field="Correo" data-sortable="true">Correo</th>
						        <th data-field="Comentario"  data-sortable="true">Comentario</th>
						        
                                                         
						    </tr>
						    </thead>
                                                    <c:forEach var="comentario" items="${comentarios}">
      <tr>
  
          <td>${comentario.nombre}</td>
          <td>${comentario.correo}</td>
          <td>${comentario.comentario}</td>
      
         
      </tr>
        </c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
                
                
                
 
                
                
                
                
		<div class="row">
			
			<div class="col-md-6">
				<div class="panel panel-default">
					
					<div class="panel-body">
						
						<script>
						    $(function () {
						        $('#hover, #striped, #condensed').click(function () {
						            var classes = 'table';
						
						            if ($('#hover').prop('checked')) {
						                classes += ' table-hover';
						            }
						            if ($('#condensed').prop('checked')) {
						                classes += ' table-condensed';
						            }
						            $('#table-style').bootstrapTable('destroy')
						                .bootstrapTable({
						                    classes: classes,
						                    striped: $('#striped').prop('checked')
						                });
						        });
						    });
						
						    function rowStyle(row, index) {
						        var classes = ['active', 'success', 'info', 'warning', 'danger'];
						
						        if (index % 2 === 0 && index / 2 < classes.length) {
						            return {
						                classes: classes[index / 2]
						            };
						        }
						        return {};
						    }
						</script>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
		
	</div><!--/.main-->
        
        
         <script src="<c:url value="/js/jquery-1.11.1.min.js" /> "></script>
          <script src="<c:url value="/js/bootstrap.min.js" /> "></script>
           <script src="<c:url value="/js/chart.min.js" /> "></script>
            <script src="<c:url value="/js/chart-data.js" /> "></script>
             <script src="<c:url value="/js/easypiechart.js" /> "></script>
              <script src="<c:url value="/js/easypiechart-data.js" /> "></script>
               <script src="<c:url value="/js/bootstrap-datepicker.js" /> "></script>
                <script src="<c:url value="/js/bootstrap-table.js" /> "></script>

	
	<script>
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
  
    <a href="<c:url value="/verifica"/> "><button>Agregar Proyecto</button></a>
   
        
 
</html>
 