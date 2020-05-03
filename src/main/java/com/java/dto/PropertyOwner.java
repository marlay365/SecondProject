package com.java.dto;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@DynamicUpdate
public class PropertyOwner {

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
	
}
