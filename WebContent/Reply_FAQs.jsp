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
	String QuesAnswer = request.getParameter("Qanswer");
	QuesAnswer="\""+QuesAnswer+"\"";
	String QID = request.getParameter("Qid");
	
	
	ResultSet result = stmt.executeQuery("SELECT * FROM representative_creates r WHERE r.username=" + "\""+ session.getAttribute("user") + "\"" + ";");
	result.next();
	
	int RepID=Integer.parseInt(result.getString("UserID"));
	
	stmt.executeUpdate("UPDATE faqs SET answer = "+ QuesAnswer+", RepresentativeID= "+ RepID+" WHERE Qid="+QID+";");
	
	out.println("<center>Successfully Submitted the Answer!</center>");

	out.println("<br>");
	out.println("<br>");
	out.println("<br>");

	out.println("<center><button onclick=\"window.location.href='Browse_FAQs.jsp';\">Browse FAQs</button></center>");
	
	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	
	//close the connection.
	db.closeConnection(con);
	//catch excpetion
}
catch (Exception e) {
	out.println(e);
	out.println("<center>Failed to submit the answer! </center>");
	out.println("<br>");
	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	
}


%>

</body>
</html>