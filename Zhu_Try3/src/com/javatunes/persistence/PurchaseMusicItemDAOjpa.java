package com.javatunes.persistence;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.javatunes.domain.PurchaseMusicItem;
import com.javatunes.domain.PurchaseOrder;


public class PurchaseMusicItemDAOjpa implements PurchaseMusicItemDAO {

	
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
	public void addPurchaseMusicItem(PurchaseMusicItem purchaseMusicItem) {
		em.persist(purchaseMusicItem);

	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<PurchaseMusicItem> getByPoId(Long poid) {
		Query query = em.createQuery("from PurchaseMusicItem as mi where mi.PoId = :PoId", PurchaseMusicItem.class);
		query.setParameter("PoId",poid);

	
		Collection<PurchaseMusicItem> collection = query.getResultList();
		return collection;
	}

		


}
