package com.java.dto;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.DynamicUpdate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@DynamicUpdate
public class PropertyOwner implements UserDetails{
	
	@Id 
	@GeneratedValue
	@Column(name = "id")
	int id;
	@Column(name = "fullname")
	@NotEmpty(message = "Name cannot be empty.")
	String fullname;
	@Column(name = "phoneNum")
	@Pattern(regexp="^[1-9][0-9]{9,}$", message="Please enter a valid phone number.")
	String phoneNum;
	@Column(name = "address")
	@NotEmpty(message = "Address cannot be empty.")
	String address;
	@Column(name = "email")
	@Email(message = "Enter valid a valid email.")
	String email;
	@Column(name = "password")
	@Pattern(regexp="^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$", message="Password must contain at least one number and one letter")
	String password;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return Collections.singleton(new SimpleGrantedAuthority("USER"));
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	@Override
	public String getUsername() {
		return email;
	}
	
}
