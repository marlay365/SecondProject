package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.PropertyOwner;
import com.java.service.UserAuthenticationService;

@Controller
public class CreateAccountController {

	@Autowired
	UserAuthenticationService newOwnerServ;
	
	@PostMapping("register.do")
	public String getData(HttpServletRequest req, HttpServletResponse resp, @Valid @ModelAttribute PropertyOwner newOwner, BindingResult result, @RequestParam("pass2") String confirmPass) throws IOException {
		ModelAndView mv = new ModelAndView();
		//HttpSession session = req.getSession();
		if(result.hasErrors()) {
			req.setAttribute("error", result.getAllErrors().stream().map(x-> x.getDefaultMessage()).collect(Collectors.toList()));
			return "register";
		}
		String error = "Passwords do not match";
		if(!newOwner.getPassword().equals(confirmPass)) {
			req.setAttribute("error", error);
			return "register";
		}
		else {
			if(newOwnerServ.registerNewUser(newOwner) == true) {
				req.setAttribute("error", "Your account has been successfully created |<a href='login'> Login</a>");
				return "register";
			}
			else {
				req.setAttribute("error", "An account with this email address is already registered.");
				return "register";
			}
		}
	}
}

