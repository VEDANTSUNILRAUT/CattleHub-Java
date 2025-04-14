<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>

footer {
  /* background-color: #1a1a1a; */
  color: black;
  padding: 50px 20px;
}

.footer-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  max-width: 1200px;
  margin: auto;
}

.footer-logo {
  flex: 1;
  min-width: 250px;
}

.footer-logo img {
  width: 150px;
  margin-bottom: 10px;
}

.footer-logo p {
  font-size: 14px;
  line-height: 1.5;
  color: black;
}

.footer-links,
.footer-contact,
.footer-social {
  flex: 1;
  min-width: 200px;
}

.footer-links h3,
.footer-contact h3,
.footer-social h3 {
  font-size: 18px;
  margin-bottom: 15px;
  color: black;
}

.footer-links ul {
  list-style: none;
  padding: 0;
}

.footer-links ul li {
  margin-bottom: 10px;
}

.footer-links ul li a {
  text-decoration: none;
  color: black;
  font-size: 14px;
}

.footer-links ul li a:hover {
  color: black;
}

.footer-contact p {
  font-size: 14px;
  margin-bottom: 10px;
  color: black;
}

.footer-contact a {
  color: black;
  text-decoration: none;
}

.footer-contact a:hover {
  text-decoration: underline;
}
.footer-social {
  text-align: center;
}
.social-icons {
  display: flex;
  gap: 15px;
}

.social-icons img {
  width: 55px;
  height: 55px;
  transition: transform 0.3s ease;
}

.social-icons img:hover {
  transform: scale(1.2);
}

.footer-bottom {
  text-align: center;
  margin-top: 30px;
  padding-top: 15px;
  border-top: 1px solid #333;
  font-size: 14px;
  color: black;
}

</style>
</head>
<body>

<footer>
    <div class="footer-container">
        <div class="footer-logo">
            <img src="./img/navlogo.png" alt="Cattle Hub Logo">
            <p>Connecting farmers with quality cattle products for a better future.</p>
        </div>
        <div class="footer-links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="contact.jsp">Contact</a></li>
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