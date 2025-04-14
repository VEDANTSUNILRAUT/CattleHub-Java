<%@ page import="com.cattlehub.entities.users" %>
<%
    users currentUser = (users) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cattle Hub - Home</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <!-- Header Include -->
    <jsp:include page="header.jsp" />

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>WELCOME TO CATTLE HUB</h1>
            <p>Where you can find the best cattle products</p>
            <a href="product.jsp">
                <button class="productbtn">View Products</button>
            </a>
        </div>
    </section>

    <!-- What We Do Section -->
    <section class="what" id="about">
        <h1>What We Do?</h1>
        <div class="container">
            <div class="what-content">
                <h2>Our Vision</h2>
                <p>We aim to revolutionize cattle farming by promoting sustainable and ethical practices.</p>

                <h2>Our Mission</h2>
                <p>To provide high-quality cattle products while ensuring the well-being of livestock.</p>

                <h2>Our Aim</h2>
                <p>To bridge the gap between farmers and consumers with transparency and quality assurance.</p>
            </div>
            <div class="what-image">
                <img src="./img/vision.jpg" alt="Cattle Farming">
            </div>
        </div>
    </section>

    <!-- Call To Action -->
    <section class="cta">
        <div class="cta-content">
            <h2>Join the Future of Cattle Farming</h2>
            <p>Explore our high-quality cattle products and experience sustainable farming with us.</p>
            <a href="product.jsp" class="btn">View Products</a>
        </div>
    </section>

    <!-- Footer Include -->
    <jsp:include page="footer.jsp" />
</body>

</html>
