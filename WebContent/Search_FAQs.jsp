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
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		
		Statement stmt = con.createStatement();
		ResultSet result;

		String keywd = request.getParameter("keyword");
	
		String s="select f.Qid, f.question, f.answer from faqs f where f.question like \"%"+keywd+"%\";";
		
		result = stmt.executeQuery(s);	
		
		int setlength=0;
		while(result.next())
			setlength++;
		
		if(setlength==0)
			out.println("There are currently no questions that have been asked that contain this keyword");
		
		out.println("<br>");
		out.println("<br>");
		
		result.beforeFirst();


		//Make an HTML table to show the results in:
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Question ID");
		out.print("</td>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Question");
		out.print("</td>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Answer");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(result.getString("Qid"));
			out.print("</td>");
			//make a column
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(result.getString("question"));
			out.print("</td>");
			//make a column
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(result.getString("answer"));
			out.print("</td>");
			
			out.print("</tr>");

		}
		out.print("</table>");
		
		result.close();
		

		out.println("<br>");
		out.println("<br>");
		out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
		
		//close the connection.
		db.closeConnection(con);
		//catch excpetion
	}catch (Exception e) {
			//out.println(e);
			out.print("<center>Failure! <center>");
			out.println("<br>");
			out.println("<center><button onclick=\"window.location.href='CustomerLogin.jsp';\">Go Back</button></center>");
	}


%>

</body>
</html>