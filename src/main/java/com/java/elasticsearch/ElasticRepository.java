package com.java.elasticsearch;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.elasticsearch.ElasticsearchRepositoriesAutoConfiguration;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.transaction.annotation.Transactional;

import com.java.dto.HomeDetails;

@Transactional
public interface ElasticRepository extends ElasticsearchRepository<HomeDetails, Integer> {
	
	public List<HomeDetails> findByCityAndPropertyType(String city, String propertytype);
	
}
