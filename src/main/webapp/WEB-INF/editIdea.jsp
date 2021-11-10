<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Edit Idea</title>
</head>
<body>
 <div id = "editBaseContainer">
  	
 <div id="innerEditBaseContainer">
       <div class="editRowContainer">
          <h2>Edit: <c:out value="${currIdea.getIdeaDescription()}"></c:out></h2>
          
		  <form:form  action="/ideas/${id}/edit" method="put" modelAttribute="editIdea">  		   
		     <div >
		       <form:label class = "editFieldName" path="ideaDescription"> Content: &nbsp;  </form:label>
		       <form:input class = "editInputField" path="ideaDescription" value="${currIdea.getIdeaDescription()}"/> 
		       <form:errors path="ideaDescription"/>       
		     </div> <br> 	

		     <br>
			<div style="margin-left: 75px;"> <input type="submit" class ="buttoFormat2"  value="Update"/></div> 					
		 </form:form> 
	 </div>
     <div class="editRowContainer">
   	     <div id="innerSelectedContainer">
   	        <button style="margin-left: -240px; margin-top: -40px; margin-right: 5px;" class="buttoFormat"> <a href="/ideas/dashboard">Dashboard</a><br> </button>	
			<button class="buttoFormat"> <a href="/ideas/${id}/delete">Delete</a><br> </button>      	     
		   </div>     
     </div>
	
</div>	
  </div><br><br>
  
             
 

</body>
</html>

	     
	     
<%-- 	     			<c:choose>
				<c:when test="${UserName == currIdea.getCreator().getUserName()}">
					<div style="margin-left: 75px;"> <input type="submit" class = "buttoFormat2"  value="Update"/></div> 
				</c:when>
				<c:otherwise>
				        <div style="margin-left: 75px; margin-top: -25px;"> <input type="submit" class ="buttoFormat2"  value="Update" style="visibility:hidden;"/></div> 
			    </c:otherwise> </c:choose>	--%>
			
<%-- 	   </c:choose>	   <c:choose>
				<c:when test="${currUser.getUserName() == currIdea.getCreator().getUserName()}">
		   	         <button style="margin-left: -240px; margin-top: -40px; margin-right: 40px" class="buttoFormat"> <a href="/ideas/dashboard">Dashboard</a><br> </button>	
					 <button class="buttoFormat"> <a href="/ideas/${id}/delete">Delete</a><br> </button> 
				</c:when>
				<c:otherwise>
		   	         <button style="margin-left: -240px; margin-top: -40px; margin-right: 40px;" class="buttoFormat"> <a href="/ideas/dashboard">Dashboard</a><br> </button>	
					 <button style="visibility:hidden;" class="buttoFormat"> <a href="/ideas/${id}/delete">Delete</a><br> </button> 
			    </c:otherwise>
		    </c:choose> --%>

               