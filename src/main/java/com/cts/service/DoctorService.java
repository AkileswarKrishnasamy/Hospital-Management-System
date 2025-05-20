package com.cts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.cts.exception.DoctorNotFoundException;
import com.cts.model.Doctor;
import com.cts.repository.DoctorRepository;

@Service
public class DoctorService {
		
	@Autowired
	DoctorRepository repo;
	
	public Doctor saveDoctor(Doctor doctor) {
		try {
			return repo.save(doctor);
		} catch (DataIntegrityViolationException ex) {
			throw new RuntimeException("Data integrity violation: " + ex.getMessage());
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while saving the doctor: " + ex.getMessage());
		}
	}
	
	public List<Doctor> getAllDoctors() {
		try {
			return repo.findAll();
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching all doctors: " + ex.getMessage());
		}
	}
	
	public Doctor getDoctorById(int doctorId) throws DoctorNotFoundException {
		try {
			Doctor doctor = repo.findById(doctorId);
			if (doctor == null) {
				throw new DoctorNotFoundException("No Doctor found with the given Doctor Id");
			}
			return doctor;
		} catch (DoctorNotFoundException ex) {
			throw ex;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching the doctor by ID: " + ex.getMessage());
		}
	}
	
	public Doctor getDoctorByUserId(int userId) {
		try {
			return repo.findByUserId(userId);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching the doctor by user ID: " + ex.getMessage());
		}
	}
	
	public Doctor updateDoctor(Doctor doctor) {
		try {
			return repo.save(doctor);
		} catch (DataIntegrityViolationException ex) {
			throw new RuntimeException("Data integrity violation: " + ex.getMessage());
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while updating the doctor: " + ex.getMessage());
		}
	}
	
	public void deleteDoctor(int doctorId) {
		try {
			repo.deleteById(doctorId);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while deleting the doctor: " + ex.getMessage());
		}
	}
}
