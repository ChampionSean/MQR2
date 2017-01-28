
function verificar_correo() {

    $.post("restablecerPassword",
            $("#busqueda_correo").serialize(),
            function (data) {

                if (data.toString() === "exito") {
                    $("span").html("Te hemos enviado un correo para restablecer contraseña");
                    $("span").css('color', 'green');
                } else {
                    $("span").html("No existe este correo");
                    $("span").css('color', 'red');
                }

            }
    );

}