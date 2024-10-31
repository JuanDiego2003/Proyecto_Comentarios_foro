package com.example.foro.repository;

import com.example.foro.entidad.Comentario;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ComentarioRepository extends JpaRepository<Comentario, Long> {
    @Query("SELECT c FROM Comentario c ORDER BY id DESC")
    List<Comentario> findAllOrderByIdAsc();
}
