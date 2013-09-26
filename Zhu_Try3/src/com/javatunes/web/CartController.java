package com.javatunes.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Hashtable;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;





import com.javatunes.service.Catalog;



@Controller
public class CartController {

	@Inject
	Catalog musicCatalog;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/addToCart",method=RequestMethod.POST)
	public @ResponseBody String add(@ModelAttribute AddtoCartModel u, HttpSession session) {
	
		HashMap<Integer, Integer> currentCart = (HashMap<Integer, Integer>) session.getAttribute("shoppingcart");
		
		
		
		if(currentCart.containsKey(u.getId())){
			currentCart.put(u.getId(), u.getCount());
			return "update";
		}
		else{
			currentCart.put(u.getId(), u.getCount());	
			return "success";
		}
		
		//if the inventory is empty...add method here
		
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/deleteToCart",method=RequestMethod.POST)
	public @ResponseBody String get(@RequestParam("id") Long id, HttpSession session) {
		System.out.println(id);
		HashMap<Integer, Integer> currentCart = (HashMap<Integer, Integer>) session.getAttribute("shoppingcart");
		currentCart.remove((id.intValue()));
		System.out.println(currentCart);
		return "success";
	}
}
