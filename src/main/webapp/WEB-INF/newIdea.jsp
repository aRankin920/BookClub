<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Create Task</title>
</head>
<body>
<div id = "editBaseContainer">  
   <div id = "innerEditBaseContainer">
  	
	  
       <div class = "editRowContainer">
          <h2>Create a new idea</h2>
<%--           	<div >
		       <form:label class = "hide" path="userName"> Creator:   </form:label>
		       <form:input class = "hide"  path="userName" value="${UserName}"  />
		       <form:errors path="userName"/>       
		   </div> <br>  --%>
		
		  <form:form  action="/ideas/new" method="post" modelAttribute="newIdea">  		
		     <div >
		       <form:label class = "editFieldName" path="ideaDescription"> Content:   </form:label>
		       <form:input class = "editInputField4"  path="ideaDescription" placeholder="Enter your idea here." />
		       <form:errors path="ideaDescription"/>       
		     </div> <br> 		     
		      	   

		     <br>  
		     <div style="margin-left: 75px;"> <input type="submit" class = "buttoFormat2"  value="Create"/></div>
		    
		 </form:form> 
		</div>
		 <div style="margin-top: -10px;" class="editRowContainer"> 
		    <button style="margin-left: -55px;" class="buttoFormat"> <a href="/ideas/dashboard">Dashboard</a><br> </button>	 	
	     </div>
		
		
		
  </div>
 
</div>

</body>
</html>
