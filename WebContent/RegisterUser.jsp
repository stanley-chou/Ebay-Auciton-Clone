<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href = "/cssfiles/login_style.css" rel="stylesheet" type="text/css">
<body style = "background-color: lightblue;">

<% 	
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String username=request.getParameter("usr");
		String user_password=request.getParameter("password");
		String city =request.getParameter("city");
		String state =request.getParameter("state");
		String street =request.getParameter("street");
		String country =request.getParameter("country");
		String zip_code =request.getParameter("zip_code");
		String email_address =request.getParameter("email_address");
		String phoneNum = request.getParameter("phoneNum");
		Random rnd = new Random();
		int userId = rnd.nextInt(999999);
		//Run the query against the database ***Note this has not been tested yet.
		String insert = "INSERT INTO customer(userId,city,state,street,country,zip_code,user_password,username,phoneNum,email_address)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setInt(1,userId);
		ps.setString(2,city);
		ps.setString(3,state);
		ps.setString(4,street);
		ps.setString(6,zip_code);
		ps.setString(5,country);
		ps.setString(7,user_password);
		ps.setString(8,username);
		ps.setString(9,phoneNum);
		ps.setString(10,email_address);
		ps.executeUpdate();
		
		out.println("Successful Registration!");
		//close the connection.
		db.closeConnection(con);
		//catch excpetion
	}catch (Exception e) {
			out.print("<center>Failure to Register, User with these credentials exists! <center>");
			out.println("<br>");
			out.println("<center><button onclick=\"window.location.href='register.jsp';\">Go Back</button></center>");
	}


%>
</body>

<p>Customer Login: <a href="CustomerHome.jsp">Login Here</a>. 

</html>