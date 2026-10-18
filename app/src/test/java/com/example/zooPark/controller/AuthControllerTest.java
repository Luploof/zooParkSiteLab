package com.example.zooPark.controller;

import com.example.zooPark.service.UserService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
class AuthControllerTest {

    @Mock
    private UserService userService;

    @InjectMocks
    private AuthController authController;

    @Test
    void showRegisterPage_ShouldReturnRegisterView() {
        String viewName = authController.showRegisterPage();
        assertEquals("register", viewName);
    }

    @Test
    void register_ShouldCallServiceAndReturnLoginViewWithMessage() {
        Model model = new ExtendedModelMap();
        String email = "test@mail.com";
        String password = "password123";
        String name = "Test User";

        String result = authController.register(email, password, name, model);

        verify(userService).register(email, password, name);
        assertEquals("login", result);
        assertEquals("Регистрация прошла успешно! Войдите.", model.getAttribute("message"));
    }

    @Test
    void register_WithEmptyParams_ShouldCallService() {
        Model model = new ExtendedModelMap();

        String result = authController.register("", "", "", model);

        verify(userService).register("", "", "");
        assertEquals("login", result);
    }

    @Test
    void register_WithNullParams_ShouldCallService() {
        Model model = new ExtendedModelMap();

        String result = authController.register(null, null, null, model);

        verify(userService).register(null, null, null);
        assertEquals("login", result);
    }

    @Test
    void login_ShouldReturnLoginView() {
        String viewName = authController.login();
        assertEquals("login", viewName);
    }
}