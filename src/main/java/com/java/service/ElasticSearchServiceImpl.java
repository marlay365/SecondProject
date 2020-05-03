package com.java.service;

import java.util.List;
import java.util.Optional;

import org.elasticsearch.common.unit.Fuzziness;
import org.elasticsearch.index.query.MultiMatchQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.data.elasticsearch.core.query.SearchQuery;
import org.springframework.stereotype.Service;

import com.java.dto.HomeDetails;
import com.java.elasticsearch.ElasticRepository;


@Service
public class ElasticSearchServiceImpl implements ElasticSearchService {

	@Autowired ElasticRepository repo;
	@Autowired ElasticsearchTemplate temp;
	
	@Override
	public void saveElasticDetails(HomeDetails h) {
		repo.save(h);
	}
//	@Override
//	public Optional<List<HomeDetails>> getProperties(String keyword){
//		return null;
//	}

	@Override
	public List<HomeDetails> getPropertiesByCityAndPropertyType(String city, String propertyType) {
		return repo.findByCityAndPropertyType(city, propertyType);
	}
	
	@Override
	public List<HomeDetails> multimatchquery(String input){
		SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(QueryBuilders.multiMatchQuery(input)
				.field("propertyType").field("city").field("bedrooms").field("furnished").field("availability")
				.field("description").type(MultiMatchQueryBuilder.Type.BEST_FIELDS)).build();
		List<HomeDetails> list = temp.queryForList(searchQuery, HomeDetails.class);
		return list;
	}

}
