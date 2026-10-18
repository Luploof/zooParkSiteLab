package com.example.zooPark.controller;

import com.example.zooPark.model.VolunteerApplication;
import com.example.zooPark.service.VolunteerService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class VolunteerControllerTest {

    @Mock
    private VolunteerService volunteerService;

    @InjectMocks
    private VolunteerController volunteerController;


    @Test
    void processVolunteerApplication_ShouldSaveApplicationAndRedirect() {
        Model model = new ExtendedModelMap();
        String firstName = "John";
        String lastName = "Doe";
        String email = "john@mail.com";
        String phone = "+123456789";
        List<String> interests = List.of("Уход за животными", "Образование");
        String experience = "2 года";
        List<String> availability = List.of("Понедельник", "Среда");

        String result = volunteerController.processVolunteerApplication(
                firstName, lastName, email, phone, interests, experience, availability, model
        );

        verify(volunteerService).saveApplication(any(VolunteerApplication.class));
        assertEquals("redirect:/volunteers/success", result);
    }

    @Test
    void processVolunteerApplication_WithNullExperienceAndAvailability_ShouldSaveApplication() {
        Model model = new ExtendedModelMap();
        String firstName = "Jane";
        String lastName = "Smith";
        String email = "jane@mail.com";
        String phone = "+987654321";
        List<String> interests = List.of("Администрирование");

        String result = volunteerController.processVolunteerApplication(
                firstName, lastName, email, phone, interests, null, null, model
        );

        verify(volunteerService).saveApplication(any(VolunteerApplication.class));
        assertEquals("redirect:/volunteers/success", result);
    }

    @Test
    void processVolunteerApplication_WithEmptyInterests_ShouldSaveApplication() {
        Model model = new ExtendedModelMap();
        String firstName = "Bob";
        String lastName = "Brown";
        String email = "bob@mail.com";
        String phone = "+111111111";
        List<String> interests = List.of();

        String result = volunteerController.processVolunteerApplication(
                firstName, lastName, email, phone, interests, "Нет опыта", null, model
        );

        verify(volunteerService).saveApplication(any(VolunteerApplication.class));
        assertEquals("redirect:/volunteers/success", result);
    }

    @Test
    void processVolunteerApplication_WithException_ShouldReturnError() {
        Model model = new ExtendedModelMap();
        String firstName = "John";
        String lastName = "Doe";
        String email = "john@mail.com";
        String phone = "+123456789";
        List<String> interests = List.of("Уход за животными");

        doThrow(new RuntimeException("Database error")).when(volunteerService).saveApplication(any(VolunteerApplication.class));

        String result = volunteerController.processVolunteerApplication(
                firstName, lastName, email, phone, interests, null, null, model
        );

        assertEquals("volunteers", result);
        assertEquals("Произошла ошибка при отправке заявки. Попробуйте еще раз.", model.getAttribute("error"));
    }

    @Test
    void showSuccessPage_ShouldReturnSuccessView() {
        String viewName = volunteerController.showSuccessPage();
        assertEquals("volunteer-success", viewName);
    }
}