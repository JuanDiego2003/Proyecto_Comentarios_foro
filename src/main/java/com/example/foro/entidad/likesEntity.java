package com.example.foro.entidad;

import jakarta.persistence.*;

@Entity
@Table(name = "Likes")
public class likesEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_like;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private userEntity usuario;

    @ManyToOne
    @JoinColumn(name = "id_publicacion", nullable = false)
    private publicationEntity publicacion;

    public int getId_like() {
        return id_like;
    }

    public publicationEntity getPublicacion() {
        return publicacion;
    }

    public void setPublicacion(publicationEntity publicacion) {
        this.publicacion = publicacion;
    }

    public userEntity getUsuario() {
        return usuario;
    }

    public void setUsuario(userEntity usuario) {
        this.usuario = usuario;
    }
}
