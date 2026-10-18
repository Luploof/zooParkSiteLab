package com.example.zooPark.controller;

import com.example.zooPark.service.EmailServiceExc;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class ExcursionControllerTest {

    @Mock
    private EmailServiceExc emailService;

    @Mock
    private SecurityContext securityContext;

    @Mock
    private Authentication authentication;

    @InjectMocks
    private ExcursionController excursionController;



    @Test
    void submitBooking_ShouldSendEmailAndReturnSuccess() throws Exception {
        String excursionName = "Зоопарк утренний";
        String userEmail = "test@mail.com";
        int amount = 5;
        String userName = "John Doe";

        String result = excursionController.submitBooking(excursionName, userEmail, amount, userName);

        verify(emailService).sendOrder("luplooff@yandex.ru", "Новый заказ!",
                "Пользователь John Doe (test@mail.com) желает заказать экскурсию \"Зоопарк утренний\" на 5 человек.");
        assertEquals("success", result);
    }

    @Test
    void submitBooking_WithNullUserName_ShouldSendEmailWithDefaultName() throws Exception {
        String excursionName = "Зоопарк вечерний";
        String userEmail = "test@mail.com";
        int amount = 3;

        String result = excursionController.submitBooking(excursionName, userEmail, amount, null);

        verify(emailService).sendOrder("luplooff@yandex.ru", "Новый заказ!",
                "Пользователь Не указано (test@mail.com) желает заказать экскурсию \"Зоопарк вечерний\" на 3 человек.");
        assertEquals("success", result);
    }

    @Test
    void submitBooking_WithEmailException_ShouldReturnError() throws Exception {
        String excursionName = "Детская экскурсия";
        String userEmail = "test@mail.com";
        int amount = 2;
        String userName = "Jane Doe";

        doThrow(new RuntimeException("SMTP error")).when(emailService).sendOrder(anyString(), anyString(), anyString());

        String result = excursionController.submitBooking(excursionName, userEmail, amount, userName);

        assertEquals("error", result);
    }

    @Test
    void submitBooking_WithZeroAmount_ShouldSendEmail() throws Exception {
        String excursionName = "Зоопарк утренний";
        String userEmail = "test@mail.com";
        int amount = 0;
        String userName = "John Doe";

        String result = excursionController.submitBooking(excursionName, userEmail, amount, userName);

        verify(emailService).sendOrder("luplooff@yandex.ru", "Новый заказ!",
                "Пользователь John Doe (test@mail.com) желает заказать экскурсию \"Зоопарк утренний\" на 0 человек.");
        assertEquals("success", result);
    }



    @Test
    void addUserEmail_WithAnonymousUser_ShouldNotAddEmailToModel() {
        Model model = new ExtendedModelMap();
        SecurityContextHolder.setContext(securityContext);

        when(securityContext.getAuthentication()).thenReturn(authentication);
        when(authentication.isAuthenticated()).thenReturn(true);
        when(authentication.getPrincipal()).thenReturn("anonymousUser");

        excursionController.showExcursions(model);

        assertEquals(null, model.getAttribute("userEmail"));
    }

    @Test
    void addUserEmail_WithNullAuthentication_ShouldNotAddEmailToModel() {
        Model model = new ExtendedModelMap();
        SecurityContextHolder.setContext(securityContext);

        when(securityContext.getAuthentication()).thenReturn(null);

        excursionController.showExcursions(model);

        assertEquals(null, model.getAttribute("userEmail"));
    }
}