package com.javatunes.service;

import java.util.Collection;

import com.javatunes.domain.PurchaseOrder;


public interface LPurchaseOrder {
	public void addPurchaseOrder(PurchaseOrder purchaseorder);

	public Collection<PurchaseOrder>  getByUserID(Long id);
}
