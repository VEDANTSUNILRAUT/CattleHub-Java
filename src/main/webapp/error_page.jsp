<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Oops! Something Went Wrong</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #f9f9f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .error-container {
            text-align: center;
            padding: 60px 20px;
        }

        .error-box {
            display: inline-block;
            background: #fff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            max-width: 500px;
        }

        h1 {
            font-size: 48px;
            color: #e74c3c;
            margin-bottom: 10px;
        }

        p {
            font-size: 18px;
            color: #333;
            margin-bottom: 30px;
        }

        .btn {
            text-decoration: none;
            background-color: #e74c3c;
            color: white;
            padding: 12px 25px;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-box">
            <h1>Oops!</h1>
            <p>Sorry, something went wrong during registration.<br>Please try again later.</p>
            <a class="btn" href="registration.jsp">Try Again</a>
        </div>
    </div>
</body>
</html>
