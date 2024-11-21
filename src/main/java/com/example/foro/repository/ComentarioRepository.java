package com.example.foro.repository;

import com.example.foro.entidad.comentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ComentarioRepository extends JpaRepository<comentEntity, Long> {
    @Query("SELECT c FROM comentEntity c ORDER BY id DESC")
    List<comentEntity> findAllOrderByIdAsc();
}
