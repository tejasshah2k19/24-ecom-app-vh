package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bean.EProductBean;
import com.dao.EProductDao;

@Controller
public class CustomerProductController {

	@Autowired
	EProductDao productDao;

	@GetMapping("/listproducts")
	public String listProducts(Model model) {
		List<EProductBean> products = productDao.getAllProducts();// return type

		model.addAttribute("products", products);

		return "ListProducts";
	}

}
