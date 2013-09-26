package com.javatunes.persistence;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.javatunes.domain.UserInfo;

public class UserDAOjpa implements UserDAO {

	@PersistenceContext
	private EntityManager em;
	
	public EntityManager getEm(){
		return em;
	}
	
	public void setEm(EntityManager em){
		this.em = em;
	}
	
	@Override
	public UserInfo get(Long id) {
		return em.find(UserInfo.class, id);
	}

	@Override
	public Collection<UserInfo> getAll() {
		Collection<UserInfo> collection = new ArrayList<UserInfo>();
		collection = em.createQuery("from Users", UserInfo.class).getResultList();
		System.out.println("====getAll==== size"+collection.size());
		return collection;
	}

	
	@Override
	public UserInfo searchByEmail(String email) {
		email = email.trim();
		
		Query query = em.createQuery("from UserInfo as u where u.email like :email", UserInfo.class);
		query.setParameter("email", "%" + email + "%");
		
		Collection<UserInfo> userList = query.getResultList();
		//System.out.println("=========validateUser===== size  " + userList.size());

		if (userList.size() > 0) {
			return (UserInfo) userList.toArray()[0];
		}
		
		return null;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void addUser(UserInfo User){	
		em.persist(User);		
		
	}
}
