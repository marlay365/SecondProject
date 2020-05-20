package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.java.dao.PropertyOwnerRepository;
import com.java.dto.PropertyOwner;

@Service
public class MyUserDetailsService implements UserDetailsService {

	@Autowired PropertyOwnerRepository repo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		PropertyOwner obj = repo.findByEmail(username);
		if(obj == null) {
			throw new UsernameNotFoundException("Incorrect username and/or password");
		}
		return obj;
	}

}
