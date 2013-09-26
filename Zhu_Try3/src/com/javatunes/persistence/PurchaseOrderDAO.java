package com.javatunes.persistence;

import java.util.Collection;

import com.javatunes.domain.PurchaseOrder;


public interface PurchaseOrderDAO {
	public void addPurchaseOrder(PurchaseOrder purchaseOrder);

	public Collection<PurchaseOrder>  getByUserID(Long id);
}
