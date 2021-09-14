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
			ResultSet result = stmt.executeQuery("SELECT * FROM administrative_staff WHERE username=" + "\"" + username + "\"" + " and user_password="+ "\"" + user_password+"\"" + ";");
			//get singular query
			result.next();
			//check if user name equals password
			if(result.getString("username").equals(username)&&result.getString("user_password").equals(user_password)){
				out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
				out.println("<center> Welcome Admin: " + username + ". Your unique UserID is: " +result.getString("User_ID")+"</center>");
				
				session.setAttribute("user", username);
				session.setAttribute("type", "admin");
				
				
				out.println("<br>");
				out.println("<p> <a href=\"generate_total_earnings.jsp\">Generate Total Earnings</a>. </p>");
				out.println("<p> <a href=\"Best_Buyers_earnings.jsp\">Best Buyers Earnings</a>. </p>");
				out.println("<p> <a href=\"bestselling_earnings.jsp\">Best Selling Item Earnings</a>. </p>");
				
				out.println("Generate Earnings Per:");
				out.println("<form action=\"item_earnings.jsp\" method=\"post\">Vehicle Name(ex: Civic, Highlander, etc.):<input type=\"text\" name=\"VName\" /><input type=\"submit\" value=\"Search\" /> </form>");
				out.println("<form action=\"itemtype_earnings.jsp\" method=\"post\">Vehicle Type(Enter CAR,SUV, or BIKE):<input type=\"text\" name=\"VType\" /><input type=\"submit\" value=\"Search\" /> </form>");
				out.println("<form action=\"enduser_earnings.jsp\" method=\"post\">Username:<input type=\"text\" name=\"usrname\" /><input type=\"submit\" value=\"Search\" /> </form>");
				
				
				
				out.println("<br>");
				out.println("<br>");
				out.println("<br>");
				//form to get info to create a representative account
				out.println("<form action=\"RegisterRepresentative.jsp\" method=\"post\"><p>Create a representative account here:</p>User name :<input type=\"text\" name=\"user\" /><br>Password :<input type=\"text\" name=\"password\" /><br>Street :<input type=\"text\" name=\"street\" /><br>City :<input type=\"text\" name=\"city\" /><br>State :<input type=\"text\" name=\"state\" /><br>Country :<input type=\"text\" name=\"country\" /><br>Zip Code:<input type=\"text\" name=\"zip_code\" /><br>Phone Number:<input type=\"text\" name=\"phoneNum\" /><br>Email Address:<input type=\"text\" name=\"email_address\" /><br><input type=\"submit\" value=\"Register Representative\" /> </form>");
				
				
				out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
				
			}
			else{
				out.println("<center>Failed to login! Check your username and password</center>");
				out.println("<br>");
				out.println("<center><p>Invalid Credentials.</p> <button onclick=\"window.location.href='AdminHome.jsp';\">Go Back</button></center>");
			}
			//close the connection.
			db.closeConnection(con);
			//catch excpetion
		}catch (Exception e) {
			//tell the user that they are being redirected
			//out.print(e);
			out.println("<center>Failed to login! Check your username and password</center>");
			out.println("<br>");
			out.println("<center><p>Invalid Credentials.</p> <button onclick=\"window.location.href='AdminHome.jsp';\">Go Back</button></center>");
		}
		
	%>
		

</body>


</html>