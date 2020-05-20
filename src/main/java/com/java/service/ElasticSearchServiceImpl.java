package com.java.service;

import java.util.List;
import java.util.Optional;

import org.elasticsearch.common.unit.Fuzziness;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.MultiMatchQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder.Field;
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

	@Override
	public List<HomeDetails> getPropertiesByCityAndPropertyType(String city, String propertyType) {
		return repo.findByCityAndPropertyType(city, propertyType);
	}
	
	@Override
	public List<HomeDetails> multimatchquery(InputService s){
		
		BoolQueryBuilder qb = QueryBuilders.boolQuery();
		
		qb.must(QueryBuilders.matchQuery("city", s.getCity()))
		.must(QueryBuilders.matchQuery("propertyType", s.getPropType()))
		.should(QueryBuilders.matchPhraseQuery("description", s.getCity()));
		
		if(s.getBedrooms()!=null && s.getBedrooms().trim().length()>0)
			qb.filter(QueryBuilders.matchQuery("bedrooms", s.getBedrooms()));
		
		if(s.getAvailability() !=null && s.getAvailability().trim().length()>0)
			qb.filter(QueryBuilders.matchQuery("availability", s.getAvailability()));
		
		if(s.getRange1() != 0 && s.getRange2() != 0)
			qb.filter(QueryBuilders.rangeQuery("price").gte(s.range1).lte(s.range2));
		
		Field[] fields = new Field[4];
		fields[0] = new Field("city").preTags("<em>").postTags("</em>").fragmentSize(250);
		fields[1] = new Field("propertyType").preTags("<em>").postTags("</em").fragmentSize(250);
		fields[2] = new Field("description").preTags("<em>").postTags("</em>").fragmentSize(250);
		fields[3] = new Field("bedrooms").preTags("<em>").postTags("</em>").fragmentSize(250);
		NativeSearchQueryBuilder sq = new NativeSearchQueryBuilder().withHighlightFields(fields);
		sq.withQuery(qb); 
		SearchQuery searchQuery = sq.build();
		System.out.println(searchQuery);
		//List<HomeDetails> list = temp.queryForList(searchQuery, HomeDetails.class);
		List<HomeDetails> list = temp.query(searchQuery, new MyResultsExtractor());
		return list;
	}

	@Override
	public List<HomeDetails> multimatchquery(String input) {
		// TODO Auto-generated method stub
		return null;
	}

}
