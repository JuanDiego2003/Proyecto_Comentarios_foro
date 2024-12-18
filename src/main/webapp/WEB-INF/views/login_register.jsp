<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio foro</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #b8d1cb;
        }

        #global {
            border: 2px solid #151c8d;
            height: auto;
        }

        /*Ocupar toda la pantalla*/
        .height {
            height: 100vh;
        }

        /*Espacios principales*/
        #login,
        #register {
            padding-top: 50px;
            padding-bottom: 50px;
            transition: all 1s ease;
            /* Transición suave para todos los cambios de propiedades */
        }

        #login {
            width: 90%;
            transition: width 1s ease;
        }

        #register {
            background-color: #151c8d;
            color: #b8d1cb;
            width: 10%;
            display: flex;
            transition: width 1s ease;
        }

        /*Acciones animaciones*/
        #register.active {
            width: 90% !important;
            display: block;

            h2 {
                font-size: 2rem !important;
            }

            #formRegister {
                display: block !important;
            }

            /* Cambia el tamaño a que ocupe el 90% del espacio */
        }

        #login.active {
            /* Cambia el tamaño a que ocupe el 10% del espacio */
            width: 10% !important;
            display: flex;

            #formLogin {
                display: none;
            }

            h2 {
                font-size: 1rem;
            }
        }

        #register.change {
            width: 100% !important;
            display: block !important;

            h2 {
                font-size: calc(1.325rem + .9vw) !important;
            }

            #formRegister {
                display: flex !important;
            }

            #mobile-login-text {
                display: block !important;
            }


        }

        #login.change {
            display: none;

            h2 {

                font-size: 1.325rem !important;
            }

            #formLogin {
                display: flex !important;
            }

            #mobile-login-text {
                display: none;
            }


        }



        /*Color principal texto*/
        #login h1,
        #login h2,
        #login p,
        #login label {
            color: #151c8d;
        }

        /*Botones*/
        #submitBtnLogin {
            background-color: #151c8d;
            color: #b8d1cb;
        }

        #submitBtnLogin:hover {
            background-color: #313692;
            color: #98cec1;
        }

        #submitBtnRegister {
            background-color: #b8d1cb;
            color: #151c8d;
        }

        #submitBtnRegister:hover {
            background-color: #9acfc3;
            color: #30358d;
        }

        /*Ocultar por defecto el formulario de registro*/
        #formRegister {
            display: none !important;
        }

        /*Ocultar por defecto el texto de registro en móviles*/
        /*Pantalla grande*/
        @media (min-width: 768px) {
            #password {
                margin-left: auto;
                /* Alinea a la derecha en pantallas grandes */
            }
        }

        /* Pantalla pequeña */
        @media (max-width: 768px) {
            #login {
                width: 100%;
                /* Ajusta el tamaño del formulario en móviles */
            }

            #register {
                display: none;
                /* Oculta el div de registro en móviles */
            }

            .labels {
                width: auto;
            }

            .inputs {
                margin-left: 0px;
                width: 100%;
            }

            #mobile-register-text {
                display: block !important;
                /* Muestra el texto de registro en móviles */
                color: #151c8d;
                text-align: center;
                margin-top: 0rem;
                font-weight: bold;
            }
        }

        /* Oculta el texto de "Regístrate" en pantallas grandes */
        #mobile-register-text,
        #mobile-login-text {
            display: none;

        }
    </style>
</head>

