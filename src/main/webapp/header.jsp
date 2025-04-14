<%@ page import="com.cattlehub.entities.users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
* {
	padding: 0;
	margin: 0;
	font-family: "Poppins", sans-serif;
	box-sizing: border-box;
}

.header {
	background-color: white;
	border: 3px solid black;
}

nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px 40px;
}

#nav-logo img {
	width: 10rem;
	height: auto;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 2rem;
}

nav ul {
	display: flex;
	gap: 2rem;
	list-style: none;
}

nav ul li a {
	text-decoration: none;
	font-weight: bold;
	font-size: 1.2rem;
	color: black;
	transition: color 0.3s ease;
}

nav ul li a:hover {
	color: #dbc79a;
}

.profile-area {
	display: flex;
	align-items: center;
	gap: 1rem;
}

.profile-area img {
	height: 45px;
	width: 45px;
	border-radius: 50%;
	cursor: pointer;
}

.loginbtn {
	padding: 10px 20px;
	border: 2px solid black;
	border-radius: 20px;
	background-color: transparent;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.loginbtn:hover {
	background-color: #dbc79a;
	color: white;
}

.logoutbtn {
	padding: 10px 20px;
	border: 2px solid red;
	border-radius: 20px;
	background-color: transparent;
	font-weight: bold;
	color: red;
	cursor: pointer;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.logoutbtn:hover {
	background-color: red;
	color: white;
}
</style>
</head>
<body>

	<div class="header" id="home">
		<nav>
			<!-- Logo -->
			<div id="nav-logo">
				<img src="./img/navlogo.png" alt="Cattle Hub Logo">
			</div>

			<!-- Nav links + Right area -->
			<div class="nav-links">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="services.jsp">Services</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</div>
			<div>
				<%-- Auth Logic --%>
				<%
				users currentUser = (users) session.getAttribute("currentUser");
				if (currentUser != null) {
				%>
				<div class="profile-area">
					<p>
						Welcome,
						<%=currentUser.getFull_name()%></p>
					<a href="userProfile.jsp" title="Your Profile"> <img
						src="./img/profile-user.png" alt="Profile Icon">
					</a> <a href="LogoutServlet"><button class="logoutbtn">Logout</button></a>
				</div>
				<%
				} else {
				%>
				<div class="profile-area">
					<a href="registration.jsp"><button class="loginbtn">Register</button></a>
					<a href="login.jsp"><button class="loginbtn">Login</button></a>
				</div>
				<%
				}
				%>
			</div>
		</nav>
	</div>

</body>
</html>
