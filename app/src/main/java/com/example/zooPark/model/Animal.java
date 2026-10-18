package com.example.zooPark.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "animals")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Animal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String breed;
    private double height;
    private double weight;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String photoUrl;


    public Animal(String name, String breed, double height, double weight, String description, String photoUrl) {
        this.name = name;
        this.breed = breed;
        this.height = height;
        this.weight = weight;
        this.description = description;
        this.photoUrl = photoUrl;
    }
}
