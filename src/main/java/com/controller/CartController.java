package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.ECartBean;
import com.bean.EProductBean;
import com.bean.UserBean;
import com.dao.CartDao;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	CartDao cartDao;

	@GetMapping("/addtocart")
	public String addToCart(@RequestParam("productId") Integer productId, HttpSession session) {

		UserBean userBean = (UserBean) session.getAttribute("user");

		Integer userId = userBean.getUserId();

		ECartBean cartBean = new ECartBean();
		cartBean.setProductId(productId);
		cartBean.setUserId(userId);

		int qty = cartDao.checkForExistingItem(cartBean);

		if (qty == 0) {
			cartDao.addToCart(cartBean);
		}else {
			cartBean.setQty(qty+1);
			cartDao.updateCart(cartBean);
		}
		return "redirect:/listproducts";// url
	}

	@GetMapping("/mycart")
	public String myCart(HttpSession session, Model model) {
		UserBean user = (UserBean) session.getAttribute("user");
		Integer userId = user.getUserId();
		List<EProductBean> products = cartDao.myCart(userId);
		model.addAttribute("products", products);
		return "MyCart";

	}
}

//read -> single record ->@RequestParam -> get ? 