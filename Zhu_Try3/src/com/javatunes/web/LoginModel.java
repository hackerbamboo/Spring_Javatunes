package com.javatunes.web;


import java.util.Collection;

import com.javatunes.domain.MusicItem;

public class LoginModel {
	private String email;
	private String password;
	private String lang;
	
	
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	
		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getLang() {
			return lang;
		}

		public void setLang(String lang) {
			this.lang = lang;
		}
	
}
