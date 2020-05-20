package com.java.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.springframework.data.elasticsearch.core.ResultsExtractor;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.HomeDetails;

public class MyResultsExtractor implements ResultsExtractor<List<HomeDetails>> {

	@Override
	public List<HomeDetails> extract(SearchResponse response) {
		return Arrays.stream(response.getHits().getHits()).map(s -> {
            ObjectMapper mapper = new ObjectMapper();
            try {
                HomeDetails list = mapper.readValue(s.getSourceAsString(), HomeDetails.class);
                Arrays.stream(s.getHighlightFields().get("city").getFragments())
                .map(Text::toString).reduce((s1, s2) -> s1+s2).ifPresent(list::setCity);
                HighlightField field = s.getHighlightFields().get("bedrooms");
                if (field != null){
                    Arrays.stream(field.getFragments()) //String[]  {s1, s2,s3} s1 + s2 = s7, s7+ s3 = s8
                            .map(Text::toString) //stream String
                            .reduce((s1, s2) -> s1 + s2)
                            .ifPresent(list::setBedrooms);
                }
                
                return list;
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
            return null;
        }).collect(Collectors.toList());
		
	}

}
