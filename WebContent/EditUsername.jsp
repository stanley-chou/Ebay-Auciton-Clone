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
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String userID = request.getParameter("userid");
	String username = request.getParameter("usrname");
	
	stmt.executeUpdate("UPDATE customer SET username = \""+username+"\" WHERE UserId="+userID+";");
	
	out.println("<center>Successfully Updated the Username!</center>");

	out.println("<br>");
	out.println("<br>");
	out.println("<br>");

	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	
	//close the connection.
	db.closeConnection(con);
	//catch excpetion
}
catch (Exception e) {
	out.println(e);
	out.println("<center>Failed to update information! </center>");
	out.println("<br>");
	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	
}


%>

</body>
</html>