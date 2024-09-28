<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    <%@ page import="com.spk.DAO.RetrieveDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<link rel="stylesheet" href="../CSS_Files/AdminOrder.css">
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body>

	<div class="header-section">
        <div class="logo">
            <img src="../Images/img20.png" alt="#">
        </div>
        <div class="section-link">
            <h3>Order's Page</h3>
        </div>
        <div class="btn-section">
	        <a href="./Admin.jsp" class="head-form1"><button class="head-btn">Go Back</button></a>
    	</div>
    </div>
    
    <h2 align="center">Welcome Back Admin></h2>
<table align="center">
<thead style="height:50px; border=2px solid red">
<tr>
<th>Order Id </th>
<th>User Name </th>
<th>User Email </th>
<th>Food Id </th>
<th>Food Name</th>
<th>Price</th>
<th>Ordered Quantity</th>
<th>Balance Quantity</th>
<th>Order-Time</th>
<th>Current Status</th>
<th>Proceed</th>


</tr>

</thead>
<tbody>
<% 
/* HttpSession ses=request.getSession();
ResultSet ans=(ResultSet)ses.getAttribute("AdminOrders");
 */
 ResultSet result=RetrieveDetails.showOrderDetails();
try{
	while(result.next()){
	%>
		<tr>
			<td><p align="center"><%=result.getString(9) %></p></td>
			<td><p align="center"><%=result.getString(1) %></p></td>
			<td><p align="center"><%=result.getString(2) %></p></td>
			<td><p align="center"><%=result.getString(4) %></p></td>
			<td><p align="center"><%=result.getString(7) %></p></td>
			<td><p align="center"><%=result.getString(6) %></p></td>
			<td><p align="center"><%=result.getString(3) %></p></td>
			<td><p align="center"><%=result.getString(5) %></p></td>
			<td><p align="center"><%=result.getString(10) %></p></td>
			<td><p align="center"><%=result.getString(8) %></p></td>
			<td>
			
				<a href="../AdminRemoveBtn?value=<%=result.getString(9) %>"><ion-icon name="close-circle" class="icon1"></ion-icon></a>
				<a href="../AdminProceedBtn?value=<%=result.getString(9) %>"><ion-icon name="arrow-forward-circle" class="icon2"></ion-icon></a></td>
			
		</tr>
	<%	}
	}
	catch(Exception e){
		e.printStackTrace();
	}


%>
</tbody>
</table>
    
	
	
</body>
</html>