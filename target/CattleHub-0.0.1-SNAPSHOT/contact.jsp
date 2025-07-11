<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/contact.css">
    <title>Contact Us</title>
</head>

<body>
    <!-- Header -->
    <div class="header">
        <nav>
            <div id="nav-logo">
                <img src="./img/navlogo.png" alt="Cattle Hub Logo">
            </div>
            <ul>
                <li><a href="/index.jsp">Home</a></li>
                <li><a href="./index.jsp/#about">About</a></li>
                <li><a href="./services.jsp">Services</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <div>
                <a href="./product.jsp">
                    <button class="productbtn">View Product</button>
                </a>
            </div>
        </nav>
    </div>
    <!-- Header -->

    <!-- Contact Form Section -->
    <section class="contact-section">
        <h2>Contact Us</h2>
        <p>Have any inquiries about cattle hub requirements? Feel free to reach out!</p>
        <form class="contact-form">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your full name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>

            <label for="message">Message</label>
            <textarea id="message" name="message" rows="5" placeholder="Write your message here" required></textarea>

            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </section>
    <!-- Contact Form Section -->
    <!-- footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-logo">
                <img src="./img/navlogo.png" alt="Cattle Hub Logo">
                <p>Connecting farmers with quality cattle products for a better future.</p>
            </div>

            <div class="footer-links">
                <h3>Quick Links</h3>
                <ul>
                          <li><a href="/index.jsp">Home</a></li>
                          <li><a href="./index.jsp/#about">About</a></li>
                          <li><a href="./services.jsp">Services</a></li>
                          <li><a href="#contact">Contact</a></li>
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
    <!-- footer -->
</body>

</html>