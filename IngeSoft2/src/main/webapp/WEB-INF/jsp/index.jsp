<%-- 
    Document   : ogdi
    Created on : Aug 16, 2016, 3:17:13 PM
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300'>
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="<c:url value="/css/form.css" /> ">

    <style>
      body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif;}
body, html {
    height: 100%;
    color: #777;
    line-height: 1.8;
}

/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
    opacity: 0.7;
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
    background-image: url('<c:url value="/imagenes/hqr_back.jpg" /> ');
    min-height: 100%;
}

/* Second image (Portfolio) */
.bgimg-2 {
    background-image: url("<c:url value="/imagenes/hqr1.jpg" /> ");
    min-height: 400px;
}

/* Third image (Contact) */
.bgimg-3 {
    background-image: url("<c:url value="/imagenes/hqr4.jpg" /> ");
    min-height: 400px;
}

.w3-wide {letter-spacing: 10px;}
.w3-hover-opacity {cursor: pointer;}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-width: 1024px) {
    .bgimg-1, .bgimg-2, .bgimg-3 {
        background-attachment: scroll;
    }
}
</style>
    <title>HQR</title>
    
    
    
  	
  </head>
  <body>         
      
      
      
      
      


    
         
      
      
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <ul class="w3-navbar" id="myNavbar">
      <li><a href="#"></a></li>
    <li class="w3-right">
       <a href="<c:url value="/login" /> ">
            
    <button class="btn btn-primary">Ingresar</button>
       </a>
    </li>
  </ul>
</div>



<!-- First Parallax Image with Logo Text -->
<div class="bgimg-1 w3-display-container">
  <div class="w3-display-middle" style="white-space:nowrap;">
    <span class="w3-center w3-padding-xlarge w3-blue w3-xlarge w3-wide w3-animate-opacity">HUMAN <span class="w3-hide-small">QUALITY</span> RESEARCH</span>
  </div>
</div>

<!-- Container (About Section) -->
<div class="w3-content w3-container w3-padding-64">
  <h3 class="w3-center">¿Quienes somos?</h3>
  <p class="w3-center"><em>Consultoría</em></p>
  <h3>Mision</h3>
  <p>Ayudar a nuestros clientes a la toma de decisiones basadas en un método científico.</p>
  <h3>Información</h3>
  <p>Somos una consultoría enfocada en investigación de Capital Humano y satisfacción al cliente. Vinculamos el mundo laboral con el mundo científico.</p>
  <div class="w3-row">
    <div class="w3-col m6 w3-center w3-padding-large">
      <p><b></b></p><br>
      <img src="<c:url value="/imagenes/hqr3.jpg" /> " class="w3-round w3-image w3-hover-opacity-off" alt="Photo of Me" width="500" height="333">
    </div>

    <!-- Hide this text on small devices -->
    <div class="w3-col m6 w3-hide-small w3-padding-large">
        <h3>Productos</h3>
      <p>Cuestionarios de evaluación psicométrica diseñados para las necesidades específicas de cada cliente.</p>
    </div>
  </div>
  <p class="w3-large w3-center w3-padding-16">Somos buenos en:</p>
  <p class="w3-wide">Duis aute</p>
  <div class="w3-progress-container">
    <div class="w3-progressbar w3-blue" style="width:90%"></div>
  </div>
  <p class="w3-wide">Duis aute</p>
  <div class="w3-progress-container">
    <div class="w3-progressbar w3-blue" style="width:85%"></div>
  </div>
  <p class="w3-wide">Duis aute</p>
  <div class="w3-progress-container">
    <div class="w3-progressbar w3-blue" style="width:75%"></div>
  </div>
</div>

<div class="w3-row w3-center w3-dark-grey w3-padding-16">
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">14+</span><br>
    Empleados
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">55+</span><br>
    Proyectos
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">89+</span><br>
    Clientes
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">150+</span><br>
    Juntas
  </div>
</div>

