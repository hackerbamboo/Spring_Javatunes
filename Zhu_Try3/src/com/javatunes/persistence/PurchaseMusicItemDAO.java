package com.javatunes.persistence;

import java.util.Collection;

import com.javatunes.domain.PurchaseMusicItem;



public interface PurchaseMusicItemDAO {

	void addPurchaseMusicItem(PurchaseMusicItem purchaseMusicItem);

	Collection<PurchaseMusicItem> getByPoId(Long poid);

}
