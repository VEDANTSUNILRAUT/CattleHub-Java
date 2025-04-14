<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cattlehub.dao.CattleDao" %>
<%@ page import="com.cattlehub.entities.cattle" %>
<%@ page import="com.cattlehub.Servlet.DBConnection" %>
<%@ page import="java.util.List" %>

<style>
.cattle-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 20px;
    padding: 20px;
}

.cattle-card {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease;
    display: flex;
    flex-direction: column;
}

.cattle-card:hover {
    transform: translateY(-5px);
    border:1px solid black;
box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);

}

.cattle-card img {
    width: 100%;
    height: 220px;
    object-fit: cover;
}

.cattle-card .card-body {
    padding: 16px;
}

.cattle-card h5 {
    margin-bottom: 8px;
    font-size: 20px;
    color: #333;
}

.cattle-card h6 {
    font-size: 14px;
    color: #777;
    margin-bottom: 12px;
}

.cattle-details p {
    margin: 4px 0;
    font-size: 14px;
    color: #444;
}

.card-footer {
    padding: 10px 16px;
    background-color: #f9f9f9;
    border-top: 1px solid #eee;
    font-size: 13px;
    color: #666;
    text-align: right;
display: flex;
justify-content: space-between;

}

.card-footer form {
    margin: 0;
}

.btn-buy, .btn-cart {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 8px 12px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 13px;
    margin-right: 5px;
    transition: background-color 0.3s ease;
}

.btn-buy:hover {
    background-color: #0056b3;
}

.btn-cart {
    background-color: #28a745;
}

.btn-cart:hover {
    background-color: #1e7e34;
}

</style>

<div class="cattle-grid">
<%
    try {
        CattleDao dao = new CattleDao(DBConnection.getConnection());
        List<cattle> cattleList = dao.getAllCattle();

        for (cattle cattle : cattleList) {
            if (cattle != null) {
%>
    <div class="cattle-card">
        <%
            String imagePath = cattle.getCattle_img();
            String imageUrl = (imagePath != null && !imagePath.isEmpty())
                ? request.getContextPath() + "/cattle_images/" + imagePath
                : request.getContextPath() + "/assets/default.jpg";
        %>
        <img src="<%= imageUrl %>" alt="<%= cattle.getName() %>">
        <div class="card-body">
            <h5><%= cattle.getName() %></h5>
            <h6>ID: <%= cattle.getCattle_id() %> | Breed: <%= cattle.getBreed() %></h6>
            <div class="cattle-details">
                <p><strong>Age:</strong> <%= cattle.getAge() %> years</p>
                <p><strong>Weight:</strong> <%= cattle.getWeight() %> kg</p>
                <p><strong>Price:</strong> ₹<%= String.format("%,.2f", cattle.getPrice()) %></p>
                <p><strong>Registered:</strong> <%= cattle.getRegistered_date() %></p>
            </div>
        </div>
       <div class="card-footer">
   <div style="display: flex; justify-content: center; align-items: center;">Seller ID: <%= cattle.getSeller_id() %></div>
    <div>
    <form action="BuyNowServlet" method="post" style="display:inline;">
        <input type="hidden" name="cattleId" value="<%= cattle.getCattle_id() %>">
        <button type="submit" class="btn-buy">Buy Now</button>
    </form>
    <form action="AddToCartServlet" method="post" style="display:inline;">
        <input type="hidden" name="cattleId" value="<%= cattle.getCattle_id() %>">
        <button type="submit" class="btn-cart">Add to Cart</button>
    </form>
    </div>
</div>

    </div>
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
    <div class="alert alert-danger">Error loading cattle data.</div>
<%
    }
%>
</div>
