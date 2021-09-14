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
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String bidID = request.getParameter("bidID");
			
			//Run the query against the database ***Note this has not been tested yet.
			//ResultSet result = stmt.executeQuery("SELECT * FROM customer WHERE username=" + "\"" + username + "\"" + " and user_password="+ "\"" + user_password+"\"" + ";");
			
			ResultSet result = stmt.executeQuery("SELECT V.VehicleID, V.CustomerID, V.modelYear, V.modelMake, V.modelName, MAX(B.priceBid) as 'CurrentBid', B.upperLimit, V.date as list_date, B.time_left as bid_date" 
			+ " FROM " + "vehicle_sells V, bid B" 
			+ " WHERE " + "V.VehicleID = B.VehicleID AND B.bidID = " + bidID 
			+ " GROUP BY " + " V.VehicleID");
			
			//+ "\" " + dateSQL + "\" "
			
			//get singular query
			//result.next();
			
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
			
			out.print("<td>");
			out.print("Bid Date");
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
					out.print("</td>");
					out.print("<td>"); out.print(result.getString("bid_date"));
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