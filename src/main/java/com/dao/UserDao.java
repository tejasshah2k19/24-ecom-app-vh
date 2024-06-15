package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.UserBean;

//Controller 
//Repository 
//Service 
//Component 

@Repository
public class UserDao {
	@Autowired
	JdbcTemplate stmt;

	public void insertUser(UserBean user) {
		user.setRole("CUSTOMER");
		stmt.update("insert into users (firstName,gender,email,password,role) values (?,?,?,?,?)", user.getFirstName(),
				user.getGender(), user.getEmail(), user.getPassword(), user.getRole());
	}

	public UserBean getUserByEmail(String email) {
		UserBean user = stmt.queryForObject("select * from users where email = ? ",
				new BeanPropertyRowMapper<>(UserBean.class), new Object[] { email });
		return user; 
	}
}
