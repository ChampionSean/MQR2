<%-- 
    Document   : prueba2
    Created on : 21-ene-2017, 21:34:23
    Author     : Marco
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
			<li class="active"><a href="<c:url value="/administrador/prueba" /> "><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Pruebas</a></li>
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
				<h1 class="page-header">Prueba Clima Laboral</h1>
			</div>
		</div><!--/.row-->
				
				
                
                
                
		
                
		<div class="row">
			<div class="col-lg-12">
				<h2>Instrucciones:</h2>
                                <p>A continuación, encontrará unas frases relacionadas con el trabajo. Están pensadas para distintos ambientes laborales, pero puede que no se ajusten del todo al lugar donde trabaja. Trate de acomodarlas a su propio caso.
El jefe es la persona de autoridad (capataz, encargado, supervisor, director, etc.) con quien usted se relaciona. La palabra empleado se utiliza en sentido general, aplicado a todos los que forman parte del personal del lugar de trabajo.
La escala de respuesta va de Totalmente en Desacuerdo (TD) a Totalmente de Acuerdo (TA) y puede elegir cualquiera de las seis opciones.

</p>
			</div>
			
                    <form method="post" action="/IngeSoft2/empleado/pruebaClima">
				<div class="panel panel-default">
					<div class="panel-body tabs">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">Pregunta 1-5</a></li>
							<li><a href="#tab2" data-toggle="tab">Pregunta 6-10</a></li>
							<li><a href="#tab3" data-toggle="tab">Pregunta 11-15</a></li>
                                                        <li><a href="#tab4" data-toggle="tab">Pregunta 16-20</a></li>
							
							
						</ul>
		
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1">
								<div class="form-group">
									<fieldset id="page_one">
			<legend>Pregunta 1</legend>
			    La iluminación es muy buena. *
			    <br>
			    <br>
			    <input id="1" type="radio" name="1" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="1" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="1" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="1" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="1" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="1" value="6">
				<label for="5">Totalmente de acuerdo</label>
				
				
			
		</fieldset>
		<fieldset id="page_two">
		<legend>Pregunta 2</legend>
		 Esta empresa sería una de las primeras en ensayar nuevas ideas. *
		 <br>
		 <br>
			    <input id="1" type="radio" name="2" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="2" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="2" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="2" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="2" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="2" value="6">
				<label for="5">Totalmente de acuerdo</label>
				
			
		</fieldset>
		<fieldset id="page_three">
		<legend>Pregunta 3</legend>
		La variedad no es especialmente importante aquí. *
		<br>
		<br>
			   <input id="1" type="radio" name="3" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="3" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="3" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="3" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="3" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="3" value="6">
				<label for="5">Totalmente de acuerdo</label>
				
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 4</legend>
		La gente expresa con franqueza lo que piensa *
		<br>
		<br>
			    <input id="1" type="radio" name="4" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="4" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="4" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="4" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="4" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="4" value="6">
				<label for="5">Totalmente de acuerdo</label>
				
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 5</legend>
		Aquí es importante realizar mucho trabajo. *
		 <br>
		 <br>
                 <input id="1" type="radio" name="5" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="5" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="5" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="5" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="5" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="5" value="6">
				<label for="5">Totalmente de acuerdo</label>
				
			
		</fieldset>
								</div>
							</div>
							<div class="tab-pane fade" id="tab2">
								<div class="form-group">
									
                                                                    
                                                                    <fieldset id="page_three">
		<legend>Pregunta 6</legend>
		El personal se siente libre para solicitar un aumento de sueldo. *
		<br>
		<br>
			    <input id="1" type="radio" name="6" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="6" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="6" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="6" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="6" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="6" value="6">
				<label for="5">Totalmente de acuerdo</label>
				
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 7</legend>
		Se toma enserio la frase "el trabajo antes que el juego". *
		<br>
		<br>
                <input id="1" type="radio" name="7" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="7" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="7" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="7" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="7" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="7" value="6">
				<label for="5">Totalmente de acuerdo</label>
				
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 8</legend>
		Los jefes estan siempre controlando al personal. *
		<br>
		<br>
			   <input id="1" type="radio" name="8" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="8" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="8" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="8" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="8" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="8" value="6">
				<label for="5">Totalmente de acuerdo</label>
				
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 9</legend>
		Aquí los colores y la decoración hacen agradable el lugar de trabajo. *
		<br>
		<br>
			   <input id="1" type="radio" name="9" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="9" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="9" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="9" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="9" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="9" value="6">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 10</legend>
		Se espera que los empleado cumplan muy estrictamente las reglas y costumbres. *
		<br>
		<br>
                <input id="1" type="radio" name="10" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="10" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="10" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="10" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="10" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="10" value="6">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>
                                                                    
                                                                    
								</div>
							</div>
							<div class="tab-pane fade" id="tab3">
								
                                                            
                                                            
                                                            <fieldset id="page_three">
		<legend>Pregunta 11</legend>
		 Normalmente el trabajo es muy interesante. *
		 <br>
		 <br>
			    <input id="1" type="radio" name="11" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="11" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="1" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="11" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="11" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="11" value="6">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 12</legend>
		El ambiente esta siempre bien ventilado. *
		<br>
		<br>
			    <input id="1" type="radio" name="12" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="12" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="12" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="12" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="12" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="12" value="6">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 13</legend>
		El mobiliario está bien acomodado. *
		<br>
		<br>
			    <input id="1" type="radio" name="13" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="13" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="13" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="13" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="13" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="13" value="6">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 14</legend>
		 Loa jefes son accesibles. *
		 <br>
		 <br>
			    <input id="1" type="radio" name="14" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="14" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="14" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="14" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="14" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="14" value="6">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 15</legend>
		El cambio no importa mucho aqui. *
		<br>
		<br>
                <input id="1" type="radio" name="15" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="15" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="15" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="15" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="15" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="15" value="6">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>

                                                            
                                                            
                                                            
                                                            
							</div>
                                                    <div class="tab-pane fade" id="tab4">
								
                                                        
                                                        
                                                        <fieldset id="page_three">
		<legend>Pregunta 16</legend>
		Los jefes supervisan muy estrechamente al personal *
		<br>
		<br>
			    <input id="1" type="radio" name="16" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="16" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="16" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="16" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="16" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="16" value="6">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 17</legend>
		Las condiciones de pago no son claras. *
		<br>
		<br>
			  <input id="1" type="radio" name="17" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="17" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="17" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="17" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="17" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="17" value="6">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 18</legend>
		Siempre se exige cumplir con las metas. *
		<br>
		<br>
                <input id="1" type="radio" name="18" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="18" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="18" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="18" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="18" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="18" value="6">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 19</legend>
		El ambiente me gusta. *
		<br>
		<br>
			    <input id="1" type="radio" name="19" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="19" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="19" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="19" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="19" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="19" value="6">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 20</legend>
		Aquí se trabaja intensamente. *
		<br>
		<br>
			  <input id="1" type="radio" name="20" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="20" value="2"> 
				<label for="2"></label>
				
				<br>
                 <input id="3" type="radio" name="20" value="3"> 
				<label for="3"></label>
				
				<br>
                 <input id="4" type="radio" name="20" value="4"> 
				<label for="4"></label>
				
				<br>
                 <input id="5" type="radio" name="20" value="5">
				<label for="5"></label>
                                
                                
				<br>
                 <input id="6" type="radio" name="20" value="6">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>
                                                        <button type="submit" class="btn btn-primary">Terminar</button>
                                                        
							</div>
                                                    
                                                    
						</div>
					</div>
				</div><!--/.panel-->
                </form>
			<!--/.co	
		</div><!-- /.row -->
		
                        
                        
                        
	</div><!--/.main-->
        
        
        
        <script src="<c:url value="/js/jquery-1.11.1.min.js" /> "></script>
          <script src="<c:url value="/js/bootstrap.min.js" /> "></script>
           <script src="<c:url value="/js/chart.min.js" /> "></script>
            <script src="<c:url value="/js/chart-data.js" /> "></script>
             <script src="<c:url value="/js/easypiechart.js" /> "></script>
              <script src="<c:url value="/js/easypiechart-data.js" /> "></script>
               <script src="<c:url value="/js/bootstrap-datepicker.js" /> "></script>
                
       
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
</html>
