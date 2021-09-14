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
			String username=request.getParameter("usr");
			String user_password=request.getParameter("password");
			//Run the query against the database.
			ResultSet result = stmt.executeQuery("SELECT * FROM representative_creates WHERE username=" + "\"" + username + "\"" + " and user_password="+ "\"" + user_password+"\"" + ";");
			//get singular query
			result.next();
			//check if user name equals password
			if(result.getString("username").equals(username)&&result.getString("user_password").equals(user_password)){
				out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
				out.println("<center> Welcome Representative: " + username + ". Your unique UserID is: " +result.getString("UserID")+"</center>");
				
				session.setAttribute("user", username);
				session.setAttribute("type", "representative");
				
				
				out.println("<br>");
				out.println("Remove a bid:");
				out.println("<form action=\"remove_bid.jsp\" method=\"post\">Vehicle ID:<input type=\"text\" name=\"VID\" /><br>Bid Price :<input type=\"text\" name=\"bPrice\" /><input type=\"submit\" value=\"Remove bid\" /> </form>");
				out.println("<br>");
				out.println("Remove an auction:");
				out.println("<form action=\"remove_auction.jsp\" method=\"post\">Vehicle ID:<input type=\"text\" name=\"VId\" /><input type=\"submit\" value=\"Remove Auction\" /> </form>");
				
				
				out.println("<center><p> <a href=\"edit_or_delete_account_infoPage.jsp\">Edit or Delete a customer account</a>. </p> </center>");
				
				out.println("<center><p> <a href=\"Browse_FAQs.jsp\"> Browse FAQs </a>. </p> </center>");
				out.println("<br>");
				out.println("Reply to an FAQ");
				out.println("<form action=\"Reply_FAQs.jsp\" method=\"post\">Question ID: <input type=\"text\" name=\"Qid\" /><br>Answer: <input type=\"text\" name=\"Qanswer\" /><input type=\"submit\" value=\"Post Answer\" /> </form>");
				out.println("<br>");
				out.println("Search in FAQs:");
				out.println("<form action=\"Search_FAQs.jsp\" method=\"post\">Keyword:<input type=\"text\" name=\"keyword\" /><input type=\"submit\" value=\"Search\" /> </form>");
				
				
				
			}else{
				out.println("<center>Invalid password or username. Return to login page by clicking logout</center>");
			}
			//close the connection.
			db.closeConnection(con);
			//catch excpetion
		}catch (Exception e) {
			out.println("<center>Failed to login! Check your username and password</center>");
			out.println("<br>");
			out.println("<center><p>Invalid Credentials.</p> <button onclick=\"window.location.href='RepresentativeHome.jsp';\">Go Back</button></center>");
		}
	

		%>
		

</body>

</html>