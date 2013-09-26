package com.javatunes.web;

import java.util.Locale;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;








import com.javatunes.domain.UserInfo;
import com.javatunes.service.Users;
import com.javatunes.web.RegisterModel;

@Controller
@RequestMapping(Urls.REGISTER)
public class RegisterController {

	
	@Inject
	Users current_user;
	
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView processRegister(@ModelAttribute RegisterModel register, HttpSession session) {

		
		// Retrieve fields
		String email = register.getEmail();
		String username = register.getUsername();
		String password = register.getPassword();

		String firstname = register.getFirstname();
		String lastname = register.getLastname();

		String address = register.getAddress();
		String state = register.getState();
		String zipCode = register.getZipCode();
		System.out.println(zipCode);

		String lang = register.getLang();
		
		Locale currentLocale = new Locale(lang);
        ResourceBundle messages= ResourceBundle.getBundle("MessagesBundle", currentLocale);
		
		UserInfo newUser = new UserInfo(email, username, password, firstname, lastname, address, state, zipCode);
		// persist user
		current_user.addUser(newUser);

		session.setAttribute("user", newUser);
		 session.setAttribute("lang", messages);
	        session.setAttribute("locale", currentLocale);
		return new ModelAndView("index", "userinfo", newUser);
	}
}
