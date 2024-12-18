<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>

        <head>
            <title>Comentarios del Foro</title>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <style>
                .text-wrap {
                    word-wrap: break-word;
                    white-space: normal;
                }

                .scroll-container {
                    max-height: 300px;
                    /* Ajusta la altura máxima del contenedor */
                    overflow-y: auto;
                    /* Activa el desplazamiento vertical */
                    border: 1px solid #ddd;
                    /* Opcional: agregar borde */
                    padding: 15px;
                    /* Espacio interno */
                    border-radius: 5px;
                    /* Bordes redondeados */
                    background-color: #f8f9fa;
                    /* Fondo opcional para distinguir el área */
                }

                .scroll-container::-webkit-scrollbar {
                    width: 6px;
                    /* Barra más delgada */
                }

                .scroll-container::-webkit-scrollbar-track {
                    background: #f9f9f9;
                    /* Color de la pista */
                }

                .scroll-container::-webkit-scrollbar-thumb {
                    background: #ccc;
                    /* Color del pulgar */
                }

                .scroll-container::-webkit-scrollbar-thumb:hover {
                    background: #aaa;
                    /* Color más oscuro al pasar el mouse */
                }
            </style>
        </head>

        <body>
            <div class="container w-75">
                <div class="text-center row justify-content-center">
                    <h1 class="text-center">Proecto Foro</h1>
                    <!-- Formulario para añadir un comentario -->
                    <form id="comentarioForm" class="row justify-content-center">
                        <label id="textAviso" class="text-start w-75 text-danger"></label>
                        <textarea id="textComentario" name="texto" class="form-control mb-3 w-75" rows="3" required
                            placeholder="Introduce tu comentario!"></textarea>
                        <button id="submit" type="submit" class="btn btn-primary w-50" disabled>Publicar
                            Comentario</button>
                    </form>
                    <!-- Lista de comentarios -->
                    <h2>Lista de Comentarios</h2>
                    <div class="scroll-container w-75">
                        <div id="listaComentarios" class="text-start w-100 mx-auto">
                            <c:forEach var="comentario" items="${comentarios}">
                                <div>
                                    <p class="text-wrap">${comentario.texto}</p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Script para manejar el formulario con AJAX -->
            <script>
                const alphabet = [
                    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                    'á', 'é', 'í', 'ó', 'ú', // Letras acentuadas (español y catalán)
                    'à', 'è', 'ì', 'ò', 'ù', // Vocales con acento abierto (catalán)
                    'ü', // Letra con diéresis (español y catalán)
                    'ç', // Letra cedilla (catalán)
                    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'Ñ', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                    'Á', 'É', 'Í', 'Ó', 'Ú', // Letras acentuadas mayúsculas (español y catalán)
                    'À', 'È', 'Ì', 'Ò', 'Ù', // Vocales con acento abierto mayúsculas (catalán)
                    'Ü', // Letra con diéresis mayúscula (español y catalán)
                    'Ç'  // Letra cedilla mayúscula (catalán)
                ];
                $(document).ready(function () {
                    //Sweet alert toast para avisos como errores y sucess
                    var toastMixin = Swal.mixin({
                        toast: true,
                        icon: 'success',
                        title: 'Agregado con exito!',
                        animation: true,
                        position: 'top-right',
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    });

                    let correct = false;
                    $('#textComentario').on('input', function () {
                        for (let index = 0; index < alphabet.length; index++) {
                            if ($('#textComentario').val().includes(alphabet[index])) {
                                correct = true;
                                break;
                            }
                        }
                        if (correct) {
                            $('#submit').removeAttr('disabled');
                            $('#textAviso').text('');
                            correct = false;
                        } else {
                            $('#submit').attr('disabled', true);
                            $('#textAviso').text('No esta permitido añadir solo espacios ni saltos de linea.');
                        }
                    });

                    $('#comentarioForm').on('submit', function (e) {

                        e.preventDefault();
                        $.ajax({
                            type: 'POST',
                            url: '/comentarios/agregar',
                            data: $(this).serialize(),
                            success: function (comentario) {
                                //Llama al metodo que se encarga de cargar los comentarios para que se actualice en ese momento
                                cargarComentarios();
                                $('#comentarioForm')[0].reset(); // Limpia el formulario
                                toastMixin.fire({
                                    title: 'Se ha agregado el comentario con exito',
                                });
                            },
                        });
                    });
                    function cargarComentarios() {
                        $.ajax({
                            type: 'GET',
                            url: '/comentarios/listar', // Ruta que toma todos los comentarios de la base de datos
                            success: function (comentarios) {

                                // Limpiar los comentarios antiguos
                                $('#listaComentarios').empty();
                                // Agregar los comentarios nuevos
                                comentarios.forEach(function (comentario) {
                                    $('#listaComentarios').append('<div><p class="text-wrap">' + comentario.texto + '</p></div>');
                                });
                            },
                            error: function () {
                                toastMixin.fire({
                                    title: 'Se ha producido un erro al cargar los comentarios',
                                    icon: 'error'
                                });
                            }
                        });
                    }
                    // Cada 5 segundos se cargan los comentarios nuevos para que se muestren en pantalla
                    setInterval(cargarComentarios, 5000);
                });
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        </body>

        </html>