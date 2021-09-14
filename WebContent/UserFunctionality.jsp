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
		<title>Post an item</title>
	</head>
	
	<body>
		<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//String username = request.getParameter("usr");
			//String user_password = request.getParameter("password");
			//Run the query against the database ***Note this has not been tested yet.
			//ResultSet result = stmt.executeQuery("SELECT * FROM customer WHERE username=" + "\"" + username + "\"" + " and user_password="+ "\"" + user_password+"\"" + ";");
			//get singular query
			//out.println(session.getAttribute("user"));
			//result.next();
			//result.close();
			//check if user name equals password
			

				out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
				//out.println("<center> Welcome Customer: " + username + "</center>");
				out.println("<br>");
				out.println("<center><p> <a href=\"listingsNONPartIV.jsp\">See Listings!</a>. </p> </center>");
				out.println("<center><p> <a href=\"listings.jsp\">See Auctions!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SortByDifferentCriteria.jsp\">Sort by Different Criteria!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SearchHome.jsp\">Search by Various Criteria!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SearchHome.jsp\">Auction Bidding History (Enter VehicleID in Bidding History)!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SearchHome.jsp\">Buyer/Seller Histories (Enter ID in customerID Search)!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SearchHome.jsp\">Similar Items (Enter VehicleID in Similar Items Search)!</a>. </p> </center>");
				out.println("<center><p> <a href=\"AddToInterested.jsp\">Add to Watchlist!</a>. </p> </center>");
			
			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
			
	</body>
</html>
