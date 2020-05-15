package com.java.controller;

import java.util.Date;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import com.java.dto.HomeDetails;
import com.java.dto.PropertyOwner;
import com.java.service.ElasticSearchService;
import com.java.service.PropertyService;

@Controller
public class SavePropertiesController {

	@Autowired
	private PropertyService newProp;
	
	@Autowired private ElasticSearchService service;
	
	
	@PostMapping("/saveproperties.do")
	@PreAuthorize("isAuthenticated()")
	@Transactional
	public String getData(HttpServletRequest req, @Valid @ModelAttribute HomeDetails propDetails, BindingResult result) {
		Date date = new Date();
		
		if(result.hasErrors()) {
			req.setAttribute("error", result.getAllErrors().stream().map(x-> x.getDefaultMessage()).collect(Collectors.toList()));
			return "welcome";
		}
		PropertyOwner loginOwner = (PropertyOwner) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		propDetails.setDatePosted(date);
		propDetails.setOwner(loginOwner);
		HomeDetails details = newProp.registerProperty(propDetails);
		service.saveElasticDetails(details);
		if(details != null)
			return "saved";
		
		return "welcome";
	}
}
