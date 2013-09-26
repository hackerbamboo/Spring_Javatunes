package com.javatunes.web;

import java.util.Locale;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.javatunes.domain.UserInfo;
import com.javatunes.service.Users;


@Controller

public class LoginController {
		
		@Inject
		Users current_user;
		
		
		@RequestMapping(value="/login", method=RequestMethod.POST)
		public @ResponseBody String processlogin(@ModelAttribute LoginModel u, HttpServletRequest request,  HttpSession session){
			
			String email = u.getEmail();
			
			String password = u.getPassword();
			
			String lang = u.getLang();
			
			Locale currentLocale = new Locale(lang);
	        ResourceBundle messages= ResourceBundle.getBundle("MessagesBundle", currentLocale);
			
	        session.setAttribute("lang", messages);
	        session.setAttribute("locale", currentLocale);
			
			UserInfo user = current_user.findByEmailPswd(email, password);
			
			
			if(user==null){
				return "wrong";
			}
			else{
				session.setAttribute("user", user);
				return "success";
				
			}
			
			
			
		}


		
}
