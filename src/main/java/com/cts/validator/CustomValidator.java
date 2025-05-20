package com.cts.validator;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;


import com.cts.model.User;
import com.cts.service.UserService;

@Component
public class CustomValidator {
	
	
	@Autowired
	private  UserService userService;
	
	
	public void validateNewUserAndPatient(User user,BindingResult result) {
		this.validateUsername(user.getUserName(),result);
		this.validatePassword(user.getPassword(),user.getConfirmPassword(),result);
		this.validateEmail(user.getEmail(),result);
		this.validatePatientName(user.getPatient().getPatientName(),result);
		this.validateMedicalHistory(user.getPatient().getMedicalHistory(), result);
		this.validateContactNumber(user.getPatient().getContactNumber(), result);
		this.validateDateOfBirth(user.getPatient().getDateOfBirth().toString(), result);
		this.validateAddress(user.getPatient().getAddress(), result);
	}
	
	
	public void validateNewUserAndDoctor(User user,BindingResult result) {
		this.validateUsername(user.getUserName(),result);
		this.validatePassword(user.getPassword(),user.getConfirmPassword(),result);
		this.validateEmail(user.getEmail(),result);
		this.validateDoctorName(user.getDoctor().getDoctorName(), result);
		this.validateDoctorSpecialization(user.getDoctor().getSpecialization(), result);
		this.validateDoctorContactNumber(user.getDoctor().getContactNumber(), result);
		this.validateAvailabilitySchedule(user.getDoctor().getAvailabilitySchedule(), result);
	}
	
	public  void validateUsername(String username, BindingResult result) {
        if (username == null || username.isEmpty()) {
            result.rejectValue("username", "error.username", "Username cannot be empty");
        }
        else if(userService.getUserbyUserName(username)!=null) {        	
        	result.rejectValue("username", "error.username", "Username is already taken");
        }
    }

    public  void validatePassword(String password, String confirmPassword, BindingResult result) {
        if (password == null || password.isEmpty()) {
            result.rejectValue("password", "error.password", "Password cannot be empty");
        } else if (!password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$")) {
            result.rejectValue("password", "error.password", "Password must be at least 8 characters long and include a digit, a lowercase letter, and an uppercase letter");
        }
        if (confirmPassword == null || confirmPassword.isEmpty()) {
            result.rejectValue("confirmPassword", "error.confirmPassword", "Confirm password cannot be empty");
        } else if (!password.equals(confirmPassword)) {
            result.rejectValue("confirmPassword", "error.confirmPassword", "Passwords do not match");
        }
    }

    public  void validateEmail(String email, BindingResult result) {
        if (email == null || email.isEmpty()) {
            result.rejectValue("email", "error.email", "Email cannot be empty");
        }else if(userService.getUserbyEmail(email)!=null) {
        	result.rejectValue("email", "user.email","Email Id already Exists");
        }
        else{
            String emailPattern = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
            if (!Pattern.matches(emailPattern, email)) {
                result.rejectValue("email", "error.email", "Invalid email format");
            }
        }
    }


    public  void validatePatientName(String patientName, BindingResult result) {
        if (patientName == null || patientName.isEmpty()) {
            result.rejectValue("patient.patientName", "error.patient.patientName", "Patient name cannot be empty");
        }
    }

    public void validateDateOfBirth(String dateOfBirth, BindingResult result) {
        System.out.println(dateOfBirth + " inside the custom validator");
        if (dateOfBirth == null || dateOfBirth.isEmpty()) {
            result.rejectValue("patient.dateOfBirth", "error.patient.dateOfBirth", "Date of birth cannot be empty");
        } else {
            try {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss zzz yyyy");
                LocalDate dob = LocalDate.parse(dateOfBirth, formatter);
                if (dob.isAfter(LocalDate.now())) {
                    result.rejectValue("patient.dateOfBirth", "error.patient.dateOfBirth", "Date of birth must be in the past");
                }
            } catch (DateTimeParseException e) {
                System.out.println("there is an error");
            }
        }
    }


    public  void validateAddress(String address, BindingResult result) {
        if (address == null || address.isEmpty()) {
            result.rejectValue("patient.address", "error.patient.address", "Address cannot be empty");
        }
    }

    public  void validateContactNumber(String contactNumber, BindingResult result) {
        if (contactNumber == null || contactNumber.isEmpty()) {
            result.rejectValue("patient.contactNumber", "error.patient.contactNumber", "Contact number cannot be empty");
        } else if (!contactNumber.matches("\\d{10}")) {
            result.rejectValue("patient.contactNumber", "error.patient.contactNumber", "Contact number must be exactly 10 digits");
        }
    }

    public  void validateMedicalHistory(String medicalHistory, BindingResult result) {
        if (medicalHistory == null || medicalHistory.isEmpty()) {
            result.rejectValue("patient.medicalHistory", "error.patient.medicalHistory", "Medical history cannot be empty");
        }	
    }
    
    
    public  void validateDoctorName(String doctorName, BindingResult result) {
        if (doctorName == null || doctorName.isEmpty()) {
            result.rejectValue("doctor.doctorName", "error.doctor.doctorName", "Doctor name cannot be empty");
        }
    }
    
    public  void validateDoctorSpecialization(String specialization, BindingResult result) {
    	if (specialization == null || specialization.isEmpty()) {
    		result.rejectValue("doctor.doctorName", "error.doctor.doctorName", "Doctor specialization cannot be empty");
    	}
    }
    
    public  void validateDoctorContactNumber(String contactNumber, BindingResult result) {
        if (contactNumber == null || contactNumber.isEmpty()) {
            result.rejectValue("doctor.contactNumber", "error.doctor.contactNumber", "Contact number cannot be empty");
        } else if (!contactNumber.matches("\\d{10}")) {
            result.rejectValue("doctor.contactNumber", "error.doctor.contactNumber", "Contact number must be exactly 10 digits");
        }
    }
    public void validateAvailabilitySchedule(String availabilitySchedule,BindingResult result) {
    	if(availabilitySchedule==null || availabilitySchedule.isEmpty()) {
    		result.rejectValue("doctor.availabilitySchedule", "error.doctor.availabilitySchedule","Availability Schedule cannot be empty");
    	}
    	String time[] = availabilitySchedule.split("-");
    	String startTimeStr = time[0];
    	String endTimeStr = time[1];
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
        LocalTime startTime = LocalTime.parse(startTimeStr, timeFormatter);
        LocalTime endTime = LocalTime.parse(endTimeStr, timeFormatter);
        
        if (startTime.getMinute() != 0 || endTime.getMinute() != 0) {
            result.rejectValue("doctor.availabilitySchedule", "error.doctor.availabilitySchedule", "Times must be rounded to the hour.");
        }
        if (startTime.isAfter(endTime) || startTime.equals(endTime)) {
            result.rejectValue("doctor.availabilitySchedule", "error.doctor.availabilitySchedule", "Start time must be before end time.");
        }
    }
    
 
    
}
