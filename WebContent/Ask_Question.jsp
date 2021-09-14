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
	String Question = request.getParameter("question");
	ResultSet result = stmt.executeQuery("SELECT * FROM customer c WHERE c.username=" + "\""+ session.getAttribute("user") + "\"" + ";");
	result.next();
	
	int userID=Integer.parseInt(result.getString("UserId"));
	Random rnd = new Random();
	
	int QuestionId = rnd.nextInt(999999);
	
	
	String insert = "INSERT INTO faqs(CustomerID,Qid,question) VALUES(?,?,?);";
	PreparedStatement ps = con.prepareStatement(insert);
	ps.setInt(1, userID);
	ps.setInt(2,QuestionId);
	ps.setString(3,Question);
	ps.executeUpdate();
	
	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	out.println("<center>Successfully Submitted the Question!</center>");

	out.println("<br>");
	out.println("<br>");
	out.println("<br>");

	out.println("<center><button onclick=\"window.location.href='Browse_FAQs.jsp';\">Browse FAQs</button></center>");
	
	//close the connection.
	db.closeConnection(con);
	//catch excpetion
}
catch (Exception e) {
	out.println(e);
	out.println("<center>Failed to submit the question! </center>");
	out.println("<br>");
	out.println("<center><button onclick=\"window.location.href='CustomerHome.jsp';\">Go Back</button></center>");
}


%>

</body>
</html>