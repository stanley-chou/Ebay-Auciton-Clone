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
		ResultSet rs1;
	
		String s="select sum(b.priceBid) as user_earnings, c.username as username from customer c, vehicle_sells v, bid b where v.VehicleID=b.VehicleID and c.UserId=b.CustomerID and b.priceBid= (select max(b.priceBid) from bid b where b.VehicleID =v.VehicleID) group by c.username order by user_earnings desc;";
		
		rs1 = stmt.executeQuery(s);	
		
		int setlength=0;
		while(rs1.next())
			setlength++;
		
		if(setlength==0)
			out.println("No users have bought anything yet, so no best buyers yet.");
		else if(setlength<5)
			out.println("There are only "+setlength+" buyers that have bought something. Their order from best to lowest is: ");
		else
			out.println("The Best 5 Buyers are: " );
	 
		rs1.beforeFirst();
		int i=1;
		while(rs1.next() && i<6)
		{
			if(i==1)
		   		out.println(rs1.getString("username") +"  ");
			else
				out.println(", "+rs1.getString("username") +"  ");
		   i++;
		}
		
		
		rs1.close();
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