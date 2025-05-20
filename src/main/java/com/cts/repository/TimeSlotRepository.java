package com.cts.repository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cts.model.Doctor;
import com.cts.model.TimeSlot;


@Repository
public interface TimeSlotRepository extends JpaRepository<TimeSlot, Integer> {
    List<TimeSlot> findByDoctor(Doctor doctor);

    @Query(value="SELECT * FROM time_slot WHERE doctor_id = :doctorId ORDER BY slot_date,slot_time", nativeQuery=true)
    List<TimeSlot> findByDoctorId(@Param("doctorId") Integer doctorId);
    
    @Query(value="SELECT * FROM time_slot WHERE doctor_id = :doctorId  AND is_booked = FALSE  AND CONCAT(slot_date, ' ', slot_time) >= NOW() ORDER BY slot_date, slot_time", nativeQuery=true)
    List<TimeSlot> findByDoctorIdNotBooked(@Param("doctorId") Integer doctorId);
    
    @Modifying
    @Transactional
    @Query(value="UPDATE time_slot SET is_booked = True WHERE slot_id= ?1",nativeQuery=true)
    public int bookSlot(Integer slotId);
    
    @Modifying
    @Transactional
    @Query(value="UPDATE time_slot SET is_booked = False WHERE slot_date =?1 AND slot_time = ?2",nativeQuery=true)
    public int unBookSlot(LocalDate slotDate,LocalTime slotTime);
    
    @Modifying
    @Transactional

    @Query(value = "UPDATE time_slot ts SET ts.is_booked = False WHERE EXISTS (SELECT 1 FROM appointment app WHERE app.appointment_date = ts.slot_date AND ts.slot_time = app.time_slot AND app.patient_id = ?1)", nativeQuery = true)
    public int unBookPatientSlots(Integer patientId);
}