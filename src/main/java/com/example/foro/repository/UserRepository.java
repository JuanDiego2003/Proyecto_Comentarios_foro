package com.example.foro.repository;

import com.example.foro.entidad.userEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<userEntity, String> {
    userEntity findByUsername(String userName);
}
