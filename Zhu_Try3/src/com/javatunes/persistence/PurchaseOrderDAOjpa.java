package com.javatunes.persistence;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.javatunes.domain.MusicItem;
import com.javatunes.domain.PurchaseOrder;



public class PurchaseOrderDAOjpa implements PurchaseOrderDAO {

	@PersistenceContext
	private EntityManager em;
	
	public EntityManager getEm(){
		return em;
	}
	
	public void setEm(EntityManager em){
		this.em = em;
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void addPurchaseOrder(PurchaseOrder purchaseOrder) {
		em.persist(purchaseOrder);

	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<PurchaseOrder>  getByUserID(Long id) {
		// TODO Auto-generated method stub
		
		System.out.println(id);
		Query query = em.createQuery("from PurchaseOrder as mi where mi.UserId = :UserId", PurchaseOrder.class);
		query.setParameter("UserId", id);

	
		Collection<PurchaseOrder> collection = query.getResultList();
		return collection;
	}

}
