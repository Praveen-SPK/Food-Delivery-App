<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products Page</title>
<link rel="stylesheet" href="../CSS_Files/ViewStocks.css">
</head>
<body>
<div class="header-section">
		<div class="logo">
			<img src="../Images/img20.png" alt="#">
		</div>
		<div class="section-link">
			<ul>
			
			</ul>
		</div>
		<a href="Admin.jsp"><button class="head-btn">Go Back</button></a>
	</div>

<div class="body-section">
	<div class="main-section">
	<h1>Menu's Available Now !!! </h1>
		<div class="main-content">
			
				<%
					HttpSession ses=request.getSession();
					ResultSet res=(ResultSet)ses.getAttribute("result");
					try{
						while(res.next()){
    					String pImg=res.getString(5);
 						String pName=res.getString(2);
    					int pId=res.getInt(1);
    					int pStock=res.getInt(4);
    					int pCost=res.getInt(3);
    					System.out.println(pImg);
    			%>
			<div class="card-section">
               	<div class="p-img">
                	<img alt="#" src="../Images/<%=pImg%>">
               	</div>
               	<div class="p-text">
                	<h2>Food-Id : <%=pId %></h2>
                	<h2>Name : <%=pName %></h2>
               		<h3>Cost : $<%=pCost %> </h3>
               		<h3>Available : <%=pStock %>Qty</h3>
               	</div>
                	<!-- <div class="p-buy">
                		<button type="button"> Stock Available : </button>
                	</div> -->
           </div>
			<%}} 
                catch(Exception e){
                	e.printStackTrace();
                }
            %>   

	</div>
</div>
</div>


</body>
</html>