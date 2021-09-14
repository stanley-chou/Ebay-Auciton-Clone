<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
     pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate Total Earnings</title>
</head>
<body style = "background-color: lightblue;">

<% 	
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		
		Statement stmt = con.createStatement();
		ResultSet result;
	
		//FIGURE THIS OUT!! NOT CORRECT!!
		String s="select sum(b.priceBid) as total, v.modelName as Name, v.modelMake as Make, v.modelYear as Year from bid b, vehicle_sells v where b.VehicleID=v.VehicleID and b.priceBid= (select max(b.priceBid) from bid b where b.VehicleID =v.VehicleID)  group by v.modelName, v.modelMake, v.modelYear order by total desc;";
		result = stmt.executeQuery(s);	
		
		int setlength=0;
		while(result.next())
			setlength++;
		
		if(setlength==0)
			out.println("No users have bought anything yet, so no best selling items yet.");
		else if(setlength<5)
			out.println("There are only "+setlength+" items that have been bought on this website. Their order from best to lowest is: ");
		else
			out.println("The Top 5 best selling items are: " );
		
		result.beforeFirst();
		int i=1;
		
		out.print("<table>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Model Name");
		out.print("</td>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Model Maker");
		out.print("</td>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Model Year");
		out.print("</td>");
		out.print("<td>");
		//print out column header
		out.print("Sum in dollars of amount of this item sold");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		while (result.next() && i<6) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(result.getString("Name"));
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(result.getString("Make"));
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(result.getString("Year"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("total"));
			out.print("</td>");
			
			out.print("</tr>");
			i++;
		}
		out.print("</table>");
		
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");
		
		out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
		
		
		result.close();
		//close the connection.
		db.closeConnection(con);
		//catch excpetion
	}catch (Exception e) {
			//out.println(e);
			out.print("<center>Failure! <center>");
			out.println("<br>");
			out.println("<center><button onclick=\"window.location.href='adminlogin.jsp';\">Go Back</button></center>");
	}


%>

</body>
</html>