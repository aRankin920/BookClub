<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script> -->
  
  <link rel="stylesheet" type="text/css" href="/css/style.css">
  <title>Ideas Manager</title>
</head>
<body>
 <div id="dashboardBaseContainer">

   <div id = "topNavDashboard">
      <div  id = "innertopNavDashboard">
     		<div class="topNavLinksAndFieldDashboard" ><span class="welcomeFormat">Welcome, ${user.getUserName()}</span></div> 
      		<div class="topNavLinksAndFieldDashboard" ><span class="priortyLink"><a href="/ideas/desc">Low Likes</a></span></div> 
      		<div class="topNavLinksAndFieldDashboard"><span class="priortyLink"><a href="/ideas/asc">High Likes</a></span></div>  
      		<div class="topNavLinksAndFieldDashboard"><span class="priortyLink"><a href="/ideas/dashboard">Reset</a></span></div> 
      		<div class="topNavLinksAndFieldDashboard"><span class="priortyLink"><a href="/tasks/asc"><a href="/logout">Logout</a></span></div> 
       </div>		
    </div>
  
 <div id="gridContainerDashboard">	
   <div class="container">
	   <table class="table table-striped table-bordered">
	    <col >
		  <thead>
	  	    <tr>
	   		   <th>Idea</th>   	    
	   		   <th>Created By</th> 
	   		   <th>Likes</th>
	   		   <th>Action</th>
	  		</tr>
	 	  </thead>
	 	
	 	  <tbody>
	 	   <col class="columnWidth1">
	  		 <c:forEach items="${ ideaList }" var="idea"> 
	 		    <tr>
	              <td><a href="/ideas/${idea.id}"> ${idea.ideaDescription} </a><br>
	    		  <td class="dashboardCellPadding"> ${idea.creator.getUserName()} </td>
	   			  <td class="dashboardCellPadding3"> ${idea.numOfLikes} </td>
	   			  <td class="dashboardCellPadding2"> 
			       <p class="labelAlign">	
				      <c:choose>
						 <c:when test="${idea.likers.contains(user)}">			
							<a href="/ideas/unlike/${idea.id}">Unlike</a>
						 </c:when>
						 <c:otherwise>
							<a href="/ideas/like/${idea.id}">Like</a>
						 </c:otherwise>
					  </c:choose></p>
                 </td>
	  		</tr>
	  		 </c:forEach > 	  		
	  	 </tbody>
	   </table>
	   </div> <br> <br>
	   <button style="margin-left: -1250px;"class="buttoFormat4"><a href="/ideas/new">Create an Idea</a></button>
 </div>
</div>

</body>
</html>


