package com.javatunes.persistence;

import java.util.Collection;

import com.javatunes.domain.UserInfo;

public interface UserDAO {
	public UserInfo get(Long id);
	public Collection<UserInfo> getAll();
	public UserInfo searchByEmail(String email);
	public void addUser(UserInfo User);
}
