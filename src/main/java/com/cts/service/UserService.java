package com.cts.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.cts.exception.DuplicateUserException;
import com.cts.exception.UserNotFoundException;
import com.cts.model.User;
import com.cts.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository repo;
	
	public User getUserbyUserName(String userName) throws UserNotFoundException {
		try {
			return repo.findByUserName(userName);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching the user by username: " + ex.getMessage());
		}
	}
	
	public User getUserbyUserId(int userId) throws UserNotFoundException {
		try {
			return repo.findByUserId(userId);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching the user by ID: " + ex.getMessage());
		}
	}
	public User getUserbyEmail(String email) throws UserNotFoundException {
		try {
			return repo.findByEmail(email);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while fetching the user by ID: " + ex.getMessage());
		}
	}
	
	public User saveUser(User user) throws DuplicateUserException {
		try {
			return repo.save(user);
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while saving the user: " + ex.getMessage());
		}
	}
	
	public boolean changeUserPassword(String password, String username) throws Exception{
		try {
			int rowsChanged = repo.changePassword(password, username);
			if (rowsChanged == 0) {
				throw new Exception("An unexpected error occurred");
			}
			return true;
		} catch (Exception ex) {
			throw new RuntimeException("An unexpected error occurred "
					+ "while changing the user password: " + ex.getMessage());
		}
	}
}