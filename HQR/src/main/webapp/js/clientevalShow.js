/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



// Wait for the DOM to be ready
$(function() {
  // Initialize form validation on the registration form.
  // It has the name attribute "registration"
  $("form[name='cliente_show']").validate({
    // Specify validation rules
    rules: {
      // The key name on the left side is the name attribute
      // of an input field. Validation rules are defined
      // on the right side
      Nombre_Cliente: "required",
      Telefono_Local: "required",
      Telefono_Movil: "required",
      apellidop: "required",
      Area: "required",
      Puesto: "required",
      Nombre_Empresa: "required",
      correo: {
        required: true,
        // Specify that email should be validated
        // by the built-in "email" rule
        email: true
      },
      password: {
        minlength: 5
      },
      confirm_password:{
        
          equalTo: "#password"
      }
      
    },
    // Specify validation error messages
    messages: {
      apellidop: "Debes de ingresar tu primer apellido",
      Nombre_Cliente: "Debes de ingresar tu nombre",
      Telefono_Local: "Debes ingresar un telefono de casa",
      Telefono_Movil: "Debes de ingresar un telefono movil",
      Area: "Especifica el area en la que trabajas",
      Puesto: "Especifica tu puesto",
      Nombre_Empresa: "Escribe el nombre de la empresa a la que perteneces",
      correo: "por favor ingresa un email válido",
      password:{
          required: "Debe tener mínimo 5 caracteres",
          minlength: "Debe tener mínimo 5 caracteres"},
      confirm_password:{
          required: "Debe concidir con la de arriba",
          equalTo : "Debe concidir con la de arriba"}
      
    },
    // Make sure the form is submitted to the destination defined
    // in the "action" attribute of the form when valid
    submitHandler: function(form) {
      form.submit();
    }
  });
  
});