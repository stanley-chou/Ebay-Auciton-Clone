<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add an Item To Watchlist</title>
	</head>
	
	<body>

		<center>Registration Page</center>
		 <!-- the usual HTML way -->
		<br>
		<center> For Type, use SUV, Car, or Bike </center>
		<br>
		<center>Enter Java Date similar to this Wed Apr 07 23:26:54 UTC 2021</center>	
		<br>
		<center>Enter SQL Date similar to this 2021-03-07 09:15:35</center>			  
	<br>

	<!-- sdsdssdddd -->
	<!-- >(new java.util.Date()).toLocaleString()    -->
	<form action="Interested.jsp" method="post">
	Customer ID :<input type="text" name="customerID" /><br>
	Model Name :<input type="text" name="modelName" /><br>
	Model Make:<input type="text" name="modelMake" /><br> 
	Model Year:<input type="text" name="modelYear" /><br> 
	Java Date:<input type="text" name="javaDate" /><br> 
	Type:<input type="text" name="Type" /><br>
	SQL Date:<input type="text" name="sqlDate" /><br> 
	<input type="submit" value="Add item" /> </form>
	<br>
	
	
	<br>
	<p>  <a href="listings.jsp">See all Listings!</a>. 
	<br>
	
</body>
</html>