<!-- Second Parallax Image with Portfolio Text -->
<div class="bgimg-2 w3-display-container">
  <div class="w3-display-middle">
    <span class="w3-xxlarge w3-text-light-grey w3-wide"></span>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div class="w3-content w3-container w3-padding-64">
  <h3 class="w3-center">Ligas y sitios de interes</h3>
  <p class="w3-center"><em> lorem work ipsum tipsum. lorem work ipsum tipsum.<br>  lorem work ipsum tipsum. lorem work ipsum tipsum.</em></p><br>

  <!-- Responsive Grid. Four columns on tablets, laptops and desktops. Will stack on mobile devices/small screens (100% width) -->
  <div class="w3-row-padding w3-center">
      
    <div class="w3-col m3">
        
        <iframe style="width:100%" src="https://www.youtube.com/embed/hOs66Vw4kZ0" frameborder="0" allowfullscreen></iframe>
     
    </div>

    <div class="w3-col m3">
        
     <iframe style="width:100%" src="https://www.youtube.com/embed/T65Dbe3lv8k" frameborder="0" allowfullscreen></iframe>
    </div>

    <div class="w3-col m3">
       
      <iframe style="width:100%" src="https://www.youtube.com/embed/oTs_2nv9dOY" frameborder="0" allowfullscreen></iframe>
    </div>

    <div class="w3-col m3">
        
     <iframe style="width:100%" src="https://www.youtube.com/embed/ixciYsfVeIY" frameborder="0" allowfullscreen></iframe>
    </div>
  </div>

  <div class="w3-row-padding w3-center w3-section">
    <div class="w3-col m3">
        
      <iframe style="width:100%" src="https://www.youtube.com/embed/cwAwk2aN2pE" frameborder="0" allowfullscreen></iframe>
    </div>

    <div class="w3-col m3">
        
      <iframe style="width:100%" src="https://www.youtube.com/embed/jUjGjqKReoA" frameborder="0" allowfullscreen></iframe>
    </div>

    <div class="w3-col m3">
       
      <iframe style="width:100%" src="https://www.youtube.com/embed/arj7oStGLkU" frameborder="0" allowfullscreen></iframe>
    </div>

    <div class="w3-col m3">
       
      <iframe style="width:100%" src="https://www.youtube.com/embed/qjSptHuUszE" frameborder="0" allowfullscreen></iframe>
    </div>
    
  </div>
</div>

<!-- Modal for full size images on click-->
<div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
  <span class="w3-closebtn w3-text-white w3-opacity w3-hover-opacity-off w3-xxlarge w3-container w3-display-topright" title="Close Modal Image">×</span>
  <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
    <img id="img01" class="w3-image">
    <p id="caption" class="w3-opacity w3-large"></p>
  </div>
</div>

<!-- Third Parallax Image with Portfolio Text -->
<div class="bgimg-3 w3-display-container">
  <div class="w3-display-middle">
     <span class="w3-xxlarge w3-text-light-grey w3-wide"></span>
  </div>
</div>

<!-- Container (Contact Section) -->
<div class="w3-content w3-container w3-padding-64">
    <form action="/IngeSoft2/comentario" method="POST">
  <h3 class="w3-center">Contactanos</h3>
  <p class="w3-center"><em>Queremos conocerte!</em></p>

  <div class="w3-row w3-padding-32 w3-section">
    
    <div class="w3-col m8 w3-container w3-section">
      <div class="w3-large w3-margin-bottom">
        <i class="fa fa-map-marker w3-text-light-blue fa-fw w3-hover-text-blue w3-xlarge w3-margin-right"></i> CDMX, México<br>
        <i class="fa fa-phone w3-text-light-blue fa-fw w3-hover-text-blue w3-xlarge w3-margin-right"></i> Teléfono: 044 55 29 21 41 73 / 044 55 48 48 56 78
<br>
        <i class="fa fa-envelope w3-text-light-blue fa-fw w3-hover-text-blue w3-xlarge w3-margin-right"></i> Correo electrónico: admin@hqr.com<br>
      </div>
      
      <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
        <div class="w3-half">
            <input class="w3-input w3-border w3-hover-light-grey" type="text" placeholder="Nombre" name="nombre">
        </div>
        <div class="w3-half">
            <input class="w3-input w3-border w3-hover-light-grey" type="email" placeholder="Correo eléctronico" name="correo">
        </div>
      </div>
        <input class="w3-input w3-border w3-hover-light-grey" type="text" placeholder="Comentario" name="comentario">
      <button class="w3-btn w3-section w3-right w3-blue">Enviar Mensaje</button>
    </div>
  </div>
    </form>
</div>

<!-- Footer -->
<footer class="w3-center w3-blue w3-padding-16 w3-opacity w3-hover-opacity-off">
  <div class="w3-xlarge w3-padding-32">
    <a href="#" class="w3-hover-text-indigo"><i class="fa fa-facebook-official"></i></a>
    <a href="#" class="w3-hover-text-red"><i class="fa fa-pinterest-p"></i></a>
     <a href="#" class="w3-hover-text-light-blue"><i class="fa fa-twitter"></i></a>
    <a href="#" class="w3-hover-text-grey"><i class="fa fa-flickr"></i></a>
    <a href="#" class="w3-hover-text-indigo"><i class="fa fa-linkedin"></i></a>
  </div>
  
</footer>
 
<!-- Add Google Maps -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script>
<!-- Google Map Location -->

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

// Change style of navbar on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-navbar" + " w3-card-2" + " w3-animate-top" + " w3-white";
    } else {
        navbar.className = navbar.className.replace(" w3-card-2 w3-animate-top w3-white", "");
    }
}
</script>

</body>
   
    
   
   
   

<!-- About Section -->

</html>
