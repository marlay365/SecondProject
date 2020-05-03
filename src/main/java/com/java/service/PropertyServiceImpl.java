package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.java.dao.HomeRepository;
import com.java.dto.HomeDetails;
import com.java.dto.PropertyOwner;

@Service
public class PropertyServiceImpl implements PropertyService {

	@Autowired
	private HomeRepository newProperty;

	@Override
	public int registerProperty(HomeDetails houseDet) {
		newProperty.save(houseDet);
		return 1;
	}

	@Override
	public List<HomeDetails> getPropertyDetails(String city, String propType, String availability, String bedrooms,
		Double range1, Double range2) {
		List<HomeDetails> list = newProperty.findByCityAndPropertyTypeAndBedroomsAndAvailabilityAndPrice(city, propType, availability, bedrooms, range1, range2);
		if(list == null) {
			return null;
		}
		return list;
	}
//
//	@Override
//	public HomeDetails getPropertyDetailsbyId(int id) {
//		HomeDetails obj = newProperty.getPropertyDetailsbyId(id);
//		return obj;
//	}
//
	@Override
	public List<HomeDetails> getMyProperties(int id) {
		return newProperty.findByOwnerId(id);
	}

	@Override
	public List<HomeDetails> getPropertyDetails(String city, String propType, String availability, String bedrooms,
			String range1, String range2) {
		List<HomeDetails> list = newProperty.findByCityAndPropertyTypeAndBedroomsAndAvailabilityAndPrice(city, propType, availability, bedrooms, range1, range2);
		if(list == null) {
			return null;
		}
		return list;
	}

}
