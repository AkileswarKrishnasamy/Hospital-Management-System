package com.cts.exception;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

	
//	@ExceptionHandler(DuplicateUserException.class)
//	public ModelAndView duplicateUserException(DuplicateUserException ex) {
//		return new ModelAndView("AddDoctorForm","errorMessage",ex.getMessage());
//	}
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView runtimeException(RuntimeException ex) {
		return new ModelAndView("error","errorMessage",ex.getMessage());
	}
}
