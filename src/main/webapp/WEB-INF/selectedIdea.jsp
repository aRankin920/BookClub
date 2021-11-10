<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" type="text/css" href="/css/style.css">
<title> <c:out value="${Idea.getIdeaDescription()}"></c:out></title>
</head>
<body>


<div id = "selectedBaseContainer">
		<h2><c:out value="${Idea.getIdeaDescription()}"></c:out></h2>	
		<div >
		   <div><span class = "selectedFieldName">Created By:&ensp;</span>  <c:out value="${currUser.getUserName()}"></c:out></div><br><br>
		   <h3>Users who liked your idea:</h3>

		 	<table class="dashboardTableWidth" >	  
			  <thead class="tableHeader">
		  	    <tr>
		   		   <th>Name</th>   	    
		  		</tr>
		 	  </thead>
		 	
		 	  <tbody>
		 	   <col class="columnWidth1">
		  		 <c:forEach items="${ currIdea.likers }" var="user"> 
		 		    <tr >
		              <td style="text-align:left; padding-left: 10px;"> ${user.userName}</td>  			
		  			</tr>
		  		 </c:forEach > 	  		
		  	  </tbody>
		    </table>
		  
			<div id="innerSelectedContainer">
				<c:choose>
					  <c:when test="${currUser.getUserName().contains(currIdea.getCreator().getUserName())}">
						<button class=buttoFormat> <a href="/ideas/${id}/edit">Edit</a><br> </button> 
					  </c:when>
					  <c:otherwise>
						<button class=buttoFormat style="visibility:hidden;"> <a href="/ideas/${id}/edit">Edit</a><br> </button> 
					 </c:otherwise>
				</c:choose>
			   <button class="buttoFormat"> <a href="/ideas/${id}/delete">Delete</a><br> </button> 
			   <button class="buttoFormat"> <a href="/ideas/dashboard">Dashboard</a><br> </button>
		    </div>
       </div> 
 </div> 



</body>
</html>