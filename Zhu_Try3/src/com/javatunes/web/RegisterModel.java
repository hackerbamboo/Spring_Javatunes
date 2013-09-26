package com.javatunes.web;

public class RegisterModel {
	
	private String email;
	
	
	// user's login name
		private String username;

		// user's login password
		private String password;

		// user's password repeat checking
		private String repeatPassword;

		// first name
		private String firstname;

		//last name
		private String lastname;

		// address
		private String address;

		// state
		private String states;

		// zip code
		private String zipcode;
		
		private String lang;

		// getter for user login name
		public String getUsername() {
			return username;
		}

		// setter for user login name
		public void setUsername(String keyword) {
			this.username = keyword;
		}

		// getter for user login password
		public String getPassword() {
			return password;
		}

		// setter for user login password
		public void setPassword(String password) {
			this.password = password;
		}

		// getter for user repeat password
		public String getRepeatPassword() {
			return repeatPassword;
		}

		// setter for user repeat password
		public void setRepeatPassword(String repeatPassword) {
			this.repeatPassword = repeatPassword;
		}

		// getter for user address
		public String getAddress() {
			return address;
		}

		// setter for user address
		public void setAddress(String address) {
			this.address = address;
		}

		// getter for user state
		public String getState() {
			return states;
		}

		// setter for user state
		public void setState(String state) {
			this.states = state;
		}

		// getter for user zip code
		public String getZipCode() {
			return zipcode;
		}

		// setter for user zip code
		public void setZipCode(String zipcode) {
			this.zipcode = zipcode;
		}

		


		// getter for user first name
		public String getFirstname() {
			return firstname;
		}

		// setter for user first name
		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}

		// getter for user last name
		public String getLastname() {
			return lastname;
		}

		// setter for user last name
		public void setLastname(String lastname) {
			this.lastname = lastname;
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
