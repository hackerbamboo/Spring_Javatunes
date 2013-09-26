package com.javatunes.web;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javatunes.domain.MusicItem;
import com.javatunes.service.Catalog;

@Controller 
public class ViewCartController {

	@Inject
	Catalog musicCatalog;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/viewcart",method=RequestMethod.GET)
	public ModelAndView get(HttpSession session) {
			
		HashMap<Integer, Integer> currentCart = (HashMap<Integer, Integer>) session.getAttribute("shoppingcart");
		
		Collection<ViewCartModel> passBack = new ArrayList<ViewCartModel>();
		
		if(currentCart.isEmpty()){
			
			session.setAttribute("cartWithprice", passBack);
			ResourceBundle messages = (ResourceBundle)session.getAttribute("lang");
			return new ModelAndView("viewcart","cartinfo",messages.getString("cartempty"));
		}
		else{
			Iterator<Integer> iter = currentCart.keySet().iterator();

			while(iter.hasNext()) {
				Integer key = (Integer)iter.next();
				MusicItem musicItem = musicCatalog.findById(Long.valueOf(key));
				int quantity = currentCart.get(key);
				BigDecimal TotalPrice = musicItem.getPrice().multiply(new BigDecimal(quantity));
				ViewCartModel e = new ViewCartModel(musicItem, quantity, TotalPrice);
				passBack.add(e);
				
			}			
			
			session.setAttribute("cartWithprice", passBack);

			return new ModelAndView("viewcart", "cartresults", passBack);
			
		}
		
	
	}
}
