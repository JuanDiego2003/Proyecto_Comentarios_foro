package com.example.foro.entidad;

import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "pubication")

public class publicationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_publicacion;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private userEntity usuario;

    @Column(nullable = false)
    private String titulo;

    @Column(nullable = false)
    private String contenido;

    @OneToMany(mappedBy = "publicacion", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<comentEntity> comentarios;

    @OneToMany(mappedBy = "publicacion", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<likesEntity> likes;

    public int getId_publicacion() {
        return id_publicacion;
    }


    public userEntity getUsuario() {
        return usuario;
    }

    public void setUsuario(userEntity usuario) {
        this.usuario = usuario;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Set<comentEntity> getComentarios() {
        return comentarios;
    }

    public void setComentarios(Set<comentEntity> comentarios) {
        this.comentarios = comentarios;
    }

    public Set<likesEntity> getLikes() {
        return likes;
    }

    public void setLikes(Set<likesEntity> likes) {
        this.likes = likes;
    }
}
