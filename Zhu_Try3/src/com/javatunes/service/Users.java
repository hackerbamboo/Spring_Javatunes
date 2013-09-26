package com.javatunes.service;

import com.javatunes.domain.UserInfo;

public interface Users {
	public UserInfo findByID(Long id);
	public UserInfo findByEmailPswd(String email, String password);
	public UserInfo findByEmailOnly(String email);
	public void addUser(UserInfo User);
}
