<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Divinity Online Book Club</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">


</head>
<body style="background-image: url('/images/bk7b.png');background-repeat: repeat; background-size: cover">
<div class="container">
<h1>Welcome to Divinity Online Book Club</h1>

<div class="row"> 
<div class="welcomeBox">
<p style="font-weight: bold">We have a fantastic (and ever increasing) collections of inspirational and home 
and garden books. We hope you'll read along with us as we dive into various topics 
along with a wealth of informative content on home improvement and growing and maintaining 
attractive, functional gardens. </p>

<p style="font-weight: bold">You can also share your thoughts on the book club and the books 
collections in the comments section on the dashboard. Register below to start your journey with us.  
 Login if already a member. </p>
</div>
</div>


  <div class="row">
  
	<div class="col">
		<h3>Register</h3>
		<form:form action="/register" method="post" modelAttribute="user">
		    <div class="form-group">
		        <form:label path="userName">Name:</form:label>
		        <form:errors path="userName"/>
		        <form:input class="form-control" path="userName"/>
		    </div>
		    <div class="form-group">
		        <form:label path="email">Email:</form:label>
		        <form:errors path="email"/>
		       <form:input type="email" class="form-control" path="email"/>
		    </div>
		    <div class="form-group">
		        <form:label path="password">Password:</form:label>
		        <form:errors path="password"/>
		       <form:input type="password" class="form-control" path="password"/>
		    </div>
		    <div class="form-group">
		        <form:label path="confirmPassword">Password Conf:</form:label>
		        <form:errors path="confirmPassword"/>
		       <form:input type="password" class="form-control" path="confirmPassword"/>
		    </div>
		    <input class="btn btn-danger" type="submit" value="Register"/>
		</form:form>
	  </div>	
	  
	  	<div class="col">
		<h3>Login</h3>
		<p>${loginError}</p>
		<form method="POST" action="/login">
			<div class="form-group">
				<label>Email:</label>
				<input class="form-control" type="email" name="loginEmail">
			</div>
			<div class="form-group">
				<label>Password:</label>
				<input class="form-control" type="password" name="loginPassword"><br>
			<div></div>	<button class="btn btn-danger">Login</button>
			</div>
		 </form>
    </div>

</div>
</div>
