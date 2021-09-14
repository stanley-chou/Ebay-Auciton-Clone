<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate End User Earnings</title>
</head>
<body style = "background-color: lightblue;">

<% 	
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		
		Statement stmt = con.createStatement();
		
		String usr=request.getParameter("usrname");
		ResultSet rs1;
		//vehiclename="\""+vehiclename+"\"";
		//out.println(vehiclename);
		String s="select sum(b.priceBid) as enduser_earnings from customer c, vehicle_sells v, bid b where v.VehicleID=b.VehicleID and c.UserId=b.CustomerID and c.username=\""+usr+"\" and b.dateSQLObject < CURRENT_DATE() and b.priceBid= (select max(b.priceBid) from bid b where b.VehicleID =v.VehicleID);";
		
		rs1 = stmt.executeQuery(s);	
		
		out.println("Earnings for User with username "+usr+" is: $");
	 
		while(rs1.next())
		{
		   out.println(rs1.getString("enduser_earnings"));
		}
		
		rs1.close();
		//close the connection.
		db.closeConnection(con);
		//catch excpetion
	}catch (Exception e) {
			out.println(e);
			out.print("<center>Failure! <center>");
			out.println("<br>");
			out.println("<center><button onclick=\"window.location.href='adminlogin.jsp';\">Go Back</button></center>");
	}


%>

</body>
</html>