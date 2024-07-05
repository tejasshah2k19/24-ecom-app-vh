<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Product</title>
</head>
<body>
	<h2>View Product</h2>

	Product Name :  ${product.productName }<Br> 
	Price :${product.price }<Br>
	Category:${product.category }<Br>
	Qty : ${product.qty }<Br>
	<img src="${product.productImagePath}" height="200px" width="200px"/>

</body>
</html>