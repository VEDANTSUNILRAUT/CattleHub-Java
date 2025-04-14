<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="com.cattlehub.dao.CattleDao" %>
<%@ page import="com.cattlehub.entities.Category" %>
<%@ page import="com.cattlehub.Servlet.DBConnection" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Cattle</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e6f2f1;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            max-width: 550px;
            width: 90%;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        form label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
            color: #444;
        }

        form input[type="text"],
        form input[type="number"],
        form input[type="file"],
        form select {
            width: 100%;
            padding: 10px 14px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.3s;
        }

        form input:focus,
        form select:focus {
            border-color: #4caf50;
            outline: none;
        }

        form button {
            width: 100%;
            padding: 14px;
            background-color: #4caf50;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form button:hover {
            background-color: #43a047;
        }

        @media (max-width: 480px) {
            .container {
                padding: 25px;
            }

            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Add Cattle Details</h2>
    <form id="add-cattle-form" method="post" enctype="multipart/form-data" action="AddCattleServlet">
        <label for="name">Cattle Name</label>
        <input type="text" name="name" id="name" placeholder="Cattle Name" required>

        <label for="cid">Cattle Type</label>
        <select name="cid" id="cid" required>
            <option value="">Select Cattle Type</option>
            <%
                try {
                    CattleDao cattled = new CattleDao(DBConnection.getConnection());
                    ArrayList<Category> list = cattled.getCategory();
                    for (Category c : list) {
            %>
                        <option value="<%= c.getCid() %>"><%= c.getName() %></option>
            <%
                    }
                } catch (Exception e) {
                    out.println("<option disabled>Error loading categories</option>");
                    e.printStackTrace();
                }
            %>
        </select>

        <label for="breed">Breed</label>
        <input type="text" name="breed" id="breed" placeholder="Breed" required>

        <label for="age">Age (Years)</label>
        <input type="number" name="age" id="age" placeholder="Age in years" required>

        <label for="weight">Weight (Kg)</label>
        <input type="text" name="weight" id="weight" placeholder="Weight in kg" required>

        <label for="price">Price (₹)</label>
        <input type="text" name="price" id="price" placeholder="Price in ₹" required>

        <label for="cattle_img">Add Cattle Image</label>
        <input type="file" name="cattle_img" id="cattle_img" accept="image/*" required>

        <button type="submit">Add Cattle</button>
    </form>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    $(document).ready(function () {
        $("#add-cattle-form").on("submit", function (event) {
            event.preventDefault();

            const formData = new FormData(this);

            $.ajax({
                url: "AddCattleServlet",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    data = data.trim();
                    if (data === "done") {
                        Swal.fire({
                            title: 'Cattle Added!',
                            text: 'Your cattle has been added successfully.',
                            icon: 'success',
                            confirmButtonText: 'Go to Product Page'
                        }).then(() => {
                            window.location.href = "product.jsp";
                        });
                    } else if (data === "unauthorized") {
                        Swal.fire({
                            title: 'Login Required!',
                            text: 'Please login to continue.',
                            icon: 'warning',
                            confirmButtonText: 'Login'
                        }).then(() => {
                            window.location.href = "login.jsp";
                        });
                    } else {
                        Swal.fire("Oops!", "Something went wrong while adding cattle.", "error");
                    }
                },
                error: function () {
                    Swal.fire("Error", "Something went wrong with the request.", "error");
                }
            });
        });
    });
</script>
</body>
</html>
