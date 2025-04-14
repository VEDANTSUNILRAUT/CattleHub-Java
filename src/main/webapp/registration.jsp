<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Register - Cattle Hub</title>
    <link rel="stylesheet" type="text/css" href="css/loginSignup.css">
</head>
<body>
    <div class="container">
        <h2>Register</h2>
      <form action="RegistrationServlet" method="post">


            <label for="name">Full Name:</label>
            <input type="text" name="full_name" required>
            
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
            
            <button type="submit" style="background-color:#dbc79a;">Register</button>
        </form>
    </div>
</body>
<script>
    // Check if the URL has a "success" or "error" parameter
    const urlParams = new URLSearchParams(window.location.search);
    
    if (urlParams.has('success')) {
        alert("Registration successful!");
        // Optional: Clear form fields after success
        document.querySelector("form").reset(); 
        // Optional: Redirect to another page after 2 seconds
        setTimeout(() => {
            window.location.href = "login.jsp"; // Replace with your target page
        }, 500);
    }
    
    if (urlParams.has('error')) {
        alert("Registration failed. Please try again!");
    }
</script>
</html>