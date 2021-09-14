<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Register for Discount Ebay</title>
	</head>
	
	<body>

		<center>Registration Page</center>
		 <!-- the usual HTML way -->
		<br>
		<center>Note, for all entries, do not use any short hand (e.g. NJ for New Jersey)</center>
							  
	<br>
	<form action="RegisterUser.jsp" method="post">
	User name :<input type="text" name="usr" /><br>
	Password :<input type="text" name="password" /><br>
	Street :<input type="text" name="street" /><br>
	City :<input type="text" name="city" /><br>
	State :<input type="text" name="state" /><br>
	Country :<input type="text" name="country" /><br>
	Zip Code:<input type="text" name="zip_code" /><br>
	Phone Number:<input type="text" name="phoneNum" /><br>
	Email Address:<input type="text" name="email_address" /><br>
	<input type="submit" value="Register" /> </form>
	<br>
		
	<br>
	<p>Customer Login: <a href="CustomerHome.jsp">Login here if you have an account!</a>. 
	<br>

</body>
</html>