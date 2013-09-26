package com.javatunes.service;

import java.util.Collection;

import com.javatunes.domain.PurchaseMusicItem;


public interface LPurchaseMusicItem {
	public void addPurchaseMusicItem(PurchaseMusicItem purchaseMusicItem);

	public Collection<PurchaseMusicItem> getByPoId(Long poid);
}
