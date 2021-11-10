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
  <title>Search Summary</title>
</head>
<body style="background-image: url('/images/bk8d.png');background-repeat: repeat; background-size: cover">
  <div class="gridContainerDashboard3">	
		<div class = "topNavDashboard">
		      <div  class = "innertopNavDashboard">
		     		<div class="topNavLinksAndFieldDashboard"><span class="home"><a href="/bookclub/dashboard">Home</a></span></div>
		      		<div class="topNavLinksAndFieldDashboard" ><span class="centerText">Search Summary </span></div> 
		      		<div class="topNavLinksAndFieldDashboard"><span class="logoutLink"><a href="/logout">Logout</a></span></div> 
		         <br>
		      </div>		
		</div>    	    
		<div class = "topNavDashboard">
			<div  class = "innertopNavDashboard3">  
		    		<div id="counter2"> count </div>
		    		<div class="ctValue3">${count} </div>
			        <div class="cartIcon2">
                       <span class="navTopBotPadding">                       	
                       	 <a href="/bookclub/checkout"><img src="/images/cartBlue.png" alt="shopping cart pic" width="30" height="30"></a>
                       </span>
                    </div><!-- End cartIcon -->
              </div>   
		 </div>
  		 
  		 <div class="searchResultName"> 		 
			 <c:choose>
				<c:when test="${not empty author}">
				      Search results for "${ author }"
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>	
  		 
  		 
  		 </div>
		 <div class="gridContainerDashboard4">	
		   <div class="lowerBox1">  
			   <table class="noBorder" >
			    <col >
				  <thead>
			  	        		   
			 	  </thead>
			 	
			 	  <tbody>
			 	   <col >
			  		 <c:forEach items="${ bookList }" var="bList"> 
			 		    <tr>
			              <td><a href="/bookclub/details/${bList.id}"> ${bList.title} </a>  by  ${bList.author}</td>
			  		    </tr>
			  		 </c:forEach > 	  		
			  	 </tbody>
			   </table>
			 </div> 
			   
		 </div>
</div>

</body>
</html>


