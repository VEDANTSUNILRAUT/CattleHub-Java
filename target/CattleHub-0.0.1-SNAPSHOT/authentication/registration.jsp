<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Register - Cattle Hub</title>
    <link rel="stylesheet" type="text/css" href="../css/loginSignup.css">
</head>
<body>
    <div class="container">
        <h2>Register</h2>
       <form action="authentication/RegistrationServlet" method="post">

            <label for="name">Full Name:</label>
            <input type="text" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" name="password" required>
            
            <label for="phone">Phone Number:</label>
            <input type="text" name="phone" required>
            
            <label for="address">Address:</label>
            <input type="text" name="address" required>
            
            <label for="role">Select Role:</label>
            <select name="role" required>
                <option value="buyer">Buyer</option>
                <option value="seller">Seller</option>
                <option value="admin">Admin</option>
            </select>
            
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>