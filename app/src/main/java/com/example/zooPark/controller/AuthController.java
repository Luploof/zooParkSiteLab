package com.example.zooPark.controller;

import com.example.zooPark.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String email,
                           @RequestParam String password,
                           @RequestParam String name,
                           Model model) {
        userService.register(email, password, name);
        model.addAttribute("message", "Регистрация прошла успешно! Войдите.");
        return "login";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
}
