package com.javatunes.web;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;










import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javatunes.domain.*;
import com.javatunes.service.Catalog;
import com.javatunes.service.LPurchaseMusicItem;
import com.javatunes.service.LPurchaseOrder;
import com.javatunes.util.TaxTable;

@Controller
public class CheckoutController {

	@Inject
	Catalog musicCatalog;
	
	@Inject
	LPurchaseOrder lpurchaseOrder;
	
	@Inject
	LPurchaseMusicItem lpurchaseMusicItem;
	
	
	float totalpricefinal = 0.0f;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/checkout", method=RequestMethod.GET)
	public ModelAndView get(@ModelAttribute CheckoutModel checkout, HttpSession session) {
	
		UserInfo currentuser = (UserInfo) session.getAttribute("user");
		
		//session.removeAttribute("shoppingcart");
		
		Collection<ViewCartModel> passBack = (Collection<ViewCartModel>) session.getAttribute("cartWithprice");
		
		checkout.setPassBack(passBack);
	
		float totalprice = 0.0f;
		
		
		for(ViewCartModel m: passBack){			
			totalprice += (float)m.getTotalPriceEach().floatValue();
		}
		checkout.setTotalPriceBeforeTax(totalprice);
		
		
		checkout.setState(currentuser.getStates());
		float taxRate = getTaxRateByState(currentuser.getStates());
		checkout.setTax(taxRate);
		
		
		totalpricefinal = totalprice*(1 + taxRate);
		checkout.setTotalPriceAfterTax(totalpricefinal);
		
		
		
		return new ModelAndView("checkout", "finalresults", checkout);
	
	}

	
	private float getTaxRateByState(String state) {
		return TaxTable.getTaxRate(state);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/checkout", method=RequestMethod.POST)
	public String post(HttpSession session) {
		UserInfo currentuser = (UserInfo)session.getAttribute("user");
		
		
		Date javaDate = new Date();
		BigDecimal value = new BigDecimal(Float.toString(totalpricefinal));

		PurchaseOrder purchaseorder = new PurchaseOrder(1, javaDate, currentuser.getId(), value);
		lpurchaseOrder.addPurchaseOrder(purchaseorder);
		Long poId = purchaseorder.getPoId();
		
		Collection<ViewCartModel> passBack = (Collection<ViewCartModel>) session.getAttribute("cartWithprice");
		for(ViewCartModel m: passBack){			
			PurchaseMusicItem purchaseMusicItem = new PurchaseMusicItem(poId, m.getMusicItem().getId(), m.getQuantity(),  m.getMusicItem().getPrice());
			lpurchaseMusicItem.addPurchaseMusicItem(purchaseMusicItem);
			
		}

		session.removeAttribute("shoppingcart");
		session.removeAttribute("cartWithprice");
		return "index";
	}
	
}
