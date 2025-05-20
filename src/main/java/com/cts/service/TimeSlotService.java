package com.cts.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.cts.model.Doctor;
import com.cts.model.TimeSlot;
import com.cts.repository.TimeSlotRepository;
import com.cts.exception.TimeSlotNotFoundException;

@Service
public class TimeSlotService {
	
	@Autowired
	private TimeSlotRepository repo;
	
	public TimeSlot getTimeSlotById(Integer slotId) {
		try {
			TimeSlot timeSlot = repo.getById(slotId);
			if (timeSlot == null) {
				throw new TimeSlotNotFoundException("No TimeSlot found with the given ID");
			}
			return timeSlot;
		} catch (TimeSlotNotFoundException ex) {
			throw ex;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching the time slot by ID: " + ex.getMessage());
		}
	}
	
	public List<TimeSlot> saveAllSlots(List<TimeSlot> slots) {
		try {
			return repo.saveAll(slots);
		} catch (DataIntegrityViolationException ex) {
			throw new RuntimeException("Data integrity violation: " + ex.getMessage());
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while saving the time slots: " + ex.getMessage());
		}
	}
	
	public List<TimeSlot> getAllSlotsOfDoctor(Doctor doctor) {
		try {
			return repo.findByDoctor(doctor);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching time slots for the doctor: " + ex.getMessage());
		}
	}
	
	public List<TimeSlot> getAllSlotsOfDoctorById(Integer doctorId) {
		try {
			return repo.findByDoctorId(doctorId);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching time slots by doctor ID: " + ex.getMessage());
		}
	}
	
	public List<TimeSlot> getAllSlots() {
		try {
			return repo.findAll();
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching all time slots: " + ex.getMessage());
		}
	}
	
	public List<TimeSlot> getAllUnBookedSlotsOfDoctor(Integer doctorId) {
		try {
			return repo.findByDoctorIdNotBooked(doctorId);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching unbooked time slots for the doctor: " + ex.getMessage());
		}
	}
	
	public boolean bookSlot(Integer slotId) {
		try {
			int rowsAffected = repo.bookSlot(slotId);
			return rowsAffected == 1;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while booking the time slot: " + ex.getMessage());
		}
	}
	
	public boolean unBookSlot(LocalDate slotDate, LocalTime slotTime) {
		try {
			int rowsAffected = repo.unBookSlot(slotDate, slotTime);
			return rowsAffected == 1;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while unbooking the time slot: " + ex.getMessage());
		}
	}
	
	public void unBookSlotsOfPatientByPatientId(Integer patientId) {
		repo.unBookPatientSlots(patientId);
	}
}
