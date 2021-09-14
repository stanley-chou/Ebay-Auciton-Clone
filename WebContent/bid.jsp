<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href = "/cssfiles/login_style.css" rel="stylesheet" type="text/css">

<body style = "background-color: lightblue;">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Bid on an item</title>
	</head>
	
	<body>

		<center>Bidding Page</center>
		 <!-- the usual HTML way -->
		<br>
		<center>Enter Vehicle ID first from the listings page</center>
		<br>
		<center>Enter date in the following format: Wed(day) Apr (month) 07 (numeric day) 23:43:15 (time in hh:mm:ss) UTC 2021(year)</center>	
		<center>Enter 0 for manual bidding in Upper Limit and Bid Increment</center>			  		  
	<br>

	<!-- sdsdssdddd -->
	<!-- >(new java.util.Date()).toLocaleString()    -->
	<form action="add_bid.jsp" method="post">
	Vehicle ID:<input type="text" name="VID" /><br>
	Amount :<input type="text" name="amt" /><br>
	Upper Limit: <input type="text" name="upper" /><br>
	Bid Increment:  <input type="text" name="incr" /><br>
	<input type="submit" value="Add bid" /> </form>
	<br>
	
	
	<br>
	<p> See all Deals <a href="listings.jsp">See Listings here</a>. 
	<br>
	
</body>
</html>
