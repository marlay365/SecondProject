package com.java.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.dto.PropertyOwner;
//import com.java.dto.User;
//import com.java.exception.DatabaseException;
//import com.java.exception.PasswordMismatch;
//import com.java.exception.UsernameNotFound;

@Repository
public interface PropertyOwnerRepository extends JpaRepository<PropertyOwner, Integer>{
	
	public PropertyOwner findByEmail(String email);
	public PropertyOwner findByEmailAndPassword(String email, String password); //throws PasswordMismatch, UsernameNotFound, DatabaseException;
	public PropertyOwner findById(int id);
	
}
