<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Objects" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cattle Hub</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header" id="home">
        <nav>
            <div id="nav-logo">
                <img src="./img/navlogo.png" alt="Cattle Hub Logo">
            </div>
            <ul style="border: 2px solid black; border-radius: 15px; padding: 5px 25px; margin-right: 110px;">
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="./services.jsp">Services</a></li>
                <li><a href="./contact.jsp">Contact</a></li>
            </ul>
            
            <%-- Check if the user is logged in --%>
            <%
                String userEmail = (String) session.getAttribute("userEmail");
                if (userEmail != null) {
            %>
                <div style="display:flex; align-items:center; gap:1rem;">
                    <p>Welcome, <%= userEmail %></p>
                    <a href="userProfile.jsp">
                        <img style="height:50px; width:50px; cursor:pointer;" alt="Profile-Picture" src="./img/profile-user.png">
                    </a>
                    <a href="LogoutServlet">
                        <button class="logoutbtn">Logout</button>
                    </a>
                </div>
            <% 
                } else { 
            %>
                <div style="display:flex; gap:1rem;">
                    <div>
                        <a href="registration.jsp">
                            <button class="loginbtn">Register</button>
                        </a>
                    </div>
                    <div>
                        <a href="login.jsp">
                            <button class="loginbtn">Login</button>
                        </a>
                    </div>
                </div>
            <% } %>
        </nav>
    </div>
    
    <section class="hero">
        <div class="hero-content">
            <h1>WELCOME TO CATTLE HUB</h1>
            <p>Where you can find the best cattle products</p>
        </div>
    </section>
    
    <section class="what" id="about">
        <h1>What We Do ?</h1>
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
    
    <section class="cta">
        <div class="cta-content">
            <h2>Join the Future of Cattle Farming</h2>
            <p>Explore our high-quality cattle products and experience sustainable farming with us.</p>
        </div>
    </section>

    <footer>
        <div class="footer-container">
            <div class="footer-logo">
                <img src="./img/navlogo.png" alt="Cattle Hub Logo">
                <p>Connecting farmers with quality cattle products for a better future.</p>
            </div>
            <div class="footer-links">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#home">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="./services.jsp">Services</a></li>
                    <li><a href="./contact.jsp">Contact</a></li>
                </ul>
            </div>
            <div class="footer-contact">
                <h3>Contact Us</h3>
                <p>Email: <a href="mailto:support@cattlehub.com">support@cattlehub.com</a></p>
                <p>Phone: +91 98765 43210</p>
                <p>Location: Amravati, India</p>
            </div>
            <div class="footer-social">
                <h3>Follow Us</h3>
                <div class="social-icons">
                    <a href="#"><img src="./img/fb.png" alt="Facebook"></a>
                    <a href="#"><img src="./img/twitter.png" alt="Twitter"></a>
                    <a href="#"><img src="./img/insta.jpg" alt="Instagram"></a>
                    <a href="#"><img src="./img/yt.png" alt="LinkedIn"></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© 2025 Cattle Hub. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
