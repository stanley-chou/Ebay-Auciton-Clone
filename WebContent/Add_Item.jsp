<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.util.Date,java.sql.*"%>
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
	String make = request.getParameter("Make");
	String year = request.getParameter("Year");
	ResultSet result = stmt.executeQuery("SELECT * FROM customer c WHERE c.username=" + "\""+ session.getAttribute("user") + "\"" + ";");
	result.next();
	int id = Integer.parseInt(result.getString("UserId"));
	result.close();
	ResultSet resultChecker = stmt.executeQuery("SELECT I.CustomerID, I.carType " +
												 "FROM   (SELECT I.CustomerID, I.modelName, I.modelMake, I.modelYear, t1.carType "+
					   									 "FROM Interested I, (SELECT *, if(I1.isBike = 1, " + "\'" + "Bike" + "\'" + ", if(I1.isCar = 1, "+ "\'" + "Car" + "\'" + ", if(I1.isSUV = 1, " + "\'" + "SUV" + "\'" + ", " + "\'" + "None" + "\'" + "))) AS carType "+
									       				                      "FROM Interested I1) AS t1 " +
				       									  "WHERE I.CustomerID = t1.CustomerID and I.modelName = t1.modelName AND I.modelMake = t1.modelMake AND I.modelYear = t1.modelYear " + 
					   									   "AND I.dateSQLObject = t1.dateSQLObject) AS I " +
												 "WHERE I.modelName = \"" + name + "\" AND I.modelMake = \"" + make + "\" AND I.modelYear = \"" + year + "\" AND I.carType = \"" + request.getParameter("Type") + "\";");
	
	
		while (resultChecker.next()) 
		{
			
			String CustomerID_2 = resultChecker.getString("CustomerID");
			 		
			String carType = resultChecker.getString("carType");
			
			//out.println(CustomerID_2);
			
			
			Random kangaroo = new Random();
			int alertID = kangaroo.nextInt(999999);
			
			String insert = "INSERT INTO alerts(userID_alert,Vehicle_ID_alert,minPrice,maxPrice,type, alertID)"
					+ "VALUES(?,?,?,?,?,?)";
			PreparedStatement ps402 = con.prepareStatement(insert);
			ps402.setInt(1,Integer.parseInt(CustomerID_2));
			ps402.setInt(2,VehicleId);
			ps402.setInt(3,Integer.parseInt(request.getParameter("pPrice")));
			ps402.setInt(4, Integer.parseInt(request.getParameter("pPrice")));
			ps402.setString(5,carType);
			ps402.setInt(6,alertID);
			ps402.executeUpdate();
		}
	
	
	//Run the query against the database ***Note this has not been tested yet.
	//get singular query
	resultChecker.close();

	
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
	Date date2 = new Date(date);
	java.sql.Date sqlDate = new java.sql.Date(date2.getTime());
	
	String insert = "INSERT INTO vehicle_sells(VehicleID,CustomerID,modelName,modelMake,modelYear,date,isBike,isCar,isSUV,hidden_price,dateSQLObject,initial_price,seller_increment)"
			+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	Timestamp x = new Timestamp(date2.getTime());
	//out.println(x.toString());
	PreparedStatement ps = con.prepareStatement(insert);
	ps.setInt(1,VehicleId);
	ps.setInt(2,id);
	ps.setString(3,name);
	ps.setString(4,make);
	ps.setString(5,year);
	ps.setString(6,date);
	ps.setInt(7,isBike);
	ps.setInt(8,isCar);
	ps.setInt(9,isSuv);
	ps.setInt(10,Integer.parseInt(price));
	ps.setTimestamp(11,new Timestamp(date2.getTime()));
	ps.setInt(12,Integer.parseInt(request.getParameter("pPrice")));
	ps.setInt(13,Integer.parseInt(request.getParameter("incr")));
	ps.executeUpdate();
	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	out.println("<center>Successful Registration!</center>");
	out.println("<center><p> <a href=\"listings.jsp\">See new deals!</a>. </p> </center>");
	out.println("<center><p> <a href=\"bid.jsp\">Bid on an item!</a>. </p> </center>");
	//close the connection.
	db.closeConnection(con);
	//catch excpetion
}catch (Exception e) {
	out.println(e);
	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	out.println("Failed Registration, Go back please.");
}
	
%>



</body>
</html>
