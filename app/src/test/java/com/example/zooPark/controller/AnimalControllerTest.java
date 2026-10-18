package com.example.zooPark.controller;

import com.example.zooPark.model.Animal;
import com.example.zooPark.service.AnimalService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class AnimalControllerTest {

    @Mock
    private AnimalService animalService;

    @InjectMocks
    private AnimalController animalController;

    private Model model;

    @BeforeEach
    void setUp() {
        model = new ExtendedModelMap();
    }

    @Test
    void showAnimals_ShouldReturnAnimalsView_WithAnimalsInModel() {
        List<Animal> expectedAnimals = Arrays.asList(
                createAnimal(1L, "Leo", "Lion", 1.2, 190.5, "King of the jungle", "/photos/leo.jpg"),
                createAnimal(2L, "Pingu", "Penguin", 0.7, 35.0, "Cute antarctic bird", "/photos/pingu.jpg")
        );

        when(animalService.getAllAnimals()).thenReturn(expectedAnimals);

        String viewName = animalController.showAnimals(model);

        assertEquals("animals", viewName);
        assertEquals(expectedAnimals, model.getAttribute("animals"));
        verify(animalService, times(1)).getAllAnimals();
    }

    @Test
    void showAnimalPage_WithExistingId_ShouldReturnAnimalDetailsView_WithAnimalInModel() {
        Long animalId = 1L;
        Animal expectedAnimal = createAnimal(animalId, "Tiger", "Bengal Tiger", 1.1, 220.0, "Striped predator", "/photos/tiger.jpg");

        when(animalService.getAnimalById(animalId)).thenReturn(expectedAnimal);

        String viewName = animalController.showAnimalPage(animalId, model);

        assertEquals("animal_details", viewName);
        assertEquals(expectedAnimal, model.getAttribute("animal"));
        verify(animalService, times(1)).getAnimalById(animalId);
    }

    @Test
    void showAnimalPage_WithNonExistingId_ShouldReturnAnimalDetailsView_WithNullInModel() {
        Long nonExistingId = 999L;

        when(animalService.getAnimalById(nonExistingId)).thenReturn(null);

        String viewName = animalController.showAnimalPage(nonExistingId, model);

        assertEquals("animal_details", viewName);
        assertNull(model.getAttribute("animal"));
        verify(animalService, times(1)).getAnimalById(nonExistingId);
    }

    @Test
    void showAnimalPage_WithNullId_ShouldReturnAnimalDetailsView_WithNullInModel() {
        Long nullId = null;

        when(animalService.getAnimalById(nullId)).thenReturn(null);

        String viewName = animalController.showAnimalPage(nullId, model);

        assertEquals("animal_details", viewName);
        assertNull(model.getAttribute("animal"));
        verify(animalService, times(1)).getAnimalById(nullId);
    }

    @Test
    void showAnimals_ShouldCallServiceOnlyOnce() {
        List<Animal> animals = Arrays.asList(
                createAnimal(1L, "Elephant", "African Elephant", 3.5, 6000.0, "Large mammal", "/photos/elephant.jpg")
        );
        when(animalService.getAllAnimals()).thenReturn(animals);

        animalController.showAnimals(model);

        verify(animalService, times(1)).getAllAnimals();
        verifyNoMoreInteractions(animalService);
    }

    @Test
    void showAnimalPage_ShouldCallServiceOnlyOnce() {
        Long animalId = 1L;
        Animal animal = createAnimal(animalId, "Giraffe", "Masai Giraffe", 5.5, 1200.0, "Tall animal", "/photos/giraffe.jpg");
        when(animalService.getAnimalById(animalId)).thenReturn(animal);

        animalController.showAnimalPage(animalId, model);

        verify(animalService, times(1)).getAnimalById(animalId);
        verifyNoMoreInteractions(animalService);
    }

    @Test
    void showAnimals_WithEmptyList_ShouldReturnEmptyModel() {
        List<Animal> emptyList = List.of();
        when(animalService.getAllAnimals()).thenReturn(emptyList);

        String viewName = animalController.showAnimals(model);

        assertEquals("animals", viewName);
        assertEquals(emptyList, model.getAttribute("animals"));
        verify(animalService, times(1)).getAllAnimals();
    }

    private Animal createAnimal(Long id, String name, String breed, double height, double weight, String description, String photoUrl) {
        Animal animal = new Animal();
        animal.setId(id);
        animal.setName(name);
        animal.setBreed(breed);
        animal.setHeight(height);
        animal.setWeight(weight);
        animal.setDescription(description);
        animal.setPhotoUrl(photoUrl);
        return animal;
    }
}