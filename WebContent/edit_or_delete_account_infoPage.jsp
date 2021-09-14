<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Edit or Delete User Account Info</title>
	</head>
	<center> Edit or Delete User Account Info</center> <!-- the usual HTML way -->
	
	<body>

	Delete User account:					  
	<form action="DeleteUserAcct.jsp" method="post">
	UserID :<input type="text" name="usrID" />
	<input type="submit" value = "Delete" /> </form>
	
	<br>
	<br>
	<center>Edit User account</center>
	<center>NOTE: userID cannot be changed, only other information can</center>
	<br>				  
	<form action="EditUsername.jsp" method="post">
	Edit for info for UserID:<input type="text" name="userid" /><br>
	Change Username to :<input type="text" name="usrname" /><br>
	<input type="submit" value="Change Username" /> </form>
	
	<br>				  
	<form action="EditPassword.jsp" method="post">
	Edit for info for UserID:<input type="text" name="userid" /><br>
	Change Password to :<input type="text" name="password" /><br>
	<input type="submit" value="Change Password" /> </form>
	
	<br>				  
	<form action="EditAddress.jsp" method="post">
	Edit for info for UserID:<input type="text" name="userid" /><br>
	New Address Information:
	Street :<input type="text" name="street" /><br>
	City :<input type="text" name="city" /><br>
	State :<input type="text" name="state" /><br>
	Country :<input type="text" name="country" /><br>
	Zip Code:<input type="text" name="zip_code" /><br>
	<input type="submit" value="Change Address" /> </form>
	
	<br>				  
	<form action="EditPhoneNumber.jsp" method="post">
	Edit for info for UserID:<input type="text" name="userid" /><br>
	Change Phone Number to :<input type="text" name="phonenumber" /><br>
	<input type="submit" value="Change Phone Number" /> </form>
	
	<br>				  
	<form action="EditEmail.jsp" method="post">
	Edit for info for UserID:<input type="text" name="userid" /><br>
	Change Email to :<input type="text" name="email" /><br>
	<input type="submit" value="Change Email" /> </form>
	
	<center><p> <a href="logout.jsp"  style="position: absolute; top: 0; right: 0; width: 100px; text-align:right;" >Logout</a>. </p> </center>
	

</body>
</html>