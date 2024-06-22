<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
</head>
<body>

<form action="sendotp" method="post">
Email : <input type="text" name="email"/> 

<input type="submit" value="Search"/>

</form>
<br>
${error }<Br>
<a href="login">Login</a>
</body>
</html>