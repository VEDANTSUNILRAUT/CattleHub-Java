<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Login - Cattle Hub</title>
    <link rel="stylesheet" type="text/css" href="../css/loginSignup.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label for="email">Email:</label>
            <input type="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" name="password" required>
            
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>