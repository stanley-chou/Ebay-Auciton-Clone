<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.util.Date,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href = "/cssfiles/login_style.css" rel="stylesheet" type="text/css">

<body style = "background-color: lightblue;">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove a bid</title>
</head>

<body>
<%


try {
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB(); 
	Connection con = db.getConnection();
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String Vid = request.getParameter("VID");
	String bidprice=request.getParameter("bPrice");
	
	ResultSet r= stmt.executeQuery("Select * from bid b where b.VehicleID="+Vid+" and b.priceBid="+bidprice+";");
	int setlength=0;
	while(r.next())
		setlength++;
	if(setlength==0)
		out.print("No such bid exists!");
	else
	{
		String str = "Delete from bid b where b.VehicleID="+Vid+" and b.priceBid="+bidprice+";";
		stmt.executeUpdate(str);
		
		out.print("Bid Removed Successfully!");
	}
	//close the connection.
	db.closeConnection(con);
	//catch excpetion
}
catch (Exception e) {
	out.println("<center>Failed remove the bid! </center>");
	out.println("<br>");
	out.println("<center><button onclick=\"window.location.href='RepresentativeHome.jsp';\">Go Back</button></center>");
}


%>


</body>
</html>