<body>
    <div class="d-flex justify-content-center align-items-center height">
        <div id="global" class="container w-75 rounded">
            <div class="row text-center h-100">
                <div id="login" class="justify-content-center align-items-center">
                    <h2>Iniciar sesión</h2>
                    <form action="login" id="formLogin">
                        <div class="row g-3 align-items-center mt-3">
                            <div class="labels col-3">
                                <label class="form-label">Nombre de usuario</label>
                            </div>
                            <div class="inputs col-9">
                                <input type="text" name="user" id="userName" class="form-control" required>
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-3">
                            <div class="labels col-3">
                                <label class="form-label text-end">Contraseña</label>
                            </div>
                            <div class="inputs col-9">
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>
                        </div>
                        <div class="mt-4">
                            <input id="submitBtnLogin" type="submit" class="btn w-50" value="Iniciar">
                        </div>
                    </form>
                    <div id="mobile-register-text" class="text-center pt-5">
                        <p>¿No tienes cuenta? <a href="#" style="color: #151c8d; ">Regístrate</a></p>
                    </div>
                </div>
                <div id="register" class="justify-content-center align-items-center">
                    <h2 class="fs-6 text">Registrate</h2>
                    <form action="register" id="formRegister">
                        <div class="row g-3 align-items-center mt-3">
                            <div class="labels col-3">
                                <label class="form-label">Nombre de usuario</label>
                            </div>
                            <div class="inputs col-9">
                                <input type="text" name="user" id="userNameRegister" class="form-control" required>
                            </div>
                            <div class="labels col-3">
                                <label class="form-label text-end">Contraseña</label>
                            </div>
                            <div class="inputs col-3">
                                <input type="password" name="password" id="passwordRegister" class="form-control"
                                    required>
                            </div>
                            <div class="labels col-3">
                                <label class="form-label text-end">Confirmar Contraseña</label>
                            </div>
                            <div class="inputs col-3">
                                <input type="password" name="password" id="passwordRegister" class="form-control"
                                    required>
                            </div>
                            <div class="mt-4">
                                <input id="submitBtnRegister" type="submit" class="btn w-50" value="Iniciar">
                            </div>
                        </div>
                    </form>
                    <div id="mobile-login-text" class="text-center pt-5">
                        <p>¿Tienes cuenta? <a href="#" style="color: #b8d1cb;">Inicia sesi&oacute;n</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            let form = 'register';
            let hover_click = true;

            if ($(window).width() <= 768) {
                hover_click = false;
            }

            // Register configuration
            $('#register').hover(
                function () {
                    if (form === 'register' && hover_click) {
                        //primer parametro, al pasar el raton por encima
                        colorChange(this, "#30358d", "#9acfc3");
                    }
                }, function () {
                    // Segundo parametro: cuando el cursor sale
                    if (form === 'register' && hover_click) {
                        colorChange(this, "#151c8d", "#b8d1cb");
                    }
                });

            // Evento para mostrar el formulario de registro
            $("#register").click(function () {
                if (form === 'register' && hover_click) {
                    colorChange(this, "#151c8d", "#b8d1cb");
                    toggleForms();// Llama a la función para hacer la animación
                    form = 'login';
                }
            });

            //login configuration
            $('#login').hover(function () {
                //primer parametro, al pasar el raton por encima
                if (form === 'login' && hover_click) {
                    colorChange(this, "#9acfc3", "#30358d");
                }
            }, function () {
                // Segundo parametro: cuando el cursor sale
                if (form === 'login' && hover_click) {
                    colorChange(this, "#b8d1cb", "#151c8d");
                }
            });

            // Evento para mostrar el formulario de registro
            $("#login").click(function () {
                if (form === 'login' && hover_click) {
                    toggleForms();// Llama a la función para hacer la animación
                    form = 'register';
                    colorChange(this, "#b8d1cb", "#99ada9");
                }
            });

            $('#mobile-register-text').click(function () {
                toggleFormsMovile();
                /*toggleForms();
                $('#register').removeAttr('display');
                $('#register').attr('style', 'display: flex !important;');
                $('#register').attr('style', 'width: 100% !important;');
                $('#login').attr('style', 'display: none !important;');
                $('#mobile-login-text').attr('style', 'display: block! important;');*/
            }
            );
            $('#mobile-login-text').click(function () {
                toggleFormsMovile();
                /*toggleForms();
                $('#login').removeAttr('display');
                $('#login').attr('style', 'display: flex !important;');
                $('#login').attr('style', 'width: 100% !important;');
                $('#register').attr('style', 'display: none !important;');
                $('#mobile-register-text').attr('style', 'display: block! important;');*/
            }
            );


            //Funciones usadas
            //Funcion para cambiar los colores
            function colorChange(element, backgroundColor, textColor) {
                $(element).css({
                    "background-color": backgroundColor,
                    "color": textColor
                });
            }
            // Función para alternar entre el formulario de login y el de registro
            function toggleForms() {
                $('#register').toggleClass('active'); // Activa la animación de #register
                $('#login').toggleClass('active'); // Activa la animación de #login
            }
            // funcion para alternar formulario de login y el de registro en pantallas pequeñas
            function toggleFormsMovile() {
                $('#login').toggleClass('change');
                $('#register').toggleClass('change');
            }

        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>