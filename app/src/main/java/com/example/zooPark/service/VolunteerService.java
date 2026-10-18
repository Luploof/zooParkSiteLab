package com.example.zooPark.service;

import com.example.zooPark.model.VolunteerApplication;
import com.example.zooPark.repository.VolunteerRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VolunteerService {

    private final VolunteerRepository volunteerRepository;

    public VolunteerService(VolunteerRepository volunteerRepository) {
        this.volunteerRepository = volunteerRepository;
    }

    public void saveApplication(VolunteerApplication application) {
        volunteerRepository.save(application);
    }

    public int getVolunteerCount() {
        return volunteerRepository.countApprovedApplications();
    }

    public int getTotalVolunteerHours() {
        return volunteerRepository.sumVolunteerHours();
    }

    public int getEventsCount() {
        return volunteerRepository.countEvents();
    }

    public List<VolunteerApplication> getAllApplications() {
        return volunteerRepository.findAll();
    }

    public VolunteerApplication getApplicationById(Long id) {
        return volunteerRepository.findById(id).orElse(null);
    }

    public void updateApplicationStatus(Long id, String status) {
        VolunteerApplication application = volunteerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Заявка не найдена"));
        application.setStatus(status);
        volunteerRepository.save(application);
    }
}