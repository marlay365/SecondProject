package com.java.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.HomeDetails;
import com.java.dto.PropertyOwner;
import com.java.service.ElasticSearchService;
import com.java.service.InputService;
import com.java.service.PropertyService;

//import com.java.service.UserService;

@Controller
public class GetDetailsController {
	
	@Autowired
	PropertyService service;
	@Autowired
	ElasticSearchService elservice;
	
	@GetMapping("/search.do")
	@PreAuthorize("permitAll()")
	public String getData(HttpServletRequest req, @ModelAttribute InputService inpserv){
		
		List<HomeDetails> list = elservice.multimatchquery(inpserv);
		
		if(list.size() == 0) {
			String noResult = "Sorry, no results found. <br><br><br><br><br>";
			req.setAttribute("noResult", noResult);
			return "display";
		}
		req.setAttribute("list", list);
		return "display";
	}
	
	@GetMapping("/seelist")
	@PreAuthorize("isAuthenticated()")
	public String getData(HttpSession session, HttpServletRequest req) {
		PropertyOwner owner = (PropertyOwner) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<HomeDetails> list = service.getMyProperties(owner.getId());
		if(list.size() == 0) {
			String noResult = "Sorry, no results found. <br><br><br><br><br>";
			req.setAttribute("noResult", noResult);
			return "myproperties";
		}
		req.setAttribute("list", list);
		return "myproperties";
	}
	
}
