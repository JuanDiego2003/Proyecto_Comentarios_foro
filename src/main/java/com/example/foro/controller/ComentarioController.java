package com.example.foro.controller;

import com.example.foro.entidad.Comentario;
import com.example.foro.repository.ComentarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comentarios")
public class ComentarioController {

    @Autowired
    private ComentarioRepository comentarioRepository;

    // Mostrar la vista de comentarios
    @GetMapping
    public String listarComentarios(Model model) {
        List<Comentario> comentarios = comentarioRepository.findAll();
        model.addAttribute("comentarios", comentarios);
        return "comentarios"; // Nombre del JSP
    }

    // Agregar un nuevo comentario vía AJAX
    @PostMapping
    @ResponseBody
    public Comentario agregarComentario(@RequestParam String texto) {
        Comentario nuevoComentario = new Comentario(texto);
        return comentarioRepository.save(nuevoComentario); // Retorna el comentario guardado
    }
    @GetMapping("/prueba")
    public String prueba() {
        return "comentarios"; // Nombre del JSP sin la extensión
    }
}
