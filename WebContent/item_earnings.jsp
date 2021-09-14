<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate Item Earnings</title>
</head>
<body style = "background-color: lightblue;">

<% 	
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		
		Statement stmt = con.createStatement();
		
		String vehiclename=request.getParameter("VName");
		ResultSet rs1;
		//vehiclename="\""+vehiclename+"\"";
		//out.println(vehiclename);
		String s="select sum(b.priceBid) as item_earnings, v.modelName as name, v.modelMake as make, v.modelYear as year from  vehicle_sells v, bid b where v.VehicleID=b.VehicleID and v.modelName=\""+vehiclename+"\" and b.priceBid= (select max(b.priceBid) from bid b where b.VehicleID =v.VehicleID);";
		
		rs1 = stmt.executeQuery(s);	
		
		out.println("Item Earnings for Vehicle with name "+vehiclename+" is: ");
	 
		while(rs1.next())
		{
		    out.println("$"+rs1.getString("item_earnings"));  
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