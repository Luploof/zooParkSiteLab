package com.example.zooPark.controller;

import com.example.zooPark.service.EmailService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class DonationControllerTest {

    @Mock
    private EmailService emailService;

    @Mock
    private SecurityContext securityContext;

    @Mock
    private Authentication authentication;

    @InjectMocks
    private DonationController donationController;

    @Test
    void showDonationPage_ShouldReturnDonationView() {
        Model model = new ExtendedModelMap();

        String viewName = donationController.showDonationPage(model);

        assertEquals("donation", viewName);
    }

    @Test
    void handleDonation_ShouldSendEmailsAndReturnSuccess() throws Exception {
        Model model = new ExtendedModelMap();
        String name = "John Doe";
        String email = "john@mail.com";
        String comment = "For animals";
        double amount = 100.0;

        String result = donationController.handleDonation(name, email, comment, amount, model);

        verify(emailService).sendEmail(email, "Спасибо за пожертвование!",
                "Спасибо, что пожертвовали зоопарку «Зелёный Мир» 100,00$. Зверушки будут счастливы!");
        verify(emailService).sendEmail("luplooff@yandex.ru", "Новое пожертвование!",
                "Зоопарку переведено 100,00$.\nEmail: john@mail.com\nКомментарий: For animals");
        assertEquals("donation_success", result);
        assertEquals("John Doe", model.getAttribute("donorName"));
        assertEquals(100.0, model.getAttribute("amount"));
    }

    @Test
    void handleDonation_WithEmailException_ShouldReturnDonationWithError() throws Exception {
        Model model = new ExtendedModelMap();
        String name = "John Doe";
        String email = "john@mail.com";
        String comment = "For animals";
        double amount = 100.0;

        doThrow(new RuntimeException("SMTP error")).when(emailService).sendEmail(anyString(), anyString(), anyString());

        String result = donationController.handleDonation(name, email, comment, amount, model);

        assertEquals("donation", result);
        assertEquals("Ошибка при отправке письма. Проверьте настройки SMTP.", model.getAttribute("errorMessage"));
    }

    @Test
    void handleDonation_WithZeroAmount_ShouldSendEmails() throws Exception {
        Model model = new ExtendedModelMap();
        String name = "John Doe";
        String email = "john@mail.com";
        String comment = "For animals";
        double amount = 0.0;

        String result = donationController.handleDonation(name, email, comment, amount, model);

        verify(emailService).sendEmail(email, "Спасибо за пожертвование!",
                "Спасибо, что пожертвовали зоопарку «Зелёный Мир» 0,00$. Зверушки будут счастливы!");
        assertEquals("donation_success", result);
    }

    @Test
    void handleDonation_WithEmptyComment_ShouldSendEmails() throws Exception {
        Model model = new ExtendedModelMap();
        String name = "John Doe";
        String email = "john@mail.com";
        String comment = "";
        double amount = 50.0;

        String result = donationController.handleDonation(name, email, comment, amount, model);

        verify(emailService).sendEmail("luplooff@yandex.ru", "Новое пожертвование!",
                "Зоопарку переведено 50,00$.\nEmail: john@mail.com\nКомментарий: ");
        assertEquals("donation_success", result);
    }


    @Test
    void addUserEmail_WithAnonymousUser_ShouldNotAddEmailToModel() {
        Model model = new ExtendedModelMap();
        SecurityContextHolder.setContext(securityContext);

        when(securityContext.getAuthentication()).thenReturn(authentication);
        when(authentication.isAuthenticated()).thenReturn(true);
        when(authentication.getPrincipal()).thenReturn("anonymousUser");

        donationController.showDonationPage(model);

        assertEquals(null, model.getAttribute("userEmail"));
    }

    @Test
    void addUserEmail_WithNullAuthentication_ShouldNotAddEmailToModel() {
        Model model = new ExtendedModelMap();
        SecurityContextHolder.setContext(securityContext);

        when(securityContext.getAuthentication()).thenReturn(null);

        donationController.showDonationPage(model);

        assertEquals(null, model.getAttribute("userEmail"));
    }
}