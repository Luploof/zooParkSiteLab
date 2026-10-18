package com.example.zooPark.controller;

import com.example.zooPark.service.AnimalService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class AnimalController {

    private final AnimalService animalService;

    @GetMapping("/animals")
    public String showAnimals(Model model) {
        model.addAttribute("animals", animalService.getAllAnimals());
        return "animals";
    }

    @GetMapping("/animals/{id}")
    public String showAnimalPage(@PathVariable Long id, Model model) {
        model.addAttribute("animal", animalService.getAnimalById(id));
        return "animal_details";
    }
}
