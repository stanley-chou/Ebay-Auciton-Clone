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
			//Run the query against the database ***Note this has not been tested yet.
			ResultSet result = stmt.executeQuery("SELECT * FROM customer WHERE username=" + "\"" + username + "\"" + " and user_password="+ "\"" + user_password+"\"" + ";");
			//get singular query
			result.next();
			//check if user name equals password
			if(result.getString("username").equals(username)&&result.getString("user_password").equals(user_password)){
				session.setAttribute("user", username);
				session.setAttribute("type", "customer");
				out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
				out.println("<center> Welcome Customer: " + username +". Your unique UserID is: " +result.getString("UserId")+"</center>");
				out.println("<br>");
				out.println("<center><p> <a href=\"Add_An_Item.jsp\">Post a new item!</a>. </p> </center>");
				out.println("<center><p> <a href=\"bid.jsp\">Bid!</a>. </p> </center>");
				out.println("<center><p> <a href=\"alerts.jsp\">Check Alerts!</a>. </p> </center>");
				out.println("<center><p> <a href=\"UserFunctionality.jsp\">User Functionalities!</a>. </p> </center>");
				out.println("<br>");
				out.println("<br>");
				out.println("<form action=\"Ask_Question.jsp\" method=\"post\">Question:<input type=\"text\" name=\"question\" /><input type=\"submit\" value=\"Post\" /> </form>");
				out.println("<center><p> <a href=\"Browse_FAQs.jsp\"> Browse FAQs </a>. </p> </center>");
				out.println("<center><p> <a href=\"Search_FAQs.jsp\"> Search in FAQs </a>. </p> </center>");
				
			}else{
				out.println("<center>Invalid password or username. Return to login page by clicking logout</center>");
			}
			//close the connection.
			db.closeConnection(con);
			//catch excpetion
		}catch (Exception e) {
			out.println("<center>Failed to login! Check your username and password</center>");
			out.println("<br>");
			out.println("<center><p>Invalid Credentials.</p> <button onclick=\"window.location.href='CustomerHome.jsp';\">Go Back</button></center>");
		}
	

		%>
		

</body>

</html>
