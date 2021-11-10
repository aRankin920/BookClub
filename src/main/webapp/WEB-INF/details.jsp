<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="/JS/ButtonClick2.js">  </script>
<title>Details Page</title>
</head>
<body style="background-image: url('/images/bk9.png');background-repeat: repeat; background-size: cover">
 <div class="gridContainerDashboard5">	
		 <div class = "topNavDashboard">
		      <div  class = "innertopNavDashboard">
		     		<div class="topNavLinksAndFieldDashboard"><span class="home2"><a href="/bookclub/dashboard">Home</a></span></div>
		      		<div class="topNavLinksAndFieldDashboard" ><span class="centerText3">Details For:  "${thisBook.title}"</span></div> 
		      		<div class="topNavLinksAndFieldDashboard"><span class="logoutLink2"><a href="/logout">Logout</a></span></div> 
		         <br>
		       </div>		
		 </div>    	    
		 <div id = "topNavDashboard">
			<div  class = "innertopNavDashboard5">  	      	  	      				    
		    		<div class="counter5" > count  </div>
		    		<div id="countValue1" >${thisBook.count}</div>
			        <div class="cartIcon2">
                       <span class="navTopBotPadding"> 
                       	 <img src="/images/cartBlue.png" alt="shopping cart pic" width="30" height="30">
                       </span>
                    </div><!-- End cartIcon -->
              </div>   
		 </div>
  
		 <div class ="gridContainerDashboard">	
		   <div class="lowerBox2">  
			   
				  <div class="costContainer">
						   <div class="innerCostContainer"><span class="boldTitle1">Price:</span> <span > $<c:out value="${thisBook.price}"></c:out></span></div>
						   <div class="innerCostContainer"><span class="boldTitle4">Discount:</span>  <span class="leftMargin"> $<c:out value="${thisBook.discount}"></c:out></span></div> 
					       <div class="innerCostContainer"><span class="boldTitle4">Quantity:</span> </div><br><br>
				<!-- 	   <div> <div class="ctrContainer">
							    <div class="arrow-up"  onclick="increaseCtr(this)"></div>
							    <div class="arrow-down" onclick="decreaseCtr(this)"></div>
						   </div></div>
						   <div class="buttoFormat2"> Update </div> -->
					
						    
					   <form:form action="/bookclub/details/${thisBook.id}"  method="POST"  modelAttribute="count"> 					                
								 <form:errors path="quantity"/>
								 <form:input class="inputFieldFormat" path="quantity"/>					   
							    <input class="buttoFormat2" type="submit" value="Update Cart" />
					  </form:form> 
					    
					    	    			    
				 </div>	<!-- endCostContainer -->   
				   
				   
				   <div><span class="boldTitle3">Author:</span>   <span > <c:out value="${thisBook.author}"></c:out></span></div><br>
				   <div><span class="boldTitle5">Description:</span><br><br>  <span>  <c:out value="${thisBook.description}"></c:out> </span></div><br>
				
				   <div class="boldTitle"><a href="/bookclub/checkout">Checkout</a> </div> <br><br><br><br>
				   
				   <p style="font-weight: bold"> Similiar products viewed by other members: </p>
				    <div class="costContainer">		    		    
						<table style="width: 100%">
					      <col >
						    <thead> </thead>
					 	
					 	  <tbody>
					 	   <col class="columnWidth2">
					 		    <tr>  
						 		    <c:choose>
										<c:when test="${thisBook.genre == 'Inspire'}">
											  <td><a href="/bookclub/details/7"><img src="/images/WomenPrayTDJake.png" alt="WomenPrayTDJake" style="width:110px; height:135px"></a></td>
								              <td><a href="/bookclub/details/6"><img src="/images/WheelsOfWisdom.jpg" alt="TomBishopWheels" style="width:110px; height:135px"></a></td>
								              <td><a href="/bookclub/details/8"><img src="/images/tdjakewhy.png" alt="tdjakewhy" style="width:110px; height:135px"></a></td>
										</c:when>
										<c:otherwise>
											  <td><a href="/bookclub/details/1"><img src="/images/FiveIngredientCookbook.jpg" alt="TobyAmidor"  style="width:110px; height:135px"></a></td>
								              <td><a href="/bookclub/details/2"><img src="/images/BetterHomes17th.png" alt="BetterHomesAndGarden"  style="width:110px; height:135px"></a></td>
								              <td><a href="/bookclub/details/3"><img src="/images/HalfBakedHarvest.png" alt="HalfBakedTieghanGerard" style="width:110px; height:135px"></a></td>
										</c:otherwise>
									</c:choose>					 		    
					  		    </tr>  		 	
					  	 </tbody>
					   </table>
				   </div>	
			   
			</div> 	   
		 </div>
 
</div>

<!-- <script type="text/javascript" src="js/ButtonClick.js">  </script> -->
<!-- //<script type="text/javascript" src="js/src/Test.js" ></script> -->



</body>
</html>