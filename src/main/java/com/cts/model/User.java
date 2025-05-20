package com.cts.model;



import com.cts.enums.UserRole;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;


@Entity
@Table(name="user")
public class User {
		@Id
	    @GeneratedValue(strategy=GenerationType.IDENTITY)
	    @Column(name="user_id")
	    private Integer userId;
	    
//	    @Pattern(regexp = "^[a-zA-Z0-9._-]{3,}$", message = "Username must be at least 3 characters long and contain only letters, "
//	    		+ "numbers, dots, underscores, or hyphens")
	    @Column(name="user_name",nullable=false,unique=true,length=50)
	    private String userName;
	    
//	    @NotNull(message = "Email cannot be null")
//	    @Email(message="enter a valid email")
	    @Column(name="email",nullable=false,unique=true,length=50)
	    private String email;
//	    
//	    @NotNull(message = "Password cannot be null")
//	    @Size(min = 8, max = 255)
	    @Column(name="password",nullable=false,length=255)
	    private String password;
	    
	    @Transient
	    private String confirmPassword;
	    
//	    @NotNull(message = "User role cannot be null")
	    @Enumerated(EnumType.STRING)
	    @Column(name="user_role",nullable=false)
	    private UserRole userRole;
	    
	    @OneToOne(mappedBy = "user" , cascade = CascadeType.ALL,orphanRemoval = true)
//	    @Valid
	    private Doctor doctor;
	    
	    @OneToOne(mappedBy = "user" , cascade = CascadeType.ALL,orphanRemoval = true)
//	    @Valid
	    private Patient patient;
	
	

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Integer getUserId() {
		return userId;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}
}
