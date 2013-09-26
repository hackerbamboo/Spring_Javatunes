package com.javatunes.service;

import javax.inject.Inject;

import com.javatunes.domain.UserInfo;
import com.javatunes.persistence.UserDAO;

public class UsersImpl implements Users {

	@Inject
	private UserDAO jpaUserDAO;
	
	public UsersImpl(UserDAO jpaUserDAO){
		this.jpaUserDAO = jpaUserDAO;
	}
	
	@Override
	public UserInfo findByID(Long id) {
		System.out.println("JavaTunesUser: findById--"+id);
		return jpaUserDAO.get(id);
	}

	@Override
	public UserInfo findByEmailPswd(String email, String password) {
		UserInfo user = jpaUserDAO.searchByEmail(email);
		if(user!=null && user.getPassword().equals(password)){
			return user;
		}
		else
			return null;
			
	}

	@Override
	public void addUser(UserInfo User){
		jpaUserDAO.addUser(User);
	}

	@Override
	public UserInfo findByEmailOnly(String email) {
		UserInfo user = jpaUserDAO.searchByEmail(email);
		return user;
	}
}
