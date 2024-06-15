package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.UserBean;
import com.dao.UserDao;

@Controller
public class SessionController {

	@Autowired
	UserDao userDao;
	
	@Autowired
	BCryptPasswordEncoder encoder; 
	
	@GetMapping("/signup")
	public String signup() {
		return "Signup";//jsp open 
	}

	@PostMapping("/signup")
	public String signupPost(UserBean user) {
//		String pwd = user.getPassword(); 
//		String encPwd = encoder.encode(pwd); 
//		user.setPassword(encPwd);

		user.setPassword(encoder.encode(user.getPassword())); 
		userDao.insertUser(user);
		return "Login";
	}
}
