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
                    white-space: normal;
                }
            </style>
        </head>

        <body>
            <div class="container w-75">
                <div class="text-center">
                    <h1 class="text-center">Proecto Foro</h1>
                    <!-- Formulario para añadir un comentario -->
                    <form id="comentarioForm" class="row justify-content-center">
                        <textarea name="texto" class="form-control mb-3 w-75" rows="3" required></textarea>
                        <button type="submit" class="btn btn-primary w-50">Publicar Comentario</button>
                    </form>
                    <!-- Lista de comentarios -->
                    <div class="">
                        <h2>Lista de Comentarios</h2>
                        <div id="listaComentarios" class="text-start w-75 mx-auto">
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
                $(document).ready(function () {
                    $('#comentarioForm').on('submit', function (e) {
                        e.preventDefault();
                        $.ajax({
                            type: 'POST',
                            url: '/comentarios',
                            data: $(this).serialize(),
                            success: function (comentario) {
                                $('#listaComentarios').append('<li>' + comentario.texto + '</li>');
                                $('#comentarioForm')[0].reset(); // Limpia el formulario
                            },
                            error: function () {
                                alert('Error al agregar el comentario.');
                            }
                        });
                    });
                });
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>

        </body>

        </html>