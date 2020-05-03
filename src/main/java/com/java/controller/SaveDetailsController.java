package com.java.controller;

import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.HomeDetails;
//import com.java.service.UserService;

@Controller
public class SaveDetailsController{

//	@Autowired 
//	UserService service;
//	SaveDetailsController(UserService service){
//		this.service=service;
//	}
	
	@PostMapping("/display.do")
	public ModelAndView getData(HttpServletRequest req, @Valid @ModelAttribute HomeDetails userdet, BindingResult result) {
		
		ModelAndView mv = new ModelAndView();
			
		if(result.hasErrors()) {
			mv.addObject("error", result.getAllErrors().stream().map(x-> x.getDefaultMessage()).collect(Collectors.toList()));
			mv.setViewName("details");
		}
		else{
			HttpSession session = req.getSession();

			String info = "Your details have been save in Database";
			
			session.setAttribute("userDetails", userdet);
			
			//service.registerUser(userdet);
			
			mv.setViewName("display");
			mv.addObject("info", info);
		}
			
		return mv;
	}
		
}
