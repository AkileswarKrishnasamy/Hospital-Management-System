package com.cts.controller;



import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cts.enums.UserRole;
import com.cts.model.Appointment;
import com.cts.model.Bill;
import com.cts.model.CustomUserDetails;
import com.cts.model.Doctor;
import com.cts.model.Patient;
import com.cts.model.User;
import com.cts.service.AppointmentService;
import com.cts.service.BillService;
import com.cts.service.DoctorService;
import com.cts.service.PatientService;
import com.cts.service.TimeSlotService;
import com.cts.service.UserService;
import com.cts.validator.CustomValidator;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private DoctorService doctorService;
	@Autowired
    private PatientService patientService;
	@Autowired
	private AppointmentService appointmentService;
	@Autowired
	private BillService billService;
	@Autowired
	private TimeSlotService timeSlotService;
	@Autowired
	private CustomValidator validator;
	
	
	@ModelAttribute("adminName")
	public String getAdministratorName(Authentication auth) {
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		return user.getUsername();
	}
	
	@GetMapping
	public String getAdminDashboard() {
		return "AdminDashboard";
	}
	
	@GetMapping("/addAdmin")
	public String getAddAdminForm(ModelMap model) {
		model.addAttribute("user",new User());
		return "AddAdminForm";
	}	
	@PostMapping("/addAdmin/add")
	public String addAdmin(@ModelAttribute("user") @Valid User user,BindingResult bs,
							ModelMap model) {
		
		if(userService.getUserbyUserName(user.getUserName())!=null) {
			bs.rejectValue("userName","error.userName","Username already taken");
		}
		if(bs.hasErrors()) {
			return "AddAdminForm";
		}
		userService.saveUser(user);
		
		return "redirect:/admin";
		
	}
	
	@GetMapping("/manageDoctors")
	public String getManageDoctorsPage(HttpSession session,ModelMap model) {
		List<Doctor> doctors = doctorService.getAllDoctors();
		model.addAttribute("doctors",doctors);
		return "ManageDoctors";
	}
	
	@GetMapping("/manageDoctors/addDoctor")
	public String getAddDoctorsPage(ModelMap model) {
		model.addAttribute("user",new User());
		return "AddDoctorForm";
	}
	
	
	@PostMapping("manageDoctors/addDoctor/validateNewDoctor")
    public String validateNewDoctor(@ModelAttribute("user") @Valid User user,BindingResult bs,
    		@RequestParam("startTime") String startTime,
    		@RequestParam("endTime") String endTime){
		
		String schedule = startTime+"-"+endTime;
		Doctor doctor = user.getDoctor();
		doctor.setAvailabilitySchedule(schedule);
		validator.validateNewUserAndDoctor(user, bs);
		if(bs.hasErrors()) {
			return "AddDoctorForm";
		}
		
		doctor.setUser(user);
		userService.saveUser(user);
			
		return "redirect:/admin/manageDoctors";
		
	}
	@GetMapping("/manageDoctors/updateDoctor/{id}")
	public String getAddDoctorsPage(@PathVariable int id,HttpSession session,ModelMap model) {
		Doctor updateDoctor = doctorService.getDoctorById(id);
		model.addAttribute("doctor",updateDoctor);
		return "UpdateDoctorForm";
	}
	
	@PostMapping("/manageDoctors/updateDoctor")
	public String updateDoctor(@ModelAttribute("doctor") @Valid Doctor doctor,
	                           BindingResult rs) {
	    System.out.println("Entering updateDoctor method");

	    if (rs.hasErrors()) {
	        System.out.println(rs.getAllErrors());
	        return "UpdateDoctorForm";
	    }

	    Doctor existingDoctor = doctorService.getDoctorById(doctor.getDoctorId());
	    if (existingDoctor != null) {
	        existingDoctor.setDoctorName(doctor.getDoctorName());
	        existingDoctor.setSpecialization(doctor.getSpecialization());
	        existingDoctor.setAvailabilitySchedule(doctor.getAvailabilitySchedule());
	        existingDoctor.setContactNumber(doctor.getContactNumber());
	        System.out.println("Updated Doctor: " + existingDoctor);
	        doctorService.saveDoctor(existingDoctor);
	    } else {
	        System.out.println("Doctor not found with ID: " + doctor.getDoctorId());
	    }

	    return "redirect:/admin/manageDoctors";
	}
    
    @GetMapping("/manageDoctors/deleteDoctor/{id}")
    public String deleteDoctor(@PathVariable int id) {
    	billService.deleteBillsByAppointmentDoctorId(id);
    	appointmentService.deleteAllAppointmentByDoctorId(id);
    	doctorService.deleteDoctor(id);  	
    	return "redirect:/admin/manageDoctors";
    }

    

	@GetMapping("/managePatients")
    public String getManagePatientsPage(HttpSession session, ModelMap model) {
        List<Patient> patients = patientService.getAllPatients();
        model.addAttribute("patients", patients);
        return "ManagePatients";
    }
    
    @GetMapping("/managePatients/addPatient")
    public String getAddPatientsPage(HttpSession session,ModelMap model) {
    	model.addAttribute("user",new User());
        return "AddPatientForm";
    }
    
    @PostMapping("/managePatients/addPatient/validateNewPatient")
    public String validateNewPatient(
            @ModelAttribute("user")@Valid User user,BindingResult bs,
            Model model) {
        
    	validator.validateNewUserAndPatient(user, bs);
        if(bs.hasErrors()) {
        	return "AddPatientForm";
        }
      
        Patient patient = user.getPatient();
        patient.setUser(user);
        userService.saveUser(user);
        
        
        return "redirect:/admin/managePatients";
    }
    @GetMapping("/managePatients/updatePatient/{id}")
    public String getUpdatePatientsPage(@PathVariable int id, HttpSession session, ModelMap model) {
        Patient updatePatient = patientService.getPatientById(id);
        model.addAttribute("patient", updatePatient);
        return "UpdatePatientForm";
    }
    
    @PostMapping("/managePatients/updatePatient")
    public String updatePatient(@ModelAttribute("patient") @Valid Patient patient,
    							BindingResult Bs) {
    	Patient existingPatient = patientService.getPatientById(patient.getPatientId());
    	existingPatient.setPatientName(patient.getPatientName());
    	existingPatient.setDateOfBirth(patient.getDateOfBirth());
    	existingPatient.setGender(patient.getGender());
    	existingPatient.setContactNumber(patient.getContactNumber());
    	existingPatient.setAddress(patient.getAddress());
    	existingPatient.setMedicalHistory(patient.getMedicalHistory());
    	
    	
        patientService.savePatient(existingPatient);
        
        return "redirect:/admin/managePatients";
    } 
    
    
    @GetMapping("/managePatients/deletePatient/{id}")
    public String deletePatient(@PathVariable int id) {
    	billService.deleteBillsByPatientId(id);
    	appointmentService.deleteAllAppointmentByPatientId(id);
    	timeSlotService.unBookSlotsOfPatientByPatientId(id);
    	patientService.deletePatient(id);  	
    	return "redirect:/admin/managePatients";
    }
    
    @GetMapping("/manageAppointments")
    public String getManageAppointments(ModelMap model) {
    	List<Appointment> appointments = appointmentService.getAllAppointments();
    	model.addAttribute("appointments",appointments);
    	return "ManageAppointments";
    }
	
    @GetMapping("/manageBills")
    public String manageBills(Model model) {
    	List<Bill> bills = billService.getAllBills();
    	model.addAttribute("bills",bills);
    	return "ManageBills";
    	
    }
    @PostMapping("/manageBills/updatePaymentStatus")
    public String manageBills(@RequestParam("billId") Integer billId,ModelMap model) {
    	boolean isUpdated = billService.updatePaymentStatusAsPaid(billId);
    	if(isUpdated) {
    		return "redirect:/admin/manageBills";
    	}
    	return "error";
    }

}
