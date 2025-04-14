<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cattlehub.entities.users"%>
<%
users currentUser = (users) session.getAttribute("currentUser");

if (currentUser == null) {
	response.sendRedirect("login.jsp");
	return;
}

String full_name = currentUser.getFull_name();
String userEmail = currentUser.getEmail();
String userPhone = currentUser.getPhone();
String userAddress = currentUser.getAddress();
String userRole = currentUser.getRole();
String profileImage = currentUser.getProfile_image();
%>
<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(to right, #e0eafc, #cfdef3);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.profile-container {
	background-color: #ffffff;
	padding: 40px 30px;
	width: 100%;
	max-width: 500px;
	border-radius: 15px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
	position: relative;
	text-align: center;
}

.profile-container h2 {
	margin-bottom: 20px;
	color: #333;
	font-size: 28px;
}

.profile-pic {
	width: 120px;
	height: 120px;
	object-fit: cover;
	border-radius: 50%;
	margin-bottom: 20px;
	border: 3px solid #007bff;
}

.profile-details p {
	font-size: 16px;
	margin: 10px 0;
	color: #444;
	text-align: left;
}

.profile-details label {
	display: inline-block;
	width: 120px;
	font-weight: 600;
	color: #555;
}

.logout-btn {
	display: block;
	width: 100%;
	padding: 12px;
	text-align: center;
	margin-top: 30px;
	background: #ff4d4d;
	color: white;
	text-decoration: none;
	border-radius: 8px;
	font-weight: bold;
	transition: background 0.3s;
}

.logout-btn:hover {
	background: #e60000;
}

.home-btn {
	position: absolute;
	top: 20px;
	right: 20px;
	background-color: #007bff;
	padding: 8px 14px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s;
	color:white;
	font-size:15px;
	text-decoration:none;
}

.home-btn:hover {
	background-color: #0056b3;
}

.home-btn a {
	color: white;
	text-decoration: none;
	font-weight: bold;
}

.edit-btn {
	display: block;
	width: 100%;
	padding: 12px;
	text-align: center;
	margin-top: 30px;
	background: #007bff;
	color: white;
	text-decoration: none;
	border-radius: 8px;
	font-weight: bold;
	transition: background 0.3s;
}

.edit-btn:hover {
	background-color: #0056b3;
}
#profile-edit {
	margin-top: 20px;
	background-color: #f9f9f9;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

#profile-edit h3 {
	margin-bottom: 20px;
	color: #333;
	font-size: 22px;
}

#profile-edit form table {
	width: 100%;
}

#profile-edit form td {
	padding: 10px 5px;
}

#profile-edit label {
	font-weight: 600;
	color: #555;
	display: inline-block;
	width: 120px;
}

#profile-edit input[type="text"],
#profile-edit input[type="email"],
#profile-edit input[type="file"],
#profile-edit input[type="password"],
#profile-edit select {
	width: 100%;
	padding: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	font-size: 15px;
	transition: border-color 0.3s;
}

#profile-edit input:focus,
#profile-edit select:focus {
	border-color: #007bff;
	outline: none;
}

#profile-edit button[type="submit"] {
	padding: 12px 20px;
	background: #28a745;
	color: white;
	border: none;
	border-radius: 8px;
	font-weight: bold;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
}

#profile-edit button[type="submit"]:hover {
	background: #218838;
}
</style>
</head>
<body>
	<div class="profile-container">
		<a href="home.jsp" class="home-btn">Home</a>


		<%
		if (profileImage != null && !profileImage.trim().isEmpty()) {
		%>
		<img src="uploads/<%=profileImage%>" alt="Profile Picture"
			class="profile-pic" />
		<%
		} else {
		%>
		<img src="assets/default-user.png" alt="Default Profile"
			class="profile-pic" />
		<%
		}
		%>

		<h2>User Profile</h2>

		<div class="profile-details" id="profile-detail">
			<p>
				<label>Full Name:</label>
				<%=full_name%></p>
			<p>
				<label>Email:</label>
				<%=userEmail%></p>
			<p>
				<label>Phone:</label>
				<%=userPhone%></p>
			<p>
				<label>Address:</label>
				<%=userAddress%></p>
			<p>
				<label>Role:</label>
				<%=userRole%></p>

		</div>
		<!--profile-edit -->
<div id="profile-edit" style="display: none;">
    <h3>Please Edit Carefully...</h3>
    <form action="EditServlet" method="post" enctype="multipart/form-data">
        <table style="margin: 0 auto; text-align: left;">
            <tr>
                <td><label for="user_name">Full Name:</label></td>
                <td><input type="text" id="user_name" name="user_name" value="<%= currentUser.getFull_name() %>" required></td>
            </tr>
            <tr>
                <td><label for="user_email">Email:</label></td>
                <td><input type="email" id="user_email" name="user_email" value="<%= currentUser.getEmail() %>" required></td>
            </tr>
            <tr>
                <td><label for="user_phone">Phone:</label></td>
                <td><input type="text" id="user_phone" name="user_phone" value="<%= currentUser.getPhone() %>" required></td>
            </tr>
            <tr>
                <td><label for="user_address">Address:</label></td>
                <td><input type="text" id="user_address" name="user_address" value="<%= currentUser.getAddress() %>" required></td>
            </tr>
            <tr>
                <td><label for="user_role">Role:</label></td>
                <td>
                    <select id="user_role" name="user_role" required>
                        <option value="buyer" <%= "buyer".equals(userRole) ? "selected" : "" %>>Buyer</option>
                        <option value="seller" <%= "seller".equals(userRole) ? "selected" : "" %>>Seller</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="profile_image">Profile Image:</label></td>
                <td><input type="file" id="profile_image" name="profile_image" accept="image/*"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center; padding-top: 15px;">
                    <button type="submit" style="padding: 10px 20px; background: #28a745; color: white; border: none; border-radius: 5px; font-weight: bold;">Update</button>
                </td>
            </tr>
        </table>
    </form>
</div>

		
         <!-- button -->
		<a href="#" id="edit-btn" class="edit-btn">Edit</a>

		<a href="LogoutServlet" class="logout-btn">Logout</a>
	</div>
<script>
	$(document).ready(function() {
		let  editStatus=false;
		
		
		$('#edit-btn').click(function(e) {
		
		if(editStatus==false){
			$("#profile-detail").hide();
			$("#profile-edit").show();
			editStatus=true;
			$(this).text("Back")
		}else{
			
			$("#profile-detail").show();
			$("#profile-edit").hide();
			editStatus=false;
			$(this).text("Edit")
			
		}
			
		});
	});
</script>


</body>
</html>
