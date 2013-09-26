package com.javatunes.web;

import java.util.HashMap;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public ModelAndView get(HttpServletRequest request,  HttpSession session) {
		
		HashMap<Integer, Integer> shoppingcart = new HashMap<Integer, Integer>();
		
		session.setAttribute("shoppingcart", shoppingcart);
		return new ModelAndView("index", "userinfo", session.getAttribute("user"));
	}
}
