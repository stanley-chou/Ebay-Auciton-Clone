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

		<center>Auctions Currently Listed</center>
		 <!-- the usual HTML way -->
		<br>			  
	<br>
	
	<body>
		<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String str = "SELECT V.VehicleID, V.CustomerID, V.modelYear, V.modelMake, V.modelName, MAX(B.priceBid) as 'CurrentBid', B.upperLimit, V.date as list_date" 
			+ " FROM " + "vehicle_sells V, bid B" + " WHERE " + "V.VehicleID = B.VehicleID" + " GROUP BY " + " V.VehicleID";
			//Run the query against the database.
			
			
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table border = " + "5" + ">");

			//make a row
			out.print("<tr>");
			//make a column
			
			out.print("<td>");
			out.print("Vehicle ID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Seller ID");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Model Year");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Model Make");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Model Name");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Top Current Bid Price");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Upper Price Limit");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Auction List Date");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
					out.print("<td>");
					//Print out current bar or beer name:
					out.print(result.getString("VehicleID"));
					out.print("</td>");
					out.print("<td>"); 		
						out.print(result.getString("CustomerID"));
					out.print("</td>");				
					out.print("<td>");
						out.print(result.getString("modelYear"));
					out.print("</td>");
					out.print("<td>");
						out.print(result.getString("modelMake"));
					out.print("</td>");
					out.print("<td>");
						out.print(result.getString("modelName"));
					out.print("</td>");
					out.print("<td>");
						out.print(result.getString("CurrentBid"));
					out.print("</td>");
					out.print("<td>");
						out.print(result.getString("upperLimit"));
					out.print("</td>");
						out.print("<td>"); out.print(result.getString("list_date"));
					out.print("</td>");
				
				out.print("</tr>");

			}
			out.print("</table>");

			
			out.println("<center><p> <a href=\"UserFunctionality.jsp\">Go Back!</a>. </p> </center>");
			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
			
	</body>
</html>