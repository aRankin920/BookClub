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
  <title>Checkout Summary</title>
</head>
<body style="background-image: url('/images/bk8d.png');background-repeat: repeat; background-size: cover">
  <div class ="gridContainerDashboard7">	
		<div class = "topNavDashboard">
		      <div  class = "innertopNavDashboard">
		     		<div class="topNavLinksAndFieldDashboard"><span class="home"><a href="/bookclub/dashboard">Home</a></span></div>
		      		<div class="topNavLinksAndFieldDashboard" ><span class="centerText7">Checkout for: ${user.getUserName()}</span></div> 
		      		<div class="topNavLinksAndFieldDashboard"><span class="logoutLink7"><a href="/logout">Logout</a></span></div> 
		         <br>
		       </div>		
		</div>    	    
		<div class = "topNavDashboard6">
			<div  class = "innertopNavDashboard6">  		      	  	      				    
		    		<div id="counter3"> count  </div>
		    		<div class="ctValue4">${count}</div>
			        <div class="cartIcon2">
                       <span class="navTopBotPadding"> 
                       	 <a href="/bookclub/checkout"><img src="/images/cartBlue.png" alt="shopping cart pic" width="30" height="30"></a>
                       </span>
                    </div><!-- End cartIcon -->
              </div>   
		 </div>
  
		 <div class ="gridContainerDashboard6" style="padding-bottom: 30px;">	
		   <div class="lowerBox3">  
			   <table style="width:100%">
			    <col >
				  <thead>
			  	        		   
			 	  </thead>
			 	
			 	  <tbody>
			 	   <col >
			  		 <c:forEach items="${ productList }" var="list"> 
			 		    <tr>
			              <td><a href="/bookclub/details/${list.id}"> ${list.title} </a> by  ${list.author}</td>
			              <td><span style="font-weight:bold">Total: </span>$${list.price}</td>
			              <td>Quantity: ${list.count}</td>
			  		    </tr>
			  		 </c:forEach > 	  		
			  	 </tbody>
			   </table>
			 </div> 			   
		 </div>
 
		 <div class = "gridContainerDashboard" >
		   
		      <div  class = "innertopNavDashboard7">		
			 	<form  action="/bookclub/receipt" >
			 	<br><span  class="topMargin"><span class="total"><label for="total">Total: </span>  $${total}</label></span><br><br>     
				    <input class ="topNavDashboardButton2" type="submit" value="Submit Payment"/>
			    </form> 
			 </div>
		</div>
</div>

</body>
</html>


