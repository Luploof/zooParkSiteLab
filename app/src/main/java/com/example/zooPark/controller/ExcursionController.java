package com.example.zooPark.controller;

import com.example.zooPark.service.EmailServiceExc;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ExcursionController {

    private final EmailServiceExc emailService;

    public ExcursionController(EmailServiceExc emailService) {
        this.emailService = emailService;
    }

    // Страница с выбором экскурсии
    @GetMapping("/excursions")
    public String showExcursions(Model model) {
        addUserEmail(model);
        model.addAttribute("excursions", List.of(
                "Зоопарк утренний",
                "Зоопарк вечерний",
                "Детская экскурсия"
        ));
        return "excursions";
    }


    @PostMapping("/excursions/book")
    @ResponseBody
    public String submitBooking(
            @RequestParam String excursionName,
            @RequestParam String userEmail,
            @RequestParam int amount,
            @RequestParam(required = false) String userName
    ) {
        try {
            String adminMessage = String.format(
                    "Пользователь %s (%s) желает заказать экскурсию \"%s\" на %d человек.",
                    userName != null ? userName : "Не указано",
                    userEmail,
                    excursionName,
                    amount
            );
            emailService.sendOrder("luplooff@yandex.ru", "Новый заказ!", adminMessage);

            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    private void addUserEmail(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            model.addAttribute("userEmail", auth.getName());
        }
    }
}
