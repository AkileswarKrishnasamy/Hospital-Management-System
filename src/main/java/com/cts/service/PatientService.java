package com.cts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.cts.model.Appointment;
import com.cts.model.Patient;
import com.cts.repository.PatientRepository;

import jakarta.persistence.EntityManager;

import com.cts.exception.PatientNotFoundException;

@Service
public class PatientService {
	
	@Autowired
	private EntityManager entityManager;
	
	@Autowired
	PatientRepository repo;
	
	public Patient savePatient(Patient patient) {
		try {
			return repo.save(patient);
		} catch (DataIntegrityViolationException ex) {
			throw new RuntimeException("Data integrity violation: " + ex.getMessage());
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while saving the patient: " + ex.getMessage());
		}
	}
	
	public List<Patient> getAllPatients() {
		try {
			return repo.findAll();
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching all patients: " + ex.getMessage());
		}
	}
	
	public Patient getPatientById(int id) {
		try {
			Patient patient = repo.findById(id);
			if (patient == null) {
				throw new PatientNotFoundException("No Patient found with the given patient Id");
			}
			return patient;
		} catch (PatientNotFoundException ex) {
			throw ex;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching the patient by ID: " + ex.getMessage());
		}
	}
	
	public void deletePatient(int patientId) {
		try {
			repo.deleteById(patientId);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while deleting the patient: " + ex.getMessage());
		}
	}
	
	public Patient getPatientByUserId(int userId) {
		try {
			Patient patient = repo.findByUserId(userId);
			if (patient == null) {
				throw new PatientNotFoundException("No Patient found with the given user Id");
			}
			return patient;
		} catch (PatientNotFoundException ex) {
			throw ex;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching the patient by user ID: " + ex.getMessage());
		}
	}
	
	public boolean updatePatientMedicalHistory(Integer patientId, String medicalHistory) {
		try {
			int rowAffected = repo.updateMedicalHistory(medicalHistory, patientId);
			return rowAffected > 0;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred while updating the patient's medical history: " + ex.getMessage());
		}
	}
}
