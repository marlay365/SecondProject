package com.java.service;

import java.util.List;
import java.util.Optional;

import com.java.dto.HomeDetails;

public interface ElasticSearchService {
	public void saveElasticDetails(HomeDetails h);
	public List<HomeDetails> getPropertiesByCityAndPropertyType(String city, String propertyType);
	public List<HomeDetails> multimatchquery(String input);
}
