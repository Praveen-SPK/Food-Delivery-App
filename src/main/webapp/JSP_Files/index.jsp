<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import ="com.spk.DAO.DAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodLife</title>
    <link rel="stylesheet" href="../CSS_Files/index.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body>
   <% 
    	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    	HttpSession sess = request.getSession();
        if (sess.getAttribute("userEmail")==null) {
        	response.sendRedirect("./Register.jsp");	
        	return;
        }
    %>
    <div class="header-section">
        <div class="logo">
            <img src="../Images/img20.png" alt="#">
        </div>

        <div class="section-link">
            <ul>
                <li><a href="#menu"><button>Menu</button></a></li>
                <li><a href="#about"><button>About</button></a></li>
                <li><a href="#location"><button>Location</button></a></li>
                <li><a href="#contact"><button>Contact</button></a></li>
                <li><a href="./Order.jsp"><button>My-Order's</button></a></li>
            </ul>
        </div>
        <div>
        	<form action="../logout" class="head-form"><button class="head-btn">LogOut</button></form>
    	</div>
    </div>

    <div class="body-section">
        <div class="main-section" id="menu">
            <h1>Enjoy Your Meals !!! </h1>
            <div class="main-content">
                <% 
                try {
        			Connection con=DAO.dbConnection();
        			String query="select * from productDetails";
        			Statement st=con.createStatement();
        			ResultSet rs= st.executeQuery(query);
             
                    while(rs.next()){
                    	String pImg=rs.getString(5);
                    	String pName=rs.getString(2);
                    	int pId=rs.getInt(1);
                    	int pStock=rs.getInt(4);
                    	int pCost=rs.getInt(3);
                %>
                
                <form action="../AddCart" method="post" onsubmit="return updateCount(<%=pId %>)">
                    <input type="hidden" value="<%=pName %>" name="pname">
                    <input type="hidden" value="<%=pImg %>" name="pimg">
                    <input type="hidden" value="<%=pCost %>" name="pcost">
                    <input type="hidden" value="<%=pStock %>" name="pstock">
                    <input type="hidden" value="<%=pId %>" name="pid">
                    <input type="hidden" id="hidden-count-<%=pId %>" value="1" name="count">
                    
                    
                    <div class="card-section">
                        <div class="p-img">
                            <img alt="#" src="../Images/<%=pImg%>">
                        </div>
                        <div class="p-text">
                            <h2><%=pName %></h2>
                            <h2>Cost : Rs.<%=pCost %> </h2>
                        </div>
                        <div class="increment-section">
                            <button type="button" onclick="decrement(this)"><ion-icon name="remove-circle-outline" class="icons"></ion-icon></button>
                        	<h3 id="count-<%=pId %>" data-count="1">1</h3>
                        	<button type="button" onclick="increment(this)"><ion-icon name="add-circle-outline" class="icons"></ion-icon></button>
                        </div>
                        <div class="p-buy">
                            <button type="submit">Buy Now</button>
                        </div>
                    </div> 
                </form>               

                <% }} 
                catch(Exception e){
                	e.printStackTrace();
                }
                %>                  
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
                                    websites. Your Own Mobile App. And through FoodChow website and Mobile App.</p>
                            </div>
                        </div>
                        <div class="inline">
                            <div class="inline-img">
                                <ion-icon name="trophy-outline"class="icon"></ion-icon>
                            </div>
                            <div class="inline-item">
                                <h2>Win Win Business Model</h2>
                                <p>From Quick Setup to Instant Order Notifications.Dynamic Pricing,Instant Payment
                                    and Social Media Marketing. We have you covered.</p>
                            </div>
                        </div>
                        <div class="inline">
                            <div class="inline-img">
                                <ion-icon name="chatbox-ellipses-outline"class="icon"></ion-icon>
                            </div>
                            <div class="inline-item">
                                <h2>WorldWide Support</h2>
                                <p>FoodLife support is available worldwide.Contact our team and we'll connect you to
                                    an expert to get your issue resolved within 24 Business hours.</p>
                            </div>
                        </div>
                        <div class="inline">
                            <div class="inline-img">
                                <ion-icon name="map-outline"class="icon"></ion-icon>
                            </div>
                            <div class="inline-item">
                                <h2>Single & Multiple Outlets</h2>
                                <p>Do you have your restaurant in multiple locations? Foodlife Multi-Outlet food
                                    Ordering Solution will help you manage all these outlets with Super Admin functionality.
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
                    <p>Address : XYZ, Bharathi Nagar, Tharamani, Chennai.</p>
                    <p>Mobile : 90802722XX</p>
                    <p>Email: abc2024@gmail.com</p>
                    <p>Visit Us :</p>
                    <p title="https://www.googlemap.com/map/foodlife"><ion-icon name="navigate-outline" class="icon"></ion-icon></p>
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
    
    

    <script>
    
    function increment(button) {
        const countElement = button.previousElementSibling;
        let count = parseInt(countElement.getAttribute('data-count'));
        count++;
        countElement.setAttribute('data-count', count);
        countElement.innerHTML = count;
        
    }


    function decrement(button) {
        const countElement =  button.nextElementSibling; 
        let count = parseInt(countElement.getAttribute('data-count'));
        if (count > 1) {
            count--;
            countElement.setAttribute('data-count', count);
            countElement.innerHTML = count;
        }
    }

    function updateCount(productId) {
        const countElement = document.getElementById("count-" + productId);
        const hiddenInput = document.getElementById("hidden-count-" + productId);
        let count = countElement.getAttribute('data-count');
        hiddenInput.value = count;
        return true; 
    }
    </script>
    
 
</body>
</html>
