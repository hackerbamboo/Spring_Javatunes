package com.javatunes.service;

import java.util.Collection;

import javax.inject.Inject;

import com.javatunes.domain.PurchaseOrder;
import com.javatunes.persistence.PurchaseOrderDAO;


public class LPurchaseOrderImpl implements LPurchaseOrder {

	@Inject
	private PurchaseOrderDAO jpaPurchaseOrderDAO; 
	
	@Override
	public void addPurchaseOrder(PurchaseOrder purchaseorder) {
		jpaPurchaseOrderDAO.addPurchaseOrder(purchaseorder);
	}

	@Override
	public Collection<PurchaseOrder>  getByUserID(Long id) {
		// TODO Auto-generated method stub
		return jpaPurchaseOrderDAO.getByUserID(id);
	}

}
