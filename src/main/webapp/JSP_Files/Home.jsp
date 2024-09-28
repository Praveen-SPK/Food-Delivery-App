<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Website</title>
    <link rel="stylesheet" href="../CSS_Files/Style.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>

    <div class="header-section">
        <div class="logo">
            <img src="../Images/img20.png" alt="#">
        </div>

        <div class="section-link">
            <ul>
                <li><a href="#home"><button>Home</button></a></li>
                <li><a href="#about"><button>About</button></a></li>
                <li><a href="#location"><button>Location</button></a></li>
                <li><a href="#contact"><button>Contact</button></a></li>
            </ul>
        </div>

        <a href="Register.jsp"><button class="head-btn">Sign In</button></a>

    </div>

    <div class="body-section">
        <div class="home-section" id="home">
            <div class="home-content">
                <h1>Are You Hungry ? </h1>
                <h3>Don't Wait !!!</h3>
                <p>Fresh ,Delicious meal to reach your optimum health and fitness</p>
                <a href="Register.jsp"><button>View Menu<ion-icon name="arrow-forward-outline" class="ionic-icon"></ion-icon></button></a>
            </div>


        </div>

        <div class="about-section" id="about">
            <div class="about-content">
                <div class="about-img">
                    <img src="../Images/about_img1.png" alt="#">
                </div>
                <div class="about-items">
                    <div>
                        <h1>Why FoodLife ?</h1>
                    </div>
                    <div class="inline-content">
                        <div class="inline">
                            <div class="inline-img">
                                <ion-icon name="laptop-outline" class="icon"></ion-icon>
                            </div>
                            <div class="inline-item">
                                <h2>Complete Online Solution</h2>
                                <p>Our Online Ordering Solution allows you to take orders through your own
                                    websites.Your Own
                                    Mobile App. And through FoodChow website and Mobile App .</p>
                            </div>
                        </div>
                        <div class="inline">
                            <div class="inline-img">
                                <ion-icon name="trophy-outline"class="icon"></ion-icon>
                            </div>
                            <div class="inline-item">
                                <h2>Win Win Business Model</h2>
                                <p>From Quick Setup to Instant Order Notifications.Dynamic Pricing,Instant Payment
                                    and
                                    Social Media Marketing.We have you covered.</p>
                            </div>
                        </div>
                        <div class="inline">
                            <div class="inline-img">
                                <ion-icon name="chatbox-ellipses-outline"class="icon"></ion-icon>
                            </div>
                            <div class="inline-item">
                                <h2>WorldWide Support</h2>
                                <p>FoodLife support is available worldwide.Contact our team and we'll connect you to
                                    an
                                    expert to get your issue resolved within 24 Business hours. </p>
                            </div>
                        </div>
                        <div class="inline">
                            <div class="inline-img">
                                <ion-icon name="map-outline"class="icon"></ion-icon>
                            </div>
                            <div class="inline-item">
                                <h2>Single & Multiple Outlets</h2>
                                <p>Do you have your restaurant in multiple locations? Foodlife Multi-Outlet food
                                    Ordering
                                    Solution will help you manage all these outlets with Super Admin functionality.
                                </p>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

        <div class="location-section" id="location">
           
            <div class="location-address">
                <div class="location-header">
                    <h2>Our Branch Location</h2>
                </div>
                <div class="location-content">
                    <p>Address : XYZ ,Bharathi Nagar,Tharamani,Chennai.</p>
                    <p>Mobile : 90802722XX</p>
                    <p>EMail-Id: abc2024@gmail.com</p>
                    <p>Track Us On:</p>
                    <p><ion-icon name="navigate-outline" class="icon"></ion-icon></p>
                </div>
            </div>
            <div class="location-map">
                <img src="../Images/location_img.png" alt="#">
            </div>

        </div>
    </div>

    <div class="footer-section" id="contact">
        <div class="follow-link-section">
          
                <p>Follow Us On</p>
                <ion-icon name="logo-linkedin" class="icon-foot"></ion-icon>
                <ion-icon name="logo-instagram"class="icon-foot"></ion-icon>
                <ion-icon name="logo-twitter"class="icon-foot"></ion-icon>

        </div>
        <div class="form-section">
            <form action="" method="post" class="form">
            <div class="input-grp">
                <input type="text" name="n1">
                <label for="n1">Name</label>
            </div>
            
            <div class="input-grp">
                <input type="email" name="n2">
                <label for="n2">Email</label>
            </div>

            <div class="input-grp">
                <textarea name="n3"></textarea>
                <label for="n3">Message Here</label>
            </div>
            <button type="submit" >Send Us</button>
        </form>
    </div>

    </div>




</body>

</html>