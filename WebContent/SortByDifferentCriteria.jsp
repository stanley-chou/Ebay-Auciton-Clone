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
			String username = request.getParameter("usr");
			String user_password = request.getParameter("password");
			//Run the query against the database ***Note this has not been tested yet.
			ResultSet result = stmt.executeQuery("SELECT * FROM customer WHERE username=" + "\"" + username + "\"" + " and user_password="+ "\"" + user_password+"\"" + ";");
			//get singular query
			result.next();
			//check if user name equals password
			
				session.setAttribute("user", username);
				session.setAttribute("type", "customer");
				out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
				out.println("<center> Welcome Customer! Sorting capability is alphabetical, or numerical, low to high" + "</center>");
				out.println("<br>");
				out.println("<center><p> <a href=\"SortByModelName.jsp\">Sort by Model Name!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SortByModelMake.jsp\">Sort by Model Make!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SortByModelYear.jsp\">Sort by Model Year!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SortByBidDate.jsp\">Sort by Bid Date!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SortByListDate.jsp\">Sort by Auction List Date!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SortByHighestBid.jsp\">Sort by Current Highest Bid Price!</a>. </p> </center>");
				out.println("<center><p> <a href=\"SortByBidUpperLimit.jsp\">Sort by Bid Upper Limit!</a>. </p> </center>");
			
			/*if(result.getString("username").equals(username)&&result.getString("user_password").equals(user_password)){
				session.setAttribute("user", username);
				session.setAttribute("type", "customer");
				out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
				out.println("<center> Welcome Customer: " + username + "</center>");
				out.println("<br>");
				out.println("<center><p> <a href=\"listings.jsp\">See Listings!</a>. </p> </center>");
				out.println("<center><p> <a href=\"bid.jsp\">Sort by Different Criteria!</a>. </p> </center>");
				out.println("<center><p> <a href=\"alerts.jsp\">Search by Various Criteria!</a>. </p> </center>");
				out.println("<center><p> <a href=\"UserFunctionality.jsp\">Auction Bidding History!</a>. </p> </center>");
				out.println("<center><p> <a href=\"UserFunctionality.jsp\">Buyer/Seller Histories!</a>. </p> </center>");
				out.println("<center><p> <a href=\"UserFunctionality.jsp\">Similar Items!</a>. </p> </center>");
				out.println("<center><p> <a href=\"UserFunctionality.jsp\">Add to Watchlist!</a>. </p> </center>");
			}else{
				out.println("<center>Invalid password or username. Return to login page by clicking logout</center>");
			}*/

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
			
	</body>
</html>