package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.ECartBean;
import com.bean.EProductBean;

@Repository
public class CartDao {

	@Autowired
	JdbcTemplate stmt;

	public void addToCart(ECartBean cartBean) {
		stmt.update("insert into cart (productId,userId,qty) values (?,?,?)", cartBean.getProductId(),
				cartBean.getUserId(), 1);
	}

	public List<EProductBean> myCart(Integer userId) {
		return stmt.query("select * from products join cart using (productId) where userId  = ? ",
				new BeanPropertyRowMapper<>(EProductBean.class), new Object[] { userId });
	}

	public int checkForExistingItem(ECartBean cartBean) {
		// select * from cart where productId = ? and userId = ?
		try {
			ECartBean cart = stmt.queryForObject("select * from cart where productId = ? and userId = ?",
					new BeanPropertyRowMapper<>(ECartBean.class),
					new Object[] { cartBean.getProductId(), cartBean.getUserId() });
			return cart.getQty();
		} catch (Exception e) {
			return 0;
		}

	}

	public void updateCart(ECartBean cartBean) {
		stmt.update("update cart set qty = ? where productId = ? and userId = ? ", cartBean.getQty(),
				cartBean.getProductId(), cartBean.getUserId());
	}

	// productId userId
}
//@Autowired 

//cart  new 
//order new 
//orderHistory new  