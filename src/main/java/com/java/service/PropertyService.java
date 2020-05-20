package com.java.service;

import java.util.List;

import com.java.dto.HomeDetails;
import com.java.dto.PropertyOwner;

public interface PropertyService {
	public HomeDetails registerProperty(HomeDetails houseDet);
	public List<HomeDetails> getPropertyDetails(String city, String propType, String availability, String bedrooms,
	Double range1, Double range2);
	//public HomeDetails getPropertyDetailsbyId(int id);
	public List<HomeDetails> getMyProperties(int id);
	public List<HomeDetails> getPropertyDetails(String city, String propType, String availability, String bedrooms,
			String range1, String range2);
}
