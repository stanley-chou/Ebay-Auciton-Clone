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
			String similar = request.getParameter("similar");
			
			//Run the query against the database ***Note this has not been tested yet.
			//ResultSet result = stmt.executeQuery("SELECT * FROM customer WHERE username=" + "\"" + username + "\"" + " and user_password="+ "\"" + user_password+"\"" + ";");
			
			ResultSet result = stmt.executeQuery("SELECT V.VehicleID, V.CustomerID, V.modelYear, V.modelMake, V.modelName, MAX(B.priceBid) as 'CurrentBid', B.upperLimit, V.date as list_date, B.time_left as bid_date, V.dateSQLObject "
					+ "FROM vehicle_sells V, bid B, (SELECT V1.VehicleID, if(V1.isBike = 1, " + "\'" + "Bike" + "\'" + ", if(V1.isCar = 1, " + "\'" + "Car" + "\'" + ", if(V1.isSUV = 1, " + "\'" + "SUV" + "\'" + ", " + "\'" +  "None" + "\'" + "))) AS StoreInfo " +  
							 						"FROM vehicle_sells V1 " + 
                            						"WHERE V1.VehicleID = " + similar + ") AS t1," + 
                            						"(SELECT V2.VehicleID, if(V2.isBike = 1, " + "\'" + "Bike" + "\'" + ", if(V2.isCar = 1, " + "\'" + "Car" + "\'" + ", if(V2.isSUV = 1, " + "\'" + "SUV" + "\'" + ", " + "\'" +  "None" + "\'" + "))) AS StoreInfo "+ 
							 						"FROM vehicle_sells V2) AS t2 "+
					"WHERE V.VehicleID = B.VehicleID AND V.VehicleID = t2.VehicleID AND t2.StoreInfo = t1.StoreInfo AND V.dateSqlObject BETWEEN (Current_Date()-Interval 1 Month) and Current_Date() "+
					"GROUP BY V.VehicleID;");
			
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