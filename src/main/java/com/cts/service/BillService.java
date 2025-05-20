package com.cts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.cts.enums.PaymentStatus;
import com.cts.model.Bill;
import com.cts.model.Patient;
import com.cts.repository.BillRepostiory;
import com.cts.exception.BillNotFoundException;

@Service
public class BillService {
	
	@Autowired
	private BillRepostiory repo;
	
	public Bill saveBill(Bill bill) {
		try {
			return repo.save(bill);
		} catch (DataIntegrityViolationException ex) {
			throw new RuntimeException("Data integrity violation: " + ex.getMessage());
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while saving the bill: " + ex.getMessage());
		}
	}
	
	public List<Bill> getAllBills() {
		try {
			return repo.findAll();
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching all bills: " + ex.getMessage());
		}
	}

	public List<Bill> getAllBillsOfPatient(Patient patient) {
		try {
			return repo.findByPatient(patient);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
				+"while fetching bills for the patient: " + ex.getMessage());
		}
	}
	
	public boolean updatePaymentStatusAsPaid(Integer billId) {
		try {
			int rowsAffected = repo.updatePaymentStatus(billId, PaymentStatus.PAID.name());
			return rowsAffected > 0;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while updating payment status: " + ex.getMessage());
		}
	}
	
	public Bill getBillbyId(Integer billId) {
		try {
			Bill bill = repo.getById(billId);
			if (bill == null) {
				throw new BillNotFoundException("No bill found with the given ID");
			}
			return bill;
		} catch (BillNotFoundException ex) {
			throw ex;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching the bill by ID: " + ex.getMessage());
		}
	}
	
	public void deleteBillsByPatientId(Integer patientId) {
		repo.deleteByPatientId(patientId);
	}
	
	public void deleteBillsByAppointmentDoctorId(Integer doctorId) {
		repo.deleteByDoctorIdFromAppointment(doctorId);
	}
}