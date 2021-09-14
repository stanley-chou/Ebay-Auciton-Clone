<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Post an item</title>
	</head>
	
	<body>

		<center>Registration Page</center>
		 <!-- the usual HTML way -->
		<br>
		<center> Note, please use SUV for SUV, Car for Car, and Bike for Bikes </center>
		<br>
		<center>Enter date similar to this Wed Apr 07 23:26:54 UTC 2021</center>
		<br>
		<center>Enter model year like this: 2021</center>			  
		<br>
		<center>Enter Make like this: Toyota</center>
	<br>

	<!-- sdsdssdddd -->
	<!-- >(new java.util.Date()).toLocaleString()    -->
	<form action="Add_Item.jsp" method="post">
	Name :<input type="text" name="Name" /><br>
	Hidden Price :<input type="text" name="Price" /><br>
	Date:<input type="text" name="Date" /><br> 
	Type:<input type="text" name="Type" /><br>
	Make:<input type="text" name="Make" /><br>
	Year:<input type="text" name="Year" /><br>
	Public Price:<input type="text" name="pPrice" /><br>
	Valid Increment:<input type="text" name="incr" /><br>
	<input type="submit" value="Add item" /> </form>
	<br>
	
	
	<br>
	<p> See all Deals <a href="CustomerLogin.jsp">Login here if you have an account!</a>. 
	<br>
	
</body>
</html>
