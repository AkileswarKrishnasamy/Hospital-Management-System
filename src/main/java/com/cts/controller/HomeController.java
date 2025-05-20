package com.cts.controller;

import java.sql.Date;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cts.enums.UserRole;
import com.cts.exception.DuplicateUserException;
import com.cts.model.CustomUserDetails;
import com.cts.model.Patient;
import com.cts.model.User;
import com.cts.service.UserService;
import com.cts.validator.CustomValidator;

import jakarta.validation.Valid;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private CustomValidator validator;

	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/unauthorizedaccess")
	public String getUnauthorizedAccess(){
		return "AccessDenied";
	}
	@GetMapping("/login")
	public String getLoginForm() {
		
		return "UserLoginForm";
	}
	@GetMapping("/logout")
	public String getLogout(){
		return "UserLoginForm";
	}
	@GetMapping("/changePassword")
	public String changePatientPassword(ModelMap model) {
		return "ChangePasswordForm";
	}
	
	@PostMapping("/changePassword/changePasswordAction")
	public String changePasswordAction(@RequestParam("currentPassword") String password,
									   @RequestParam("newPassword") String newPassword,
									   @RequestParam("confirmPassword") String confirmPassword,
									   Authentication auth,ModelMap model
									   ) {
		CustomUserDetails authUser = (CustomUserDetails) auth.getPrincipal();
		User user = userService.getUserbyUserId(authUser.getUserId());
		String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$";
		if(!newPassword.equals(confirmPassword)) {
			model.addAttribute("error","new password doesnot match with confirm password");
			return "ChangePasswordForm";
		}
		else if(!newPassword.matches(regex)) {
			model.addAttribute("error","Password must be at least 8 characters long and include a digit, a lowercase letter, and an uppercase letter");
			return "ChangePasswordForm";
		}
		else if(!user.getPassword().equals(password)) {
			model.addAttribute("error","Your current password is invalid");
			return "ChangePasswordForm";
		}
		try {
			userService.changeUserPassword(newPassword, user.getUserName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("role",user.getUserRole().name().toLowerCase());
		return "success";
	}
	
	@GetMapping("/register")
	public String getRegisterPatientForm(ModelMap model){
		model.addAttribute("user",new User());
		return "RegisterYourselfAsPatientForm";
	}
	
	
	@PostMapping("/register/addPatient")
	public String validateNewPatient(
            @ModelAttribute("user")@Valid User user,BindingResult bs,
            Model model) {
        
    	validator.validateNewUserAndPatient(user, bs);
        if(bs.hasErrors()) {
        	return "RegisterYourselfAsPatientForm";
        }
      
        Patient patient = user.getPatient();
        patient.setUser(user);
        userService.saveUser(user);         
       return "redirect:/login";
    }
	
	@GetMapping("/error")
	public String error() {
		return "error";
	}
}
