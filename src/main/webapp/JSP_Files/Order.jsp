<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    <%@ page import="com.spk.DAO.RetrieveDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order's Page</title>
<link rel="stylesheet" href="../CSS_Files/myorder.css">
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
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
            <h3>Thanks For Choosing Food Life </h3>
        </div>
        <div class="btn-section">
	        <a href="./index.jsp" class="head-form1"><button class="head-btn">Go Back</button></a>
        	<form action="../logout" class="head-form"><button class="head-btn">LogOut</button></form>
    	</div>
    </div>
    
<h2 align="center">The Orders are Delivered To You Shortly</h2>
<table align="center">
<thead style="height:50px; border=2px solid red">
<tr>
<th>Order Id </th>
<th>Food Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Status</th>
<th>Order Time </th>

<th>------</th>


</tr>

</thead>
<tbody>
<% 

HttpSession ses=request.getSession();
String userId=(String)ses.getAttribute("userEmail");
ResultSet rs=RetrieveDetails.showOrderToUser(userId);
int value=RetrieveDetails.showTotalToUser(userId);
try{
	while(rs.next()){
	%>
		<tr>
			<td><p align="center" ><%=rs.getString(9) %></p></td>
			<td><p align="center"><%=rs.getString(7) %></p></td>
			<td><p align="center"><%=rs.getString(6) %></p></td>
			<td><p align="center"><%=rs.getString(3) %></p></td>
			<td><p align="center"><%=rs.getString(8) %></p></td>
			<td><p align="center"><%=rs.getString(10) %></p></td>
			
			<td><a href="../removeMyOrder?value=<%=rs.getString(9)%>&status=<%=rs.getString(8) %>"><ion-icon name="trash"></ion-icon></a></td>
		</tr>
	<%	}
	}
	catch(Exception e){
		e.printStackTrace();
	}


%>
<tr>
<td>Total</td>
<td>Rs:<%=value %></td></tr>
</tbody>
</table>

</body>
</html>