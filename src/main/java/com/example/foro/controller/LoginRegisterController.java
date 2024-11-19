package com.example.foro.controller;

import org.springframework.ui.Model;
import com.example.foro.repository.ComentarioRepository;
import com.example.foro.service.CustomUserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.ExecutionException;


@Controller
@RequestMapping("/login_register")
public class LoginRegisterController {
    private ComentarioRepository comentarioRepository;
    private final CustomUserDetailsService customUserDetailsService;

    // Inyección del servicio en el constructor
    public LoginRegisterController(CustomUserDetailsService customUserDetailsService) {
        this.customUserDetailsService = customUserDetailsService;
    }
    @GetMapping
    public String PagLoginRegister() {
        return "login_register";
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam String newUserName,
                               @RequestParam String newPassword,
                               @RequestParam String confirmPassword,
                               Model model) {
        if (newPassword.equals(confirmPassword)) {
            try {
                customUserDetailsService.registrarUsuario(newUserName, newPassword);
            } catch (RuntimeException ignored) {
                model.addAttribute("aviso", ignored.getMessage());
                model.addAttribute("newUserName", newUserName);
                model.addAttribute("newPassword", newPassword);
                model.addAttribute("confirmPassword", confirmPassword);
            }
        }
        return "redirect:login_register";
    }
    @PostMapping("/validate")
    @ResponseBody
    public boolean validateUser(@RequestParam String newUserName){
        return customUserDetailsService.verificarUsuario(newUserName);
    }
}
