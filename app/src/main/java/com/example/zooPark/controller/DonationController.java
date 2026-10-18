package com.example.zooPark.controller;

import com.example.zooPark.service.EmailService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class DonationController {

    private final EmailService emailService;

    @GetMapping("/donation")
    public String showDonationPage(Model model) {
        addUserEmail(model);
        return "donation";
    }

    @PostMapping("/donation")
    public String handleDonation(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String comment,
            @RequestParam double amount,
            Model model
    ) {
        try {
            String userMessage = String.format(
                    "Спасибо, что пожертвовали зоопарку «Зелёный Мир» %.2fBYN. Зверушки будут счастливы!",
                    amount
            );
            emailService.sendEmail(email, "Спасибо за пожертвование!", userMessage);

            String adminMessage = String.format(
                    "Зоопарку переведено %.2fBYN.\nEmail: %s\nКомментарий: %s",
                    amount, email, comment
            );
            emailService.sendEmail("luplooff@yandex.ru", "Новое пожертвование!", adminMessage);

            addUserEmail(model);
            model.addAttribute("donorName", name);
            model.addAttribute("amount", amount);
            return "donation_success";
        } catch (Exception e) {
            e.printStackTrace();
            addUserEmail(model);
            model.addAttribute("errorMessage", "Ошибка при отправке письма. Проверьте настройки SMTP.");
            return "donation";
        }
    }

    private void addUserEmail(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            model.addAttribute("userEmail", auth.getName());
        }
    }
}
