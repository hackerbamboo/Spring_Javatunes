package com.javatunes.web;


import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javatunes.domain.PurchaseMusicItem;
import com.javatunes.domain.PurchaseOrder;
import com.javatunes.domain.UserInfo;
import com.javatunes.service.Catalog;
import com.javatunes.service.LPurchaseMusicItem;
import com.javatunes.service.LPurchaseOrder;


@Controller 
public class ShowHistoryController {
	
	
	@Inject
	Catalog musicCatalog;
	
	@Inject
	LPurchaseOrder lpurchaseOrder;
	
	@Inject
	LPurchaseMusicItem lpurchaseMusicItem;
	
	
	@RequestMapping(value="/purchasehistory", method=RequestMethod.GET)
	public ModelAndView get(HttpSession session) {
		
		UserInfo currentuser = (UserInfo) session.getAttribute("user");
		
		Collection<ShowHistoryModel> showhistoryModel = new ArrayList<ShowHistoryModel>();
		
		
		Collection<PurchaseOrder> purchaseOrder = lpurchaseOrder.getByUserID(currentuser.getId());
		
		for(PurchaseOrder m:purchaseOrder){
			Long poid = m.getPoId(); 
			Date date = m.getOrderDate();
			Collection<PurchaseMusicItem> purchaseMusicItem = lpurchaseMusicItem.getByPoId(poid);
			for(PurchaseMusicItem n:purchaseMusicItem){
				
				ShowHistoryModel onehistory = new ShowHistoryModel(date, musicCatalog.findById(n.getMusicItemID()), n.getQuantity(),n.getUnitPrice());
				showhistoryModel.add(onehistory);
				
			}
			
			
		}
		if(showhistoryModel.isEmpty()){
			ResourceBundle messages = (ResourceBundle)session.getAttribute("lang");
			return new ModelAndView("purchasehistory", "info", messages.getString("historyempty"));
		}
		else{
			return new ModelAndView("purchasehistory", "history", showhistoryModel);
		}
		
	}
	
}
