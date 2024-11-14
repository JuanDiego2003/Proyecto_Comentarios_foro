package com.example.foro.securingweb;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/comentario").setViewName("comentario");
        registry.addViewController("/").setViewName("home");
        //registry.addViewController("/hello").setViewName("hello");
        registry.addViewController("/login_register").setViewName("login_register");
    }

}