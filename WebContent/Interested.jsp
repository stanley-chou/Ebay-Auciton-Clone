<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href = "/cssfiles/login_style.css" rel="stylesheet" type="text/css">

<body style = "background-color: lightblue;">

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	Random rnd = new Random();
	int VehicleId = rnd.nextInt(999999);
	String date = request.getParameter("Date");
	String name=request.getParameter("Name");
	String price=request.getParameter("Price");
	ResultSet result = stmt.executeQuery("SELECT * FROM customer c WHERE c.username=" + "\""+ session.getAttribute("user") + "\"" + ";");
	//Run the query against the database ***Note this has not been tested yet.
	//get singular query
	result.next();
	
	int isBike= 0;
	int isCar = 0;
	int isSuv = 0;
	if(request.getParameter("Type").toLowerCase().equals("bike")){
		isBike = 1;
	}else if(request.getParameter("Type").toLowerCase().equals("car")){
		isCar = 1;
	}else{
		isSuv = 1;
	}
	//sss
	
	String insert = "INSERT INTO Interested(CustomerID,modelName,modelMake,modelYear,date, isBike,isCar,isSUV, dateSQLObject)"
			+ "VALUES(?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(insert);
	ps.setInt(1,Integer.parseInt(request.getParameter("customerID")));
	ps.setString(2,request.getParameter("modelName"));
	ps.setString(3,request.getParameter("modelMake"));
	ps.setString(4,request.getParameter("modelYear"));
	ps.setString(5,request.getParameter("javaDate"));
	ps.setInt(6,isBike);
	ps.setInt(7,isCar);
	ps.setInt(8,isSuv);
	ps.setString(9,request.getParameter("sqlDate"));

	ps.executeUpdate();
	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	out.println("<center>Item Successfully Added to Watchlist!</center>");
	out.println("<center><p> <a href=\"listings.jsp\">See new deals!</a>. </p> </center>");
	out.println("<center><p> <a href=\"bid.jsp\">Bid on an item!</a>. </p> </center>");
	//close the connection.
	db.closeConnection(con);
	//catch excpetion
}catch (Exception e) {
	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	out.println("Failed Registration, Go back please.");
}

	





%>



</body>
</html>