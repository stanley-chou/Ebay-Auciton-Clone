<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Representative Registration</title>
</head>
<body style = "background-color: lightblue;">

<% 	
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();
		
		
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String Repusername=request.getParameter("user");
		String user_password=request.getParameter("password");
		String city =request.getParameter("city");
		String state =request.getParameter("state");
		String street =request.getParameter("street");
		String country =request.getParameter("country");
		String zip_code =request.getParameter("zip_code");
		String email_address =request.getParameter("email_address");
		
		ResultSet result = stmt.executeQuery("SELECT * FROM administrative_staff WHERE username=" + "\"" + session.getAttribute("user") + "\""+";");
		result.next();
		String adminID=result.getString("User_ID");
		
		
		String phoneNum = request.getParameter("phoneNum");
		Random rnd = new Random();
		int userId = rnd.nextInt(999999);
		//Run the query against the database ***Note this has not been tested yet.
		String insert = "INSERT INTO representative_creates(userId,city,state,street,country,zip_code,user_password,username,phoneNum,email_address,AdminId)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setInt(1,userId);
		ps.setString(2,city);
		ps.setString(3,state);
		ps.setString(4,street);
		ps.setString(6,zip_code);
		ps.setString(5,country);
		ps.setString(7,user_password);
		ps.setString(8,Repusername);
		ps.setString(9,phoneNum);
		ps.setString(10,email_address);
		ps.setString(11,adminID);
		ps.executeUpdate();
		
		out.println("Representative Successfully Registered!");
		
		out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
		
		//close the connection.
		db.closeConnection(con);
		result.close();
		//catch excpetion
	}catch (Exception e) {
			out.print(e);
			out.print("<center>Failure to Register, User with these credentials exists! <center>");
			out.println("<br>");
			out.println("<center><button onclick=\"window.location.href='adminlogin.jsp';\">Go Back</button></center>");
	}


%>
</body>
</html>