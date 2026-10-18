package com.example.zooPark.controller;

import com.example.zooPark.model.VolunteerApplication;
import com.example.zooPark.service.VolunteerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class VolunteerController {

    private final VolunteerService volunteerService;

    public VolunteerController(VolunteerService volunteerService) {
        this.volunteerService = volunteerService;
    }

    @GetMapping("/volunteers")
    public String showVolunteerPage(Model model) {
        // Добавляем статистику для отображения на странице
        model.addAttribute("volunteerCount", volunteerService.getVolunteerCount());
        model.addAttribute("totalHours", volunteerService.getTotalVolunteerHours());
        model.addAttribute("eventsCount", volunteerService.getEventsCount());

        return "volunteers";
    }

    @PostMapping("/volunteers/apply")
    public String processVolunteerApplication(
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam String email,
            @RequestParam String phone,
            @RequestParam List<String> interests,
            @RequestParam(required = false) String experience,
            @RequestParam(required = false) List<String> availability,
            Model model) {

        try {
            VolunteerApplication application = new VolunteerApplication();
            application.setFirstName(firstName);
            application.setLastName(lastName);
            application.setEmail(email);
            application.setPhone(phone);
            application.setInterests(interests);
            application.setExperience(experience);
            application.setAvailability(availability);
            application.setStatus("NEW");

            volunteerService.saveApplication(application);

            return "redirect:/volunteers/success";
        } catch (Exception e) {
            model.addAttribute("error", "Произошла ошибка при отправке заявки. Попробуйте еще раз.");
            return "volunteers";
        }
    }

    @GetMapping("/volunteers/success")
    public String showSuccessPage() {
        return "volunteer-success";
    }
}