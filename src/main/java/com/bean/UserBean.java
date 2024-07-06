package com.bean;

import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserBean {

	 Integer userId;
	 String firstName;
	 String gender;
	 String email;
	 String password;
	 String role; 
	 String otp;
}
