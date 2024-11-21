package com.example.foro.entidad;

import jakarta.persistence.*;

@Entity
@Table(name = "coment")

public class comentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_comentario;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private userEntity usuario;

    @ManyToOne
    @JoinColumn(name = "id_publicacion", nullable = false)
    private publicationEntity publicacion;

    @Column(nullable = false)
    private String contenido;

    public int getId_comentario() {
        return id_comentario;
    }

    public userEntity getUsuario() {
        return usuario;
    }

    public void setUsuario(userEntity usuario) {
        this.usuario = usuario;
    }

    public publicationEntity getPublicacion() {
        return publicacion;
    }

    public void setPublicacion(publicationEntity publicacion) {
        this.publicacion = publicacion;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
}
