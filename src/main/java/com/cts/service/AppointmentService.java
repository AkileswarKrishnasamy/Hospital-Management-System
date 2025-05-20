package com.cts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.cts.enums.Status;
import com.cts.model.Appointment;
import com.cts.repository.AppointmentRepository;
import com.cts.exception.AppointmentNotFoundException;

@Service
public class AppointmentService {
    @Autowired
    private AppointmentRepository repo;

    public Appointment saveAppointment(Appointment appointment) {
        try {
            return repo.save(appointment);
        } catch (DataIntegrityViolationException ex) {
            throw new RuntimeException("Data integrity violation: " + ex.getMessage());
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred "
            		+ "while saving the appointment: " + ex.getMessage());
        }
    }
    
    public Appointment getAppointmentById(Integer appointmentId) {
        try {
            Appointment appointment = repo.getById(appointmentId);
            if (appointment == null) {
                throw new AppointmentNotFoundException("No appointment found with the given ID");
            }
            return appointment;
        } catch (AppointmentNotFoundException ex) {
            throw ex;
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred "
            		+ "while fetching the appointment by ID: " + ex.getMessage());
        }
    }
    
    public List<Appointment> getAppointmentHistoryByPatientId(Integer patientId) {
        try {
            return repo.findByAppointmentHistoryPatientId(patientId);
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred "
            		+ "while fetching appointment history: " + ex.getMessage());
        }
    }

    public List<Appointment> getAppointmentsForMedicalHistoryUpdate(Integer doctorId) {
        try {
            return repo.findByDoctorIdAndStatus(Status.MEDICAL_HISTORY_UPDATE.name(), doctorId);
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred while "
            		+ "fetching appointments for medical history update: " + ex.getMessage());
        }
    }
    
    public List<Appointment> getUpcommingAppointmentsByDoctorId(Integer doctorId) {
        try {
            return repo.findUpcommingAppointmentsByDoctorId(doctorId);
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred "
            		+ "while fetching upcoming appointments: " + ex.getMessage());
        }
    }
    
    public boolean updateAppointmentStatusAsCompleted(Integer appointmentId){
        try {
            int rowAffected = repo.updateStatus(Status.COMPLETED.name(), appointmentId);
            if (rowAffected == 0) {
                throw new Exception("An unexpected error occurred");
            }
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred"
            		+ " while updating appointment status: " + ex.getMessage());
        }
        return true;
    }
    
    public void confirmedToMedicalHistoryUpdate() {
        try {
            repo.cnfMedHisUpdate();
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred "
            		+ "while confirming medical history update: " + ex.getMessage());
        }
    }
    
    public List<Appointment> getAllAppointments() {
        try {
            return repo.findAll();
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred "
            		+ "while fetching all appointments: " + ex.getMessage());
        }
    }

    public List<Appointment> getUpcommingAppointmentsByPatientId(Integer patientId) {
        try {
            return repo.findUpcommingAppointmentsByPatientId(patientId);
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error "
            		+ "occurred while fetching upcoming appointments by patient ID: " + ex.getMessage());
        }
    }
    
    public boolean updateAppointmentStatusAsCancelled(Integer appointmentId) {
        try {
            int rowAffected = repo.updateStatus(Status.CANCELLED.name(), appointmentId);
            return rowAffected > 0;
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred "
            		+ "while updating appointment status to cancelled: " + ex.getMessage());
        }
    }
    
    public List<Appointment> getCompletedAppointmentsByDoctorId(Integer doctorId){
        try {
            return repo.findCompletedAppointmentsByDoctorId(doctorId);
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred "
            		+ "while fetching completed appointments: " + ex.getMessage());
        }
    }
    
    public boolean deleteAppointmentsByDoctorId(int doctorId) {
    	try {
            int rowAffected = repo.deleteByDoctorId(doctorId);
            return rowAffected > 0;
        } catch (Exception ex) {
            throw new RuntimeException("An unexpected error occurred "
            		+ "while updating appointment status to cancelled: " + ex.getMessage());
        }
    }

    public List<Appointment> getAllAppointmentByDoctorId(Integer doctorId){
    	return repo.findAllByDoctorId(doctorId);
    }
    
    public void deleteAllAppointmentByDoctorId(Integer doctorId) {
    	repo.deleteByDoctorId(doctorId);
    }
    public void deleteAllAppointmentByPatientId(Integer patientId) {
    	repo.deleteByPatientId(patientId);
    }
    

}