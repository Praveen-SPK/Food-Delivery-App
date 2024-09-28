<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
<link rel="stylesheet" href="../CSS_Files/Admin.css">
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule 
src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="../JS_Files/Admin.js" defer></script>
</head>

<body>
<% 
    	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    	HttpSession sess = request.getSession();
        if (sess.getAttribute("adminEmail")==null) {
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
				<li><button onclick="addFun()">Insert</button></li>
				<li><button onclick="removeFun()">Remove</button></li>
                <li><button onclick="updateFun()">Update</button></li>
                <li><form action="../viewProduct" method="post" ><button type="submit">View</button></form></li>
				<li><form action="./AdminOrders.jsp" method="post" ><button type="submit">Order's</button></form></li>
				
			</ul>
		</div>
		<a href="../logout"><button class="head-btn">LogOut</button></a>
	</div>


	<div class="body-section">



		<div class="section1">


			<div class="empty-section " style="display: block;"
				id="empty-section">
				<div class="form-result">
					<% String status=request.getParameter("status");
        			%>
					<%if("Added".equals(status)) {%>
					<p>Product Added SuccessFully !!!</p>
					<%}
        			else if("Denied".equals(status)){
        			%>
						<p style="color: red">Process Denied !!!</p>
					<%}
        			else if("Removed".equals(status)){
        			%>
						<p >Product Deleted SuccessFully !!!</p>
					
					<%}
        			else if("Updated".equals(status)){
        			%>
						<p >Product Updated SuccessFully!!!</p>
				
					<%} else{ %>
					<p style="color: blue;">Welcome Back Chief !!!</p>
					<%} %>
				</div>
				<div class="empty-one">
					<img src="../Images/AdminDashBoard.svg" alt="#">
					<p>Admin DashBoard</p>
				</div>
				<div class="empty-two">
					<div class="admin-list">
						<ion-icon name="beer" class="icon"></ion-icon>
						<h3>Add and Delete Products</h3>
						<p>Add and Remove Whatever Products You Want to Add or Remove
							in the Menu List</p>
					</div>
					<div class="admin-list">
						<ion-icon name="refresh-circle" class="icon"></ion-icon>
						<h3>Update User Products</h3>
						<p>Update and Manage the Products Details in the Menu List</p>
					</div>
					<div class="admin-list">

						<ion-icon name="eye" class="icon"></ion-icon>
						<h3>View User Products</h3>
						<p>View the Products Available in the Menu List and Manage the
							Products Availability</p>
					</div>
					<div class="admin-list">
						<ion-icon name="bag-check" class="icon"></ion-icon>
						<h3>Check User Orders</h3>
						<p>Check User's Order and Start to Delivery the Products in the Menu List</p>
					</div>
				</div>
			</div>

			  <div class="add-products-section section" style="display: none;" id="add-products-section">
                <div class="form-section">
                    <form action="../addProducts"  method="post" onsubmit="formSubmit()" enctype="multipart/form-data">
                        <div class="form-title">
                            <span>Add Item's</span>
                        </div>

                        <div class="form-input">
                            <label for="p-id">Enter Product Id</label><br>
                            <input type="text" name="p-id" required>
                            
                        </div>
                        <div class="form-input">
                            <label for="p-name">Enter Product Name</label><br>
                            <input type="text" name="p-name" required>
                            
                        </div>
                        <div class="form-input">
                            <label for="p-cost">Enter Product Price</label><br>
                            <input type="text" name="p-cost" required>
                            
                        </div>
                        <div class="form-input">
                            <label for="p-stock">Enter Product Quantity</label><br>
                            <input type="text" name="p-stock" required>
                            
                        </div>
                        <div class="form-input">
                            <label for="p-img">Enter Product Img-Url</label><br>
                            <input type="file" name="p-img" required>
                            
                        </div>
                        <div class="form-bn">
                        <button type="submit" class="form-btn">Add Product</button>
                        </div>
                    </form>
                </div>


            </div>

            <div class="update-products-section section" style="display: none;" id="update-products-section">
                <div class="form-section " >
                    <form action="../updateProducts" method="post" onsubmit="formSubmit()" enctype="multipart/form-data">
                        <div class="form-title">
                            <span>Update Item's</span>
                        </div>

                        <div class="form-input">
                            <label for="p-id">Enter Product Id</label><br>
                            <input type="text" name="p-id" required>
                            
                        </div>
                        <div class="form-input">
                            <label for="p-name">Change Product Name</label><br>
                            <input type="text" name="p-name">
                            
                        </div>
                        <div class="form-input">
                            <label for="p-cost">Change Product Price</label><br>
                            <input type="text" name="p-cost" >
                           
                        </div>
                        <div class="form-input">
                            <label for="p-stock">Change Product Quantity</label><br>
                            <input type="text" name="p-stock">
                            
                        </div>
                        <div class="form-input">
                            <label for="p-img">Change Product Img-Url</label><br>
                            <input type="file" name="p-img" >
                            
                        </div>
                        <div class="form-bn">
                        	<button type="submit" class="form-btn">Update Product</button>
                        </div>
                    </form>
                </div>

            </div>

            <div class="view-products-section" style="display: none;" id="view-products-section">

                <div class="section-title">
                    <span> Available Item's </span>
                </div>
                <div class="products-section">

                    // jsp code here



                </div>


            </div>

            <div class="delete-products-section section" style="display: none; height: 45%;" id="delete-products-section">
                <div class="form-section">
                    <form action="../deleteProducts" method="post"  onsubmit="formSubmit()">
                        <div class="form-title delete1 ">
                            <span>Delete Item's</span>
                        </div>

                        <div class="form-input delete">
                            <label for="p-id">Enter Product-Id</label>
                            <input type="text" name="p-id" required>
                            
                        </div>

                    <div class="form-bn">
                        <button type="submit" class="form-btn">Delete Product</button>
                    </div>
                    </form>
                </div>

            </div>
			<div class="view-orders-section " style="display: none;"
				id="view-orders-section">

				<div class="section-title">
					<span>Order's Received</span>
				</div>

				<div class="orders-section">


					<!-- jsp code here...<!--  -->
				
				</div>
			</div>
		</div>
	</div>
	</div>




</body>

</html>





