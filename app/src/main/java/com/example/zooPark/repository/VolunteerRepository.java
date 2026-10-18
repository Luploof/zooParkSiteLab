package com.example.zooPark.repository;

import com.example.zooPark.model.VolunteerApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VolunteerRepository extends JpaRepository<VolunteerApplication, Long> {

    List<VolunteerApplication> findByStatus(String status);

    @Query("SELECT COUNT(v) FROM VolunteerApplication v WHERE v.status = 'APPROVED'")
    int countApprovedApplications();

    @Query("SELECT COALESCE(SUM(v.hoursVolunteered), 0) FROM VolunteerApplication v WHERE v.status = 'APPROVED'")
    int sumVolunteerHours();

    @Query("SELECT COUNT(DISTINCT v.event) FROM VolunteerApplication v WHERE v.event IS NOT NULL")
    int countEvents();
}