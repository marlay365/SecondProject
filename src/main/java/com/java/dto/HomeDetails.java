package com.java.dto;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OrderColumn;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Document(indexName = "propertydetails", type = "properties")
public class HomeDetails {
	
	@Id
	@GeneratedValue
	int id;
	@NotEmpty(message = "Please select owner type")
	String ownerType;
	String listing;
	@NotEmpty(message = "Please select a property type")
	String propertyType;
	@NotEmpty(message = "Please enter a address")
	String address;
	@NotEmpty(message = "Please enter a city")
	@Field(type = FieldType.Text, analyzer="customanalyzer", searchAnalyzer="searchanalyzer")
	String city;
	String state;
	@NotEmpty(message = "Please enter a valid zipcode")
	@Pattern(regexp = "^[0-9]+$")
	String zipcode;
	Double squareFootage;
	String bedrooms;
	String bathrooms;
	String floorsNum;
	String furnished;
	String availability;
	String ownershipType;
	Double price;
	@Field(type = FieldType.Date)
	Date datePosted;
	@ElementCollection
	@OrderColumn
	List<String> amenities;
	@NotEmpty(message = "Please enter a description for property")
	@Field(type = FieldType.Text, analyzer="customanalyzer", searchAnalyzer="searchanalyzer")
	String description;
	@ManyToOne
	@Field(type = FieldType.Nested, includeInParent = true)
	PropertyOwner owner;
}
