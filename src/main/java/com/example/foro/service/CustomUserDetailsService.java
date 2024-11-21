package com.example.foro.service;

import org.springframework.security.core.userdetails.User;
import com.example.foro.entidad.userEntity;
import com.example.foro.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    public CustomUserDetailsService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public boolean verificarUsuario(String username) {
        return userRepository.findByUsername(username) != null;
    }

    //Registrar usuario con contraseña cifrada
    public void registrarUsuario(String username, String password) {
        if (verificarUsuario(username)) {
            throw new RuntimeException("Este usuario ya esta registrado");
        }

        userEntity user = new userEntity();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setEmail("");
        userRepository.save(user);
    }


    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        // Buscar el usuario en la base de datos
        userEntity UserEntity = userRepository.findByUsername(userName);

        if (UserEntity == null) {
            throw new UsernameNotFoundException("Usuario no encontrado");
        }

        // Asegurarse de que la contraseña está cifrada en la base de datos
        return User.builder()
                .username(UserEntity.getUsername())
                .password(UserEntity.getPassword()) // la contraseña cifrada
                .roles(UserEntity.getRole()) // roles del usuario
                .build();
    }
}
