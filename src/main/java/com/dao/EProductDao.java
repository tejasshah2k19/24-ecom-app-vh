package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.EProductBean;

@Repository
public class EProductDao {

	@Autowired
	JdbcTemplate stmt;// used to execute sql query into databse

	public void addProduct(EProductBean productBean) {
		stmt.update("insert into products (productName,category,price,qty,productImagePath) values (?,?,?,?,?) ",
				productBean.getProductName(), productBean.getCategory(), productBean.getPrice(), productBean.getQty(),
				productBean.getProductImagePath());
	}

	public List<EProductBean> getAllProducts() {
		List<EProductBean> list = stmt.query("select * from products",
				new BeanPropertyRowMapper<EProductBean>(EProductBean.class));
		return list;
	}

	public void deleteProduct(Integer productId) {
		// delete from products ; //delete all
		// delete from products where productId = XX
		stmt.update("delete from products where productId = ? ", productId);
	}

	public EProductBean getProductById(Integer productId) {

		EProductBean bean = stmt.queryForObject("select * from products where productId = ? ",
				new BeanPropertyRowMapper<>(EProductBean.class), new Object[] { productId }); // name color
		return bean;
	}

	// query -> select { n number of records } { 1 2 3 ....n }
	// update -> insert update delete
	// queryForObject -> select { exactly 1 } 0{1}2

}
