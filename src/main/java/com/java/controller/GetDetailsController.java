package com.java.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.HomeDetails;
import com.java.dto.PropertyOwner;
import com.java.service.ElasticSearchService;
import com.java.service.PropertyService;

//import com.java.service.UserService;

@Controller
public class GetDetailsController {
	
	@Autowired
	PropertyService service;
	@Autowired
	ElasticSearchService elservice;
	
//	@GetMapping("/search.do")
//	public String getData(HttpServletRequest req, @RequestParam String city, @RequestParam String propType){
//		
//		String availability = req.getParameter("availability");
//		String bedrooms = req.getParameter("bedrooms");
//		String range1 = req.getParameter("range1");
//		String range2 = req.getParameter("range2"); 
//		if(availability.equals("")) {
//			availability = null;
//		}
//		if(bedrooms.equals("")) {
//			bedrooms = null;
//		}
//		if(range1.equals("") || range2.equals("")) {
//			range1 = null;
//			range2 = null;
//			List<HomeDetails> list = service.getPropertyDetails(city, propType, availability, bedrooms, range1, range2);
//			if(list == null) {
//				String noResult = "Sorry, no results found.";
//				req.setAttribute("noResult", noResult);
//				return "display";
//				//return "forward:search.jsp";
//			}
//			req.setAttribute("list", list);
//			return "display";
//		}
//		else {
//			Double r1 = Double.parseDouble(range1);
//			Double r2 = Double.parseDouble(range2);
//			List<HomeDetails> list = service.getPropertyDetails(city, propType, availability, bedrooms, r1, r2);
//			if(list == null) {
//				String noResult = "Sorry, no results found.";
//				req.setAttribute("noResult", noResult);
//				return "display";
//				//return "forward:search.jsp";
//			}
//			req.setAttribute("list", list);
//			return "display";
//		}
//		
//		
//		
//				//return "forward:search.jsp";
//	}
	
	@GetMapping("/search.do")
	public String getData(HttpServletRequest req, @RequestParam String city, @RequestParam String propType){
		
		String availability = req.getParameter("availability");
		String bedrooms = req.getParameter("bedrooms");
		String range1 = req.getParameter("range1");
		String range2 = req.getParameter("range2");
		
		//List<HomeDetails> list = elservice.getPropertiesByCityAndPropertyType(city, propType);
		List<HomeDetails> list = elservice.multimatchquery(city);
		if(list == null) {
			String noResult = "Sorry, no results found.";
			req.setAttribute("noResult", noResult);
			return "display";
			//return "forward:search.jsp";
		}
		req.setAttribute("list", list);
		return "display";
//		
//		if(availability.equals("")) {
//			availability = null;
//		}
//		if(bedrooms.equals("")) {
//			bedrooms = null;
//		}
//		if(range1.equals("") || range2.equals("")) {
//			range1 = null;
//			range2 = null;
//			List<HomeDetails> list = service.getPropertyDetails(city, propType, availability, bedrooms, range1, range2);
//			if(list == null) {
//				String noResult = "Sorry, no results found.";
//				req.setAttribute("noResult", noResult);
//				return "display";
//				//return "forward:search.jsp";
//			}
//			req.setAttribute("list", list);
//			return "display";
//		}
//		else {
//			Double r1 = Double.parseDouble(range1);
//			Double r2 = Double.parseDouble(range2);
//			List<HomeDetails> list = service.getPropertyDetails(city, propType, availability, bedrooms, r1, r2);
//			if(list == null) {
//				String noResult = "Sorry, no results found.";
//				req.setAttribute("noResult", noResult);
//				return "display";
//				//return "forward:search.jsp";
//			}
//			req.setAttribute("list", list);
//			return "display";
//		}
		
				//return "forward:search.jsp";
	}
	
//	@GetMapping("/search")
//	public String getData(HttpServletRequest req, @RequestParam int id){
//		
//		System.out.println(id);
//		HomeDetails obj = service.getPropertyDetailsbyId(id);
//		req.setAttribute("obj", obj);
//		return "forward:singleproperty.jsp";
//	}
	
	@GetMapping("/seelist")
	public String getData(HttpSession session, HttpServletRequest req) {
		PropertyOwner owner = (PropertyOwner) session.getAttribute("owner");
		if(owner == null) {
			return "login";
		}
		List<HomeDetails> list = service.getMyProperties(owner.getId());
		if(list == null) {
			String noResult = "Sorry, no results found.";
			req.setAttribute("noResult", noResult);
			return "myproperties";
		}
		req.setAttribute("list", list);
		return "myproperties";
	}
	
}
