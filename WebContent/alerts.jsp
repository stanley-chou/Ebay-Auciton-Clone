<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Your Alerts</title>
	</head>
	
	<body>
		<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String str = "SELECT * FROM " + "alerts where userID_alert = (select c.UserId from customer c where c.username = " + "\""+ session.getAttribute("user") + "\");"  ;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			
			out.print("<td>");
			out.print("Message");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Highest Bid");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Your Bid");
			out.print("</td>");
			
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getString("type"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("maxPrice"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("minPrice"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
			
	</body>
</html>