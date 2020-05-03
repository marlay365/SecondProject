package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.PropertyOwnerRepository;
import com.java.dto.PropertyOwner;

@Service
public class UserAuthenticateServImpl implements UserAuthenticationService {

	@Autowired
	PropertyOwnerRepository pOwnRepo;
	
	@Override
	public boolean registerNewUser(PropertyOwner user) {
		PropertyOwner owner = pOwnRepo.findByEmail(user.getEmail());
		if(owner == null) {
			pOwnRepo.save(user);
			return true;
		}
		return false;
	}

	@Override
	public PropertyOwner authenticateUser(PropertyOwner user) {
		PropertyOwner existingOwner = pOwnRepo.findByEmailAndPassword(user.getEmail(), user.getPassword());
		return existingOwner;
	}

	@Override
	public PropertyOwner getProfile(int id) {
		PropertyOwner obj = pOwnRepo.findById(id);
		return obj;
	}

}
