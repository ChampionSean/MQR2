<%-- 
    Document   : consulta3
    Created on : 19-sep-2016, 23:13:28
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
				<h1 class="page-header">Prueba Adaptabilidad Laboral</h1>
			</div>
		</div><!--/.row-->
				
				
                
                <div id="arriba"></div>
                
		
                
		<div class="row">
			<div class="col-lg-12">
				<h2>Instrucciones:</h2>
                                <p>A continuación encontrarás una serie de enunciados a los cuales debes responder considerando la forma que has pensado, sentido y actuado ante determinadas situaciones en el ambiente laboral. 
Te pedimos contestar de la manera más honesta y sincera posible ya que no existen respuestas buenas o malas.  
</p>
			</div>
			
                    <form method="post" action="/HQR/empleado/pruebaR">
				<div class="panel panel-default">
					<div class="panel-body tabs">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">Pregunta 1-5</a></li>
							<li><a href="#tab2" data-toggle="tab">Pregunta 6-10</a></li>
							<li><a href="#tab3" data-toggle="tab">Pregunta 11-15</a></li>
                                                        <li><a href="#tab4" data-toggle="tab">Pregunta 16-20</a></li>
							<li><a href="#tab5" data-toggle="tab">Pregunta 21-25</a></li>
                                                        <li><a href="#tab6" data-toggle="tab">Pregunta 26-30</a></li>
							
						</ul>
		
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1">
								<div class="form-group">
									<fieldset id="page_one">
			<legend>Pregunta 1</legend>
			    No pierdo la concentración cuando se presentan eventos inesperados en mi trabajo. *
			    <br>
			    <br>
			    <input id="1" type="radio" name="1" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="1" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="1" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="1" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="1" value="5">
				<label for="5">Totalmente de acuerdo</label>
				
				
			
		</fieldset>
		<fieldset id="page_two">
		<legend>Pregunta 2</legend>
		 Aunque las situaciones no sean estables, soy totalmente competente. *
		 <br>
		 <br>
			    <input id="1" type="radio" name="2" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="2" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="2" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="2" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="2" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>
		<fieldset id="page_three">
		<legend>Pregunta 3</legend>
		Es difícil para mí encarar eventos inesperados. *
		<br>
		<br>
			    <input id="1" type="radio" name="3" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="3" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="3" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="3" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="3" value="1">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 4</legend>
		Me cuesta trabajo ser una persona madura. *
		<br>
		<br>
			    <input id="1" type="radio" name="4" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="4" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="4" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="4" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="4" value="1">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 5</legend>
		 Mi desempeño es igual de bueno en diferentes entornos. *
		 <br>
		 <br>
			    <input id="1" type="radio" name="5" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="5" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="5" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="5" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="5" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>
                                                                    <a href="#arriba">Ir Arriba</a>
								</div>
							</div>
							<div class="tab-pane fade" id="tab2">
								<div class="form-group">
									
                                                                    
                                                                    <fieldset id="page_three">
		<legend>Pregunta 6</legend>
		Tengo agilidad mental. *
		<br>
		<br>
			    <input id="1" type="radio" name="6" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="6" value="6"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="6" value="6"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="6" value="6"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="6" value="6">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 7</legend>
		Soy una persona madura que sabe cómo actuar en eventos impredecibles. *
		<br>
		<br>
			    <input id="1" type="radio" name="7" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="7" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="7" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="7" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="7" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 8</legend>
		Me considero hábil para resolver eventos inesperados. *
		<br>
		<br>
			    <input id="1" type="radio" name="8" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="8" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="8" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="8" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="8" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 9</legend>
		Aunque las situaciones en mi trabajo sean inciertas, soy capaz de encararlas. *
		<br>
		<br>
			    <input id="1" type="radio" name="9" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="9" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="9" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="9" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="9" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 10</legend>
		Aunque no conozca a fondo la situación en la que me encuentre salgo adelante. *
		<br>
		<br>
			    <input id="1" type="radio" name="10" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="10" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="10" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="10" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="10" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>
                                                                    <a href="#arriba">Ir Arriba</a>
                                                                    
                                                                    
								</div>
							</div>
							<div class="tab-pane fade" id="tab3">
								
                                                            
                                                            
                                                            <fieldset id="page_three">
		<legend>Pregunta 11</legend>
		 Me siento entusiasmado cuando me enfrento a un reto difícil de resolver. *
		 <br>
		 <br>
			    <input id="1" type="radio" name="11" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="11" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="11" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="11" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="11" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 12</legend>
		Resuelvo los conflictos de forma eficaz. *
		<br>
		<br>
			    <input id="1" type="radio" name="12" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="12" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="12" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="12" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="12" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 13</legend>
		No soy innovador. *
		<br>
		<br>
			    <input id="1" type="radio" name="13" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="13" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="13" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="13" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="13" value="1">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 14</legend>
		 Muchos me consideran una persona cuadrada. *
		 <br>
		 <br>
			    <input id="1" type="radio" name="14" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="14" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="14" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="14" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="14" value="1">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 15</legend>
		Soy astuto para salir de los apuros. *
		<br>
		<br>
			    <input id="1" type="radio" name="15" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="15" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="15" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="15" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="15" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

                                                            
                                                            
                                                            <a href="#arriba">Ir Arriba</a>
                                                            
							</div>
                                                    <div class="tab-pane fade" id="tab4">
								
                                                        
                                                        
                                                        <fieldset id="page_three">
		<legend>Pregunta 16</legend>
		¿Cuál es la respuesta correcta de la siguiente operación 38+21-66? *
		<br>
		<br>
			    <input id="1" type="radio" name="16" value="1"> 
				<label for="1">-5</label>
				
				<br>
                 <input id="2" type="radio" name="16" value="2"> 
				<label for="2">-6</label>
				
				<br>
                 <input id="3" type="radio" name="16" value="3"> 
				<label for="3">7</label>
				
				<br>
                 <input id="4" type="radio" name="16" value="4"> 
				<label for="4">6</label>
				
				<br>
                 <input id="5" type="radio" name="16" value="5">
				<label for="5">-7</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 17</legend>
		Soluciono conflictos hábilmente. *
		<br>
		<br>
			    <input id="1" type="radio" name="17" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="17" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="17" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="17" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="17" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 18</legend>
		Me causa desconfianza escuchar a personas que no siguen los pasos específicos necesarios para alcanzar una meta. *
		<br>
		<br>
			    <input id="1" type="radio" name="18" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="18" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="18" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="18" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="18" value="1">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 19</legend>
		Soy creativo, a menudo se me ocurren diferentes formas de hacer las cosas. *
		<br>
		<br>
			    <input id="1" type="radio" name="19" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="19" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="19" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="19" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="19" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 20</legend>
		Encuentro rápidamente respuestas a los problemas. *
		<br>
		<br>
			    <input id="1" type="radio" name="20" value="1"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="20" value="2"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="20" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="20" value="4"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="20" value="5">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>
                                                        <a href="#arriba">Ir Arriba</a>
                                                        
							</div>
                                                    <div class="tab-pane fade" id="tab5">
								
                                                        
                                                        
                                                        
                                                        <fieldset id="page_three">
		<legend>Pregunta 21</legend>
		Se me dificulta establecer nuevas relaciones personales en la empresa. *
		<br>
		<br>
			    <input id="1" type="radio" name="21" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="21" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="21" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="21" value="3"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="21" value="1">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 22</legend>
		No soy comunicativo. *
		<br>
		<br>
			    <input id="1" type="radio" name="22" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="22" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="22" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="22" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="22" value="1">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
		<legend>Pregunta 23</legend>
		Algunas personas dicen que soy irritante. *
		<br>
		<br>
			    <input id="1" type="radio" name="23" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="23" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="23" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="23" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="23" value="1">
				<label for="5">Totalmente de acuerdo</label>
			
		</fieldset>

		<fieldset id="page_three">
			<legend>Pregunta 24</legend>
			 La relación con mis compañeros de trabajo es limitada. *
			 <br>
			 <br>
			    <input id="1" type="radio" name="24" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="24" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="24" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="24" value="3"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="24" value="1">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>

		<fieldset id="page_three">
			<legend>Pregunta 25</legend>
			 Prefiero estar solo que mal acompañado. *
			 <br>
			 <br>
			    <input id="1" type="radio" name="25" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="25" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="25" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="25" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="25" value="1">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        <a href="#arriba">Ir Arriba</a>
							</div>
                                                    <div class="tab-pane fade" id="tab6">
                                                        
                                                        
                                                        <fieldset id="page_three">
			<legend>Pregunta 26</legend>
			A veces soy inmaduro en mi trabajo. *
			<br>
			<br>
			    <input id="1" type="radio" name="26" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="26" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="26" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="26" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="26" value="1">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>

		<fieldset id="page_three">
			<legend>Pregunta 27</legend>
			Me enojo muy rápido si alguien me contradice. *
			<br>
			<br>
			    <input id="1" type="radio" name="27" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="27" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="27" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="27" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="27" value="1">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>

		<fieldset id="page_three">
			<legend>Pregunta 28</legend>
			Soy agresivo con aquellos que me provocan. *
			<br>
			<br>
			    <input id="1" type="radio" name="28" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="28" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="28" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="28" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="28" value="1">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>

		<fieldset id="page_three">
			<legend>Pregunta 29</legend>
			Soy tímido, me cuesta trabajo hablar con desconocidos. *
			<br>
			<br>
			    <input id="1" type="radio" name="29" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="29" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="29" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="29" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="29" value="1">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>

		<fieldset id="page_three">
			<legend>Pregunta 30</legend>
			Puedo ser irrespetuoso. *
			<br>
			<br>
			    <input id="1" type="radio" name="30" value="5"> 
				<label for="1">Totalmente en desacuerdo</label>
				
				<br>
                 <input id="2" type="radio" name="30" value="4"> 
				<label for="2">En desacuerdo</label>
				
				<br>
                 <input id="3" type="radio" name="30" value="3"> 
				<label for="3">Ni de acuerdo ni en desacuerdo</label>
				
				<br>
                 <input id="4" type="radio" name="30" value="2"> 
				<label for="4">De acuerdo</label>
				
				<br>
                 <input id="5" type="radio" name="30" value="1">
				<label for="5">Totalmente de acuerdo</label>
		</fieldset>
								
								<button type="submit" class="btn btn-primary">Terminar</button>
                                                                <c:forEach var="respuesta" items="${respuestas}">
                                                                       ${respuesta}
                                                                       </c:forEach>
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
