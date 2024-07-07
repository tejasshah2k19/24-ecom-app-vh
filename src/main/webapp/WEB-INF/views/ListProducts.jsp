<%@page import="com.bean.EProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>List Products</h2>

	<br>
	<br>

	<a href="home">Home</a>
	<br>
	<br>


	<%
	List<EProductBean> products = (List<EProductBean>) request.getAttribute("products");
	%>

	<table border="0" cellpadding="20" cellspacing="20">
		<%
		for (EProductBean p : products) {
			out.print("<tr>");
			out.print("<td>" + p.getProductName()
			+ "<br><br> <img height='100px' width='100px' src='" + p.getProductImagePath() + "'/><a href='addtocart?productId="+p.getProductId()+"'>AddToCart</a></td>");
			out.print("</tr>");

		}
		%>



	</table>
</body>
</html>