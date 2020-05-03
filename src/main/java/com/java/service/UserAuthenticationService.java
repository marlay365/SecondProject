package com.java.service;

import com.java.dto.PropertyOwner;
//import com.java.exception.DatabaseException;
//import com.java.exception.PasswordMismatch;
//import com.java.exception.UsernameNotFound;

public interface UserAuthenticationService {

	boolean registerNewUser(PropertyOwner user); // throws DatabaseException;
	PropertyOwner authenticateUser(PropertyOwner user); //throws PasswordMismatch, UsernameNotFound, DatabaseException;
	public PropertyOwner getProfile(int id);
}
