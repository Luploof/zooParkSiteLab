package com.example.zooPark.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "volunteer_applications")
public class VolunteerApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "phone")
    private String phone;

    @ElementCollection
    @CollectionTable(name = "volunteer_interests", joinColumns = @JoinColumn(name = "application_id"))
    @Column(name = "interest")
    private List<String> interests;

    @Column(name = "experience", length = 1000)
    private String experience;

    @ElementCollection
    @CollectionTable(name = "volunteer_availability", joinColumns = @JoinColumn(name = "application_id"))
    @Column(name = "availability")
    private List<String> availability;

    @Column(name = "status")
    private String status;

    @Column(name = "hours_volunteered")
    private Integer hoursVolunteered;

    @Column(name = "event")
    private String event;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;


    public VolunteerApplication() {
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
        this.status = "NEW";
    }


    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public List<String> getInterests() { return interests; }
    public void setInterests(List<String> interests) { this.interests = interests; }

    public String getExperience() { return experience; }
    public void setExperience(String experience) { this.experience = experience; }

    public List<String> getAvailability() { return availability; }
    public void setAvailability(List<String> availability) { this.availability = availability; }

    public String getStatus() { return status; }
    public void setStatus(String status) {
        this.status = status;
        this.updatedAt = LocalDateTime.now();
    }

    public Integer getHoursVolunteered() { return hoursVolunteered; }
    public void setHoursVolunteered(Integer hoursVolunteered) { this.hoursVolunteered = hoursVolunteered; }

    public String getEvent() { return event; }
    public void setEvent(String event) { this.event = event; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }

    @PreUpdate
    public void preUpdate() {
        this.updatedAt = LocalDateTime.now();
    }
}