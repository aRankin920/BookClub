<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="/JS/ButtonClick2.js">  </script>
<script>
    
    var i = 0;
    let arrList = new Array ();
    <c:forEach items="${ allProduct }" var="list"> 
	   arrList[i] = ${list.id}
	 </c:forEach >
	 
	 
    </script>
 <div id="dashboardBaseContainer">

	   <div class = "topNavDashboard">
	      <div  class = "innertopNavDashboard">
	     		<div class="topNavLinksAndFieldDashboard" ><span class="welcomeFormat">Welcome </span></div> 
	     		<p class="welcomeUserFormat">${user.getUserName()} </p>
	      		<div class="topNavLinksAndFieldDashboard" ><span class="centerText">Divinity Online Book Club</span></div> 
	      		<div class="topNavLinksAndFieldDashboard"><span class="logoutLink"><a href="/logout">Logout</a></span></div> 
	       </div>		
	    </div>    	    
		<div class = "topNavDashboard">
			<div  class = "innertopNavDashboard2">  
		      	 <div>
		      	    <form  action="/bookclub/search" method="get">
			      	<%--     <select name="category"  >
						    <option value="genre">Genre</option>
						    <option value="author">Author</option>
						</select> --%>								      	    			      	    	  	
				       
				          <input name="author" placeholder="Enter a request"/>          
				          <input id ="topNavDashboardButton" type="submit" value="Search By Author"/>
				       </form>  
		      		</div>		      				    
		    		<div id="counter"> count </div>
		    		<div class="ctValue"> 0 </div>
			        <div class="cartIcon">
                        <a href="/bookclub/checkout"><img src="/images/cartBlue.png" alt="shopping cart pic" width="30" height="30"></a>
                    </div><!-- End cartIcon -->
              </div>   
		 </div>
		  
		  
		  <br><br>
		  <div class="gridContainerDashboard">	<span class="genreFormat">Inspirational </span> </div>
		 <div class="gridContainerDashboard">	
		   <div class="bookRunner">			   
			  <div class="listFormat">
			      <ul>
			        <li><a href="/bookclub/details/5"><img src="/images/PromiseOfHS.png" alt="PromiseHolySpiritPaulBalius" style="width:120px; height:185px"></a></li>
			        <li><a href="/bookclub/details/6"><img src="/images/WheelsOfWisdom.jpg" alt="TomBishopWheels" style="width:120px; height:185px"></a></li>
			        <li><a href="/bookclub/details/7"><img src="/images/WomenPrayTDJake.png" alt="WomenPrayTDJake" style="width:120px; height:185px"></a></li>
			        <li><a href="/bookclub/details/8"><img src="/images/tdjakewhy.png" alt="tdjakewhy.png" style="width:120px; height:185px"></a></li>
			      </ul>
    		   </div>
			   
			 </div>  
		  </div><br> 
		  <div class="inspireButton" onclick="rotate(arrList)"> See More </div> <br><br>
		 <div class="lineFiller"> </div> <br><br>
		 <div class="gridContainerDashboard">	<span class="genreFormat">Home and Garden </span> </div>
		  <div class="gridContainerDashboard">	
		   <div class="bookRunner2">			   
			   <div class="listFormat">
			      <ul>
			        <li><a href="/bookclub/details/1"><img src="/images/FiveIngredientCookbook.jpg" alt="TobyAmidor" style="width:120px; height:185px"></a></li>
			        <li><a href="/bookclub/details/2"><img src="/images/BetterHomes17th.png" alt="BetterHomesAndGarden" style="width:120px; height:185px"></a></li>
			        <li><a href="/bookclub/details/3"><img src="/images/HalfBakedHarvest.png" alt="HalfBakedTieghanGerard" style="width:120px; height:185px"></a></li>
			        <li><a href="/bookclub/details/4"><img src="/images/ContainGardener.png" alt="ContainGardenerTammyWylie" style="width:120px; height:185px"></a></li>
			      </ul>
    		   </div>
			   
			 </div>  
		 </div>
		

		<div id="innerContainer">
		<%--	<div class="answerHeading">Add your answer:</div>
		 	<form:form action="/answers" method="post" modelAttribute="newAnswer">
				 <div >
			        <form:label class="answerLabel" path="answer">Answer</form:label>
			        <form:errors path="answer"/>
			        <form:textarea class="fieldFormat3" path="answer"></form:textarea>
			    </div>
			    <form:hidden path="question" value="${ question.id }"/>
			    <button class="answerButton">Answer it!</button>
			</form:form> 
		</div> --%>
		
	   <div class = "topNavDashboard">
		      <div  class = "innertopNavDashboard">
			      <p style="margin-left:25px; text-align:left;">
			      	  <span style="font-weight:bold; font-size: 23px;">What's on your mind?</span>
			          <br><br>
			          <span style="text-align:left; font-size: 20px;">
					      Have an opinion about a book; have a request for new material to add to the book collections; 
					      would like to give a review? <br> Share your thoughts below.  Requests are reviewed by the Online Book Club Committee.
				      </span>
			      </p>      
		      </div>
		      <div  class = "innertopNavDashboard">	
			      <form:form action="/bookclub/reviews" method="post" modelAttribute="reviews">	
				 	<form:errors path="reviewInput"/>
				 	<form:textarea path = "reviewInput" rows = "7" cols = "120" style="margin-left:25px; " placeholder="${ defaultValue }" />
					<br><br>
					<input id ="topNavDashboardButton1" type="submit" value="Submit"/>
		
				   </form:form>
			 </div><br><br>
			 <div class="lineFiller"> </div> <br><br>
           <div style="margin-left:25px; text-align:left;">
		      	 <span style="font-weight:bold; font-size: 23px;">See your previous comments:</span>      	  
		         <p>
		          <form:form action="/bookclub/update/${review.getId()}" method="put" modelAttribute="reviews">	
				    <c:forEach items="${reviewList}" var="review">
				         ${review.getCreatedAt()}: 
				         <form:input  path="reviewInput" maxlength="70" type="text" value = "${review.getReviewInput()}" />				    											   
						 <form:errors path="reviewInput"/>
						 <a href="/bookclub/update/${review.getId()}">Update</a>					 		
						 <a href="/bookclub/delete/${review.getId()}">Delete</a><br><br>
					</c:forEach>
					</form:form>
		         </p>
		  </div>
	   </div>
</div>


</body>
</html>

		 <c:if test="${user == thought.author}">
			<a href="/thought/delete/${thought.id}">Delete</a>
		 </c:if>
<%-- 
      <form:form action="/bookclub/reviews" method="post" modelAttribute="reviews">	
		 	<form  action="/dashboard" >
		 	<form:errors path="reviewInput"/>Enter a review or reques
		 	<form:textarea path = "reviewInput" rows = "7" cols = "150" style="margin-left:25px; " />
		 		<!-- <textarea name="text" rows="7" cols="120" style="margin-left:25px; "  /> Enter a review or request        
		 		</textarea> <br><br> -->
			    <input id ="topNavDashboardButton1" type="submit" value="Submit"/>
		    </form> 
		    </form:form> --%>