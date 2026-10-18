package com.example.zooPark;

import com.example.zooPark.model.User;
import com.example.zooPark.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserDataLoader implements CommandLineRunner {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) {
        if (userRepository.count() == 0) {
            User user = new User();
            user.setEmail("test1@gmail.com");
            user.setName("Тестовый пользователь");
            user.setPassword(passwordEncoder.encode("test12345"));
            userRepository.save(user);
            System.out.println("Тестовый пользователь создан: test1@gmail.com / test12345");
        }
    }
}

