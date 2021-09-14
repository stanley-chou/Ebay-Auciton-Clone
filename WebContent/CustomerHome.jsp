<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admin Page</title>
	</head>
	
	<body>

		<center>Customer Login Page</center> <!-- the usual HTML way -->
	
							  
	<br>
	<form action="CustomerLogin.jsp" method="post">
	User name :<input type="text" name="usr" /><br>
	password :<input type="password" name="password" /><br>
	<input type="submit" value="Login" /> </form>
	<p>New user? <a href="register.jsp">Register Here</a>. 
	<br>
	<p>Representative Login: <a href="RepresentativeHome.jsp">Login Here</a>. 
	<br>
	<p>Admin Login: <a href="AdminHome.jsp">Login Here</a>. 
	<br>

</body>
</html>