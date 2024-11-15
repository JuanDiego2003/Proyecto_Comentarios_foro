package com.example.foro.encoderPasword;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); // Ciframos contraseñas con BCrypt
    }
    /*
    uso
     @Autowired
private PasswordEncoder passwordEncoder;

public void saveUser(UserEntity user) {
    user.setPassword(passwordEncoder.encode(user.getPassword())); // Ciframos la contraseña
    userRepository.save(user);
}
*/
}
