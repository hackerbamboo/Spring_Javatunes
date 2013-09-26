package com.javatunes.service;

import java.util.Collection;

import javax.inject.Inject;




import com.javatunes.domain.PurchaseMusicItem;
import com.javatunes.persistence.PurchaseMusicItemDAO;

public class LPurchaseMusicItemImpl implements LPurchaseMusicItem {

	@Inject
	PurchaseMusicItemDAO jpaPurchaseMusicItemDAO;
	
	
	@Override
	public void addPurchaseMusicItem(PurchaseMusicItem purchaseMusicItem) {
		jpaPurchaseMusicItemDAO.addPurchaseMusicItem(purchaseMusicItem);

	}


	@Override
	public Collection<PurchaseMusicItem> getByPoId(Long poid) {
		// TODO Auto-generated method stub
		return jpaPurchaseMusicItemDAO.getByPoId(poid);
		
	}

}
