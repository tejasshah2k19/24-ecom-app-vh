<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<h2>New Product</h2>
 	
	<form action="saveproduct" method="post"  enctype="multipart/form-data">

		ProductName: <input type="text" name="productName" /><br>
		<br> Category: <input type="text" name="category" /><br>
		<br> Price: <input type="text" name="price" /><Br>
		<br> Qty:<input type="Text" name="qty" /><BR><br>
		
		Product Image : <input type="file" name="productImage"/><br><BR> 
		
		
		<Br> <input type="submit" value="Add Product" />

	</form>

</body>
</html>