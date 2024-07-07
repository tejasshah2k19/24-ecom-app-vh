package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.UserBean;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@GetMapping("addtocart")
	public String addToCart(@RequestParam("productId") Integer productId, HttpSession session) {
		UserBean user = (UserBean)session.getAttribute("user");//userId
		
		//db cart insert -> userId,productId
		
		System.out.println(user.getUserId());
		System.out.println(productId);
		
		return "redirect:/listproducts";
	}
}
