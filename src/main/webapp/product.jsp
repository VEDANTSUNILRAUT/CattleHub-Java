<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cattlehub.dao.CattleDao"%>
<%@ page import="com.cattlehub.Servlet.DBConnection"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cattlehub.entities.Category"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/product.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<title>Cattle Products</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
}

.header nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #ffffff;
	padding: 10px 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

#nav-logo img {
	height: 50px;
}

nav ul {
	list-style: none;
	display: flex;
	gap: 20px;
	align-items: center;
	margin: 0;
	padding: 0;
}

nav ul li a, .add-cattle-btn {
	text-decoration: none;
	color: #333;
	font-weight: bold;
}

.add-cattle-btn {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.2s ease;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.add-cattle-btn:hover {
	background-color: #45a049;
	transform: scale(1.03);
}

.container {
	display: flex;
 	padding: 20px; 
/* 	gap: 20px; */
}

.sidebar {
	width: 20%;
	background-color: #fff;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.sidebar .list-group a {
	display: block;
	padding: 10px;
	margin-bottom: 10px;
	text-decoration: none;
	color: #333;
	background-color: #f1f1f1;
	border-radius: 4px;
	transition: background-color 0.2s ease;
}

.sidebar .list-group a:hover, .sidebar .list-group .active {
	background-color: #4CAF50;
	color: white;
}

.content {
width:100%;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	min-height: 400px;
}


.footer-container {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	padding: 40px 20px;
	background-color: #333;
	color: #fff;
}

.footer-container div {
	margin: 10px;
	flex: 1;
	min-width: 200px;
}

.footer-container a {
	color: #fff;
	text-decoration: none;
}

.footer-social img {
	width: 24px;
	height: 24px;
	margin-right: 10px;
}

.footer-bottom {
	text-align: center;
	padding: 15px;
	background-color: #222;
	color: #ccc;
}
/* Make only the cattle cards area scrollable inside the content */
#cattle-container {
    max-height: 600px; /* Adjust as per your layout */
    overflow-y: auto;
    padding-right: 10px; /* to prevent scroll bar overlap */
}

</style>
</head>
<body>
	<div class="header">
		<nav>
			<div id="nav-logo">
				<img src="./img/navlogo.png" alt="Cattle Hub Logo">
			</div>
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="home.jsp/#about-cms">About</a></li>
				<li><a href="services.jsp">Services</a></li>
				<li><a href="contact.jsp">Contact</a></li>
				<li><a href="add-cattle.jsp"><button class="add-cattle-btn">Add Cattle</button></a></li>
			</ul>
		</nav>
	</div>

	<main>
		<div class="container">
			<div class="sidebar">
				<div class="list-group">
					<a href="#" class="active">All Cattle</a>
					<%
					CattleDao d = new CattleDao(DBConnection.getConnection());
					ArrayList<Category> list1 = d.getCategory();
					for (Category cc : list1) {
					%>
					<a href="#"><%= cc.getName() %></a>
					<%
					}
					%>
				</div>
			</div>
			<div class="content">
				<div id="loader">
					<i class="fa fa-refresh fa-spin fa-2x"></i>
					<h3 class="mt-2">Loading...</h3>
				</div>
				<div class="container-fluid" id="cattle-container"></div>
			</div>
		</div>
	</main>

	<footer>
		<div class="footer-container">
			<div class="footer-logo">
				<img src="./img/navlogo.png" alt="Cattle Hub Logo">
				<p>Connecting farmers with quality cattle products for a better future.</p>
			</div>
			<div class="footer-links">
				<h3>Quick Links</h3>
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="index.jsp/#about-cms">About</a></li>
					<li><a href="services.jsp">Services</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</div>
			<div class="footer-contact">
				<h3>Contact Us</h3>
				<p>Email: <a href="mailto:support@cattlehub.com">support@cattlehub.com</a></p>
				<p>Phone: +91 98765 43210</p>
				<p>Location: Amravati, India</p>
			</div>
			<div class="footer-social">
				<h3>Follow Us</h3>
				<div class="social-icons">
					<a href="#"><img src="./img/fb.png" alt="Facebook"></a>
					<a href="#"><img src="./img/twitter.png" alt="Twitter"></a>
					<a href="#"><img src="./img/insta.jpg" alt="Instagram"></a>
					<a href="#"><img src="./img/yt.png" alt="LinkedIn"></a>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<p>© 2025 Cattle Hub. All rights reserved.</p>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function () {
			$.ajax({
				url: "load_cattle.jsp",
				success: function(data) {
					console.log(data);
					$("#loader").hide();
					$('#cattle-container').html(data);
				}
			});
		});
	</script>
</body>
</html>
