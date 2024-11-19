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

    @GetMapping
    public String paginaInicial(Model model) {
        model.addAttribute("comentarios", listarComentarios());
        return "comentarios"; // Nombre de tu JSP
    }

    // Mostrar la vista de comentarios
    @RequestMapping("/listar")
    @ResponseBody
    public List<Comentario> listarComentarios() {
        return comentarioRepository.findAllOrderByIdAsc(); // Devuelve los comentarios como JSON
    }

    // Agregar un nuevo comentario vía AJAX
    //@RequestMapping
    @PostMapping("/agregar")
    @ResponseBody
    public void agregarComentario(@RequestParam String texto) {
        comentarioRepository.save(new Comentario(texto));
        //return (nuevoComentario); // Retorna el comentario guardado
    }
}
