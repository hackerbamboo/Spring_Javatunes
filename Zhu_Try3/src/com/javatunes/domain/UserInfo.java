package com.javatunes.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserInfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	// Properties
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String email;
	private String username;	
	private String password;
	private String firstname;	
	private String lastname;
	private String address;
	private String states;
	private String zipcode;


	public UserInfo() {}

	public UserInfo(Long id){
		this.setId(id);
	}
	
	
	
	public Long getId() {
		return id;
	}

	private void setId(Long id) {
		this.id = id;
	}

	public UserInfo(String email, String username, String password, String firstname, String lastname, String address, String states, String zipcode) {
		this.setEmail(email);
		this.setUsername(username);
		this.setPassword(password);
		this.setFirstname(firstname);
		this.setLastname(lastname);
		this.setAddress(address);
		this.setStates(states);
		this.setZipcode(zipcode);
	
	}

	
	
	
	public String getUsername() {return username;}
	public String getPassword() {return password;}
	public String getFirstname() {return firstname;}
	public String getLastname() {return lastname;}
	public String getAddress() {return address;}

	//public Long getId() {return id;}
	
	public void setUsername(String username) {this.username = username;}
	public void setPassword(String password) {this.password = password;}
	public void setFirstname(String firstname) {this.firstname = firstname;}	
	public void setLastname(String lastname) {this.lastname = lastname;}
	private void setAddress(String address) {this.address = address;}

	//public void setId(Long id) {this.id = id;}

	//@Override
	// override Object.equals
	 /*  public boolean equals(Object compare)
	   {
	      boolean result = false;
	      UserInfo other = null;

	      if (compare instanceof UserInfo)
	      {
	         // cast to MusicItem
	         other = (UserInfo) compare;

	         // if all the ids are equal, the objects are equal
	         //result = other.getId().equals(this.getId()) ;
	      }
	      return result;
	   }*/
	


	   // override Object.toString
	@Override
	   public String toString()
	   {
	      return this.getClass().getName() +
	         ": id=" + this.getId() +
	         ": email=" + this.getEmail() +
	         ": username=" + this.getUsername() +
	         ": lastname" + this.getLastname() +
	         ": firstname" + this.getFirstname()+
	         ": address" + this.getAddress() +
	         ": state" + this.getStates()+
	         ": zipcode" + this.getZipcode();
	   }

	public String getStates() {
		return states;
	}

	public void setStates(String states) {
		this.states = states;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	

	
}