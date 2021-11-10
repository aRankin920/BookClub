<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script> -->
  
  <link rel="stylesheet" type="text/css" href="/css/style.css">
  <title>Search Results</title>
</head>
<body style="background-image: url('/images/bk8d.png');background-repeat: repeat; background-size: cover">
  <div class="gridContainerDashboard8a">	
		<div class = "topNavDashboard8">
		      <div  class = "innertopNavDashboard">
		     		<div class="topNavLinksAndFieldDashboard"><span class="home"><a href="/bookclub/dashboard">Home</a></span></div>
		      		<div class="topNavLinksAndFieldDashboard" ><span class="centerText8">Order Receipt</span></div> 
		      		<div class="topNavLinksAndFieldDashboard"><span class="logoutLink"><a href="/logout">Logout</a></span></div> 
		         <br>
		       </div>		
		</div>    	    
		<div class = "topNavDashboard">
			<div  class = "innertopNavDashboard8a">  
		      	  	<div class="topNavLinksAndFieldDashboard" ><span class="memberName"> For: ${user.getUserName()}</span></div>      				    
		    	<!-- 	<div id="counter3"> count  </div>
		    		<div class="ctValue4"> 0 </div>
			        <div class="cartIcon2">
                       <span class="navTopBotPadding"> 
                       	 <img src="/images/cartBlue.png" alt="shopping cart pic" width="30" height="30">
                       </span>
                    </div>End cartIcon -->
              </div>   
		 </div>
  
 <div class="gridContainerDashboard8" style="padding-bottom: 30px;">	
   <div class="lowerBox4"> 
	   <table style="width: 100%">
	    <col >
		  <thead>
	  	        		   
	 	  </thead>
	 	
	 	  <tbody>
	 	   <col >
	  		 <c:forEach items="${ productList }" var="order"> 
	 		    <tr>
	              <td style="width: 250px"><a href="/bookclub/details/${order.id}"> ${order.title} </a>,  ${order.author}</td>
	              <td style="width: 30px">Price: ${order.price} </td>
	              <td style="width: 30px">Discount: ${order.discount}</td>
	  		    </tr>
	  		 </c:forEach > 	  		
	  	 </tbody>
	   </table>
	 </div> 
	   
 </div>
 
 <div class  = "gridContainerDashboard8">
   
      <div class = "innertopNavDashboard8">
	      <div class="topMargin, totalFormat">Summary </div>
	      <div class="totalFontSize"><span class="total2"> Total Cost: </span>  $${total}</div>	
	      <div class="totalFontSize"><span class="total3"> Total Savings: </span>  $${totalDiscount}</div><br>		
	 </div>
	 <div class="thankyouFontSize">Thank you for your support</div>
</div>
 
 
 
</div>

</body>
</html>


