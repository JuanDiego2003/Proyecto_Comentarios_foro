package com.example.foro.controller;

import com.example.foro.entidad.comentEntity;
import com.example.foro.entidad.publicationEntity;
import com.example.foro.repository.ComentarioRepository;
import com.example.foro.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comentarios")
public class ComentarioController {
    private final UserRepository UserRepository;

    @Autowired
    private ComentarioRepository comentarioRepository;

    public ComentarioController(com.example.foro.repository.UserRepository userRepository) {
        UserRepository = userRepository;
    }

    @GetMapping
    public String paginaInicial(Model model) {
        model.addAttribute("comentarios", listarComentarios());
        return "comentarios"; // Nombre de tu JSP
    }

    // Mostrar la vista de comentarios
    @RequestMapping("/listar")
    @ResponseBody
    public List<comentEntity> listarComentarios() {
        return comentarioRepository.findAllOrderByIdAsc(); // Devuelve los comentarios como JSON
    }

    // Agregar un nuevo comentario vía AJAX
    //@RequestMapping
    @PostMapping("/agregar")
    @ResponseBody
    public void agregarComentario(@RequestParam String texto) {
        //contexto de autenticación
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null && authentication.isAuthenticated()) {
            return;
        }
        // Nombre del usuario autenticado
        String username = authentication.getName();

        comentEntity coment = new comentEntity();
        coment.setContenido(texto);
        coment.setUsuario(UserRepository.findByUsername(username));
        coment.setPublicacion(new publicationEntity());

        comentarioRepository.save(coment);
        //return (nuevoComentario); // Retorna el comentario guardado
    }
}
