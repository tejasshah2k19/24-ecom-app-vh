<%@page import="com.bean.EProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap')
	;

body {
	font-family: "Poppins", sans-serif;
	color: #444444;
}

a, a:hover {
	text-decoration: none;
	color: inherit;
}

.section-products {
	padding: 80px 0 54px;
}

.section-products .header {
	margin-bottom: 50px;
}

.section-products .header h3 {
	font-size: 1rem;
	color: #fe302f;
	font-weight: 500;
}

.section-products .header h2 {
	font-size: 2.2rem;
	font-weight: 400;
	color: #444444;
}

.section-products .single-product {
	margin-bottom: 26px;
}

.section-products .single-product .part-1 {
	position: relative;
	height: 290px;
	max-height: 290px;
	margin-bottom: 20px;
	overflow: hidden;
}

.section-products .single-product .part-1::before {
	position: absolute;
	content: "";
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	transition: all 0.3s;
}

.section-products .single-product:hover .part-1::before {
	transform: scale(1.2, 1.2) rotate(5deg);
}

.section-products #product-1 .part-1::before {
	background-size: cover;
	transition: all 0.3s;
}

.section-products #product-2 .part-1::before {
	background: url("https://i.ibb.co/cLnZjnS/2.jpg") no-repeat center;
	background-size: cover;
}

.section-products #product-3 .part-1::before {
	background: url("https://i.ibb.co/L8Nrb7p/1.jpg") no-repeat center;
	background-size: cover;
}

.section-products #product-4 .part-1::before {
	background: url("https://i.ibb.co/cLnZjnS/2.jpg") no-repeat center;
	background-size: cover;
}

.section-products .single-product .part-1 .discount, .section-products .single-product .part-1 .new
	{
	position: absolute;
	top: 15px;
	left: 20px;
	color: #ffffff;
	background-color: #fe302f;
	padding: 2px 8px;
	text-transform: uppercase;
	font-size: 0.85rem;
}

.section-products .single-product .part-1 .new {
	left: 0;
	background-color: #444444;
}

.section-products .single-product .part-1 ul {
	position: absolute;
	bottom: -41px;
	left: 20px;
	margin: 0;
	padding: 0;
	list-style: none;
	opacity: 0;
	transition: bottom 0.5s, opacity 0.5s;
}

.section-products .single-product:hover .part-1 ul {
	bottom: 30px;
	opacity: 1;
}

.section-products .single-product .part-1 ul li {
	display: inline-block;
	margin-right: 4px;
}

.section-products .single-product .part-1 ul li a {
	display: inline-block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	background-color: #ffffff;
	color: #444444;
	text-align: center;
	box-shadow: 0 2px 20px rgb(50 50 50/ 10%);
	transition: color 0.2s;
}

.section-products .single-product .part-1 ul li a:hover {
	color: #fe302f;
}

.section-products .single-product .part-2 .product-title {
	font-size: 1rem;
}

.section-products .single-product .part-2 h4 {
	display: inline-block;
	font-size: 1rem;
}

.section-products .single-product .part-2 .product-old-price {
	position: relative;
	padding: 0 7px;
	margin-right: 2px;
	opacity: 0.6;
}

.section-products .single-product .part-2 .product-old-price::after {
	position: absolute;
	content: "";
	top: 50%;
	left: 0;
	width: 100%;
	height: 1px;
	background-color: #444444;
	transform: translateY(-50%);
}
</style>
</head>
<body>
	<%
	List<EProductBean> products = (List<EProductBean>) request.getAttribute("products");
	%>

	<div class="container-fluid">
		<h2>List Products</h2>


		<section class="section-products">
			<div class="container">
				<div class="row justify-content-center text-center">
					<div class="col-md-8 col-lg-6">
						<div class="header">
							<h3>Featured Product</h3>
							<h2>Popular Products</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- start -->
					<%
					for (EProductBean p : products) {
					%>
					<!-- Single Product -->
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div id="product-1" class="single-product">
							<div class="part-1">

								<%
								if (p.getProductImagePath() == null || p.getProductImagePath().length() == 0) {
								%>
								<img src="images/products/noproduct.jpg" width="100%" height="100%" />

								<%
								} else {
								%>
								<img src="<%=p.getProductImagePath()%>" width="100%"
									height="100%" />
								<%
								}
								%>
								<ul>
									<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
									<li><a href="#"><i class="fas fa-heart"></i></a></li>
									<li><a href="#"><i class="fas fa-plus"></i></a></li>
									<li><a href="viewproduct?productId=<%=p.getProductId()%>"><i
											class="fas fa-eye"></i></a></li>
								</ul>
							</div>
							<div class="part-2">
								<h3 class="product-title"><%=p.getProductName()%></h3>
								<h4 class="product-old-price"><%=p.getPrice() * 0.05 + p.getPrice()%></h4>
								<h4 class="product-price"><%=p.getPrice()%></h4>
							</div>
						</div>
					</div>
					<%
					}
					%>
					<!-- end -->
				</div>
			</div>
		</section>

	</div>



</body>
</html>