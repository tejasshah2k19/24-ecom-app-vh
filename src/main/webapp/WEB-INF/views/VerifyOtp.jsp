<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
</head>
<body>
	<h2>Update Password</h2>
	<form method="post" action="updatepassword">
		Email : <input type="Text" name="email"/><Br><br>
		New Password : <input type="Text" name="password"/><Br><BR> 
		OTP :<input type="Text" name="otp"/> <Br><Br>
				<input type="submit" value="Update Password"/>
	
	</form>
	<br>
	${error}
</body>
</html>