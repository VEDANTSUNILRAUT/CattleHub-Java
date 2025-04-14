<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            min-height: 100vh;
            background-color: #f4f4f4;
        }

        .sidebar {
            width: 220px;
            background-color: #1f1f1f;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            margin: 15px 0;
            font-size: 18px;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #333;
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .header {
            background-color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .header .title {
            font-size: 22px;
            font-weight: bold;
            color: #333;
        }

        .profile-icon {
            width: 40px;
            height: 40px;
            background-color: #1f1f1f;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .dashboard-body {
            padding: 30px;
        }

        .dashboard-body h3 {
            font-size: 26px;
            margin-bottom: 10px;
        }

        .dashboard-body p {
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="manageUsers.jsp">Users</a>
        <a href="manageCattles.jsp">Cattles</a>
        <a href="LogoutServlet">Logout</a>
    </div>

    <div class="main-content">
        <div class="header">
            <div class="title">Hello Admin</div>
            <div class="profile-icon">A</div>
        </div>

        <div class="dashboard-body">
            <h3>Welcome to the Admin Dashboard!</h3>
            <p>Use the sidebar to manage users and cattle records efficiently.</p>
        </div>
    </div>

</body>
</html>
