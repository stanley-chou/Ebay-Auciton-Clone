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
<title>Bid Result</title>
</head>

<body>
<%


try {
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB(); 
	Connection con = db.getConnection();
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String vid = request.getParameter("VID");
	
	//Get the selected radio button from the index.jsp
	String str = "SELECT * FROM vehicle_sells where VehicleID = "+vid+";";
	ResultSet result = stmt.executeQuery(str);
	result.next();
	Date bidEnd = new Date(result.getString("date"));
	int hiddenPrice = Integer.parseInt(result.getString("hidden_price"));
	result.close();
	Date date = new Date();
	if(date.after(bidEnd)){
	
		out.println("This Bid is Over,Go Back");
		out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
		String str2 = "SELECT BidID, priceBid, time_left,VehicleID,CustomerID FROM Bid where VehicleID = "+vid+" and priceBid = (select max(b.priceBid) from bid b where VehicleID = " +vid+ ") and dateSQLObject = (select max(b.dateSQLObject) from bid b where VehicleID = " +vid+ ");";
		ResultSet result10 = stmt.executeQuery(str2);
		
		while(result10.next()){ //determines winner
				if(Integer.parseInt(result10.getString("priceBid")) > hiddenPrice){
					Random rnd3 = new Random();
					int alertID = rnd3.nextInt(999999);
				String insert3 = "INSERT INTO alerts(userID_alert,Vehicle_ID_alert,minPrice,maxPrice,type,alertID)"
						+ "VALUES(?,?,?,?,?,?)";
				PreparedStatement ps3 = con.prepareStatement(insert3);
				ps3.setInt(1,Integer.parseInt(result10.getString("CustomerID")));
				ps3.setInt(2,Integer.parseInt(result10.getString("VehicleID")));
				ps3.setInt(3,Integer.parseInt(result10.getString("priceBid")));
				ps3.setInt(4,Integer.parseInt(result10.getString("priceBid")));
				ps3.setString(5,"You have Won the Auction!");
				ps3.setInt(6,alertID);
				ps3.executeUpdate();
			}		
		}
		
		result10.close();
		
		// sort by date to determine who won later *N.B
		

	}else{
	int upper = Integer.parseInt(request.getParameter("upper"));
	int amt = Integer.parseInt(request.getParameter("amt"));
	int VID = Integer.parseInt(request.getParameter("VID"));
	int incr = Integer.parseInt(request.getParameter("incr"));
	ResultSet results234 = stmt.executeQuery("SELECT * FROM customer c WHERE c.username=" + "\""+ session.getAttribute("user") + "\"" + ";");
	results234.next();
	int userID = Integer.parseInt(results234.getString("UserId"));
	results234.close();
	
	Random rnd = new Random();
	int bidID = rnd.nextInt(999999);
	if(upper != 0){ //automatic

		
		//ResultSet results100 = stmt.executeQuery( "SELECT BidID,priceBid, BidIncrement, time_left,VehicleID,CustomerID FROM Bid where VehicleID = "+vid+" and priceBid = (select max(b.priceBid) from bid b where VehicleID = " +vid+ ");");
		//results100.next();
		//amt = Integer.parseInt(results100.getString("priceBid"))+1;
		//results100.close();
		
		String insert99 = "INSERT INTO bid(BidID,priceBid,time_left,VehicleID,CustomerID,upperLimit,bidIncrement,dateSQLObject)"
		+ "VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement ps99 = con.prepareStatement(insert99);
		ps99.setInt(1,bidID);
		ps99.setInt(2,amt);
		ps99.setString(3,date.toString());
		ps99.setInt(4,VID);
		ps99.setInt(5,userID);
		ps99.setInt(6,upper); // add increment to original till you are above the competitor
		ps99.setInt(7,incr); 
		ps99.setTimestamp(8,new Timestamp(date.getTime())); 
		ps99.executeUpdate(); 
	
	}else{//standard manual bid
		
		String insert = "INSERT INTO bid(BidID,priceBid,time_left,VehicleID,CustomerID,upperLimit,bidIncrement,dateSQLObject)"
		+ "VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setInt(1,bidID);
		ps.setInt(2,amt);
		ps.setString(3,date.toString());
		ps.setInt(4,VID);
		ps.setInt(5,userID);
		ps.setInt(6,0);
		ps.setInt(7,0);
		ps.setTimestamp(8,new Timestamp(date.getTime())); 
		ps.executeUpdate(); 
	
	}
	

	
	//code to alert those whose bids have been beaten
	ResultSet results3 = stmt.executeQuery("SELECT * from bid b where b.priceBid < "+amt +" and b.VehicleID = "+VID + ";");
	while(results3.next()){
		String insert2 = "INSERT INTO alerts(userID_alert,Vehicle_ID_alert,minPrice,maxPrice,type,alertID)"
		+ "VALUES(?,?,?,?,?,?)";
		Random rnd3 = new Random();
		int alertID = rnd3.nextInt(999999);
		PreparedStatement ps2 = con.prepareStatement(insert2);
		ps2.setInt(1,Integer.parseInt(results3.getString("CustomerID")));
		ps2.setInt(2,Integer.parseInt(results3.getString("VehicleID")));
		ps2.setInt(3,Integer.parseInt(results3.getString("priceBid")));
		ps2.setInt(4,amt);
		ps2.setString(5,"You have been out bid! ");
		ps2.setInt(6,alertID);
		ps2.executeUpdate(); 
	}
	results3.close();
	
	//code to alert those to update upper limits
	
	ResultSet results4 = stmt.executeQuery("SELECT * from bid b where b.upperLimit < " + amt + " and b.VehicleID = "+VID + ";");
	while(results4.next()){
		if(Integer.parseInt(results4.getString("bidIncrement")) != 0){
			String insert48 = "INSERT INTO alerts(userID_alert,Vehicle_ID_alert,minPrice,maxPrice,type,alertID)"
			+ "VALUES(?,?,?,?,?,?)";
			Random rnd3 = new Random();
			int alertID = rnd3.nextInt(999999);
			PreparedStatement ps98 = con.prepareStatement(insert48);
			ps98.setInt(1,Integer.parseInt(results4.getString("CustomerID")));
			ps98.setInt(2,Integer.parseInt(results4.getString("VehicleID")));
			ps98.setInt(3,Integer.parseInt(results4.getString("upperLimit")));
			ps98.setInt(4,amt);
			ps98.setString(5,"Your Upper Limit has been Exceeded!");
			ps98.setInt(6,alertID);
			ps98.executeUpdate(); 
		}
	}
	results4.close();
	//increase automatic bid amounts and alert the user if an update happens
	ResultSet results60 = stmt.executeQuery("SELECT * from bid b where b.upperLimit > " + amt + "+ b.bidIncrement and b.VehicleID = "+VID + ";");
	while(results60.next()){
		if(Integer.parseInt(results60.getString("bidIncrement")) != 0 && (Integer.parseInt(results60.getString("priceBid")) < amt)
				&&  (Integer.parseInt(results60.getString("priceBid"))+Integer.parseInt(results60.getString("bidIncrement")) < Integer.parseInt(results60.getString("upperLimit")))){
			int totalIncrement = Integer.parseInt(results60.getString("bidIncrement"));
			while(Integer.parseInt(results60.getString("priceBid")) + totalIncrement <= amt ){
				totalIncrement = totalIncrement + Integer.parseInt(results60.getString("bidIncrement"));
			}
			
			int new_bid = (Integer.parseInt(results60.getString("priceBid")) + totalIncrement);
			String updateMe = "update bid set priceBid = " + new_bid + " where BidID = " + results60.getString("BidID") +";"; //#update the date too
			stmt.executeUpdate(updateMe);
			
			
			String insert67 = "INSERT INTO alerts(userID_alert,Vehicle_ID_alert,minPrice,maxPrice,type,alertID)"
					+ "VALUES(?,?,?,?,?,?)";
					Random rnd3 = new Random();
					int alertID = rnd3.nextInt(999999);
					PreparedStatement ps501 = con.prepareStatement(insert67);
					ps501.setInt(1,userID);
					ps501.setInt(2,VID);
					ps501.setInt(3,amt);
					ps501.setInt(4,new_bid);
					ps501.setString(5,"You have been out bid by an automatic bidder!");
					ps501.setInt(6,alertID);
					ps501.executeUpdate(); 
					
			results60 = stmt.executeQuery("SELECT * from bid b where b.upperLimit > " + amt + "+ b.bidIncrement and b.VehicleID = "+VID + ";");
			
		}
	
	}
	results60.close();
	//automatic bidders bidding against themselves
	
	
	ResultSet results420 = stmt.executeQuery("SELECT Max(priceBid) as MaxBid from bid b Where b.VehicleID = "+VID + ";");
	int maximumBid =0;
	int maximum2 = -1; //if the maximum is the same 2 cycles in a row then it is time to move on the maximum bid has been finalized
	while(results420.next()){
		maximumBid = Integer.parseInt(results420.getString("MaxBid"));
		if(maximumBid == maximum2){
			break;
		}
		ResultSet results77 = stmt.executeQuery("SELECT * from bid b where b.upperLimit > " + maximumBid + "+ b.bidIncrement and b.VehicleID = "+VID + ";"); //could cause probelms if bid increment is huge
		while(results77.next()){
			if(Integer.parseInt(results77.getString("bidIncrement")) != 0 && (Integer.parseInt(results77.getString("priceBid")) < maximumBid)
					&&  (Integer.parseInt(results77.getString("priceBid"))+Integer.parseInt(results77.getString("bidIncrement")) < Integer.parseInt(results77.getString("upperLimit")))){
				int totalIncrement = Integer.parseInt(results77.getString("bidIncrement"));
				while(Integer.parseInt(results77.getString("priceBid")) + totalIncrement <= maximumBid ){
					totalIncrement = totalIncrement + Integer.parseInt(results77.getString("bidIncrement"));
				}
				//out.println(totalIncrement);
				int new_bid = (Integer.parseInt(results77.getString("priceBid")) + totalIncrement);
				String updateMe = "update bid set priceBid = " + new_bid + " where BidID = " + results77.getString("BidID") +";"; //#update the date too
				stmt.executeUpdate(updateMe);
				results77 = stmt.executeQuery("SELECT * from bid b where b.upperLimit > " + maximumBid + "+ b.bidIncrement and b.VehicleID = "+VID + ";");
			}
		}
		 results77.close();
		 results420 = stmt.executeQuery("SELECT Max(priceBid) as MaxBid from bid b Where b.VehicleID = "+VID + ";");
		 maximum2 = maximumBid;
	}
	results420.close();
	
	//reminding the automatic bidders whose upper limit was surpassed that their upper limit got surpassed
	
	//code to alert those to update upper limits
	
	ResultSet results44 = stmt.executeQuery("SELECT * from bid b where (b.upperLimit-b.bidIncrement) < " + maximumBid + " and b.VehicleID = "+VID + ";");
	while(results44.next()){
		if(Integer.parseInt(results4.getString("bidIncrement")) != 0){
			String insert48 = "INSERT INTO alerts(userID_alert,Vehicle_ID_alert,minPrice,maxPrice,type,alertID)"
			+ "VALUES(?,?,?,?,?,?)";
			Random rnd3 = new Random();
			int alertID = rnd3.nextInt(999999);
			PreparedStatement ps98 = con.prepareStatement(insert48);
			ps98.setInt(1,Integer.parseInt(results4.getString("CustomerID")));
			ps98.setInt(2,Integer.parseInt(results4.getString("VehicleID")));
			ps98.setInt(3,Integer.parseInt(results4.getString("upperLimit")));
			ps98.setInt(4,maximumBid);
			ps98.setString(5,"Your Upper Limit has been Exceeded!");
			ps98.setInt(6,alertID);
			ps98.executeUpdate(); 
		}
	}
	results44.close();
	
	
	//code to alert those whose bids have been beaten
	ResultSet results33 = stmt.executeQuery("SELECT * from bid b where b.priceBid < "+maximumBid +" and b.VehicleID = "+VID + ";");
	while(results33.next()){
		String insert2 = "INSERT INTO alerts(userID_alert,Vehicle_ID_alert,minPrice,maxPrice,type,alertID)"
		+ "VALUES(?,?,?,?,?,?)";
		Random rnd3 = new Random();
		int alertID = rnd3.nextInt(999999);
		PreparedStatement ps2 = con.prepareStatement(insert2);
		ps2.setInt(1,Integer.parseInt(results3.getString("CustomerID")));
		ps2.setInt(2,Integer.parseInt(results3.getString("VehicleID")));
		ps2.setInt(3,Integer.parseInt(results3.getString("priceBid")));
		ps2.setInt(4,maximumBid);
		ps2.setString(5,"You have been out bid! ");
		ps2.setInt(6,alertID);
		ps2.executeUpdate(); 
	}
	results33.close();
	//end
	
	out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
	out.println("<br>");
	out.println("<center> Succesful Bid, Go Back </center>"); 
	
	}
	
	//close the connection.
	db.closeConnection(con);
	
	
	
	
} catch (Exception e) {
	//There was a bug where everything was inserted upon incrementing a new bid
	if(e.toString().equals("java.sql.SQLException: Operation not allowed after ResultSet closed")){
		out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
		out.println("<br>");
		out.println("<center>Successful Bid, Go Back </center>");
	}
	else if(e.toString().equals("com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column 'type' at row 1"))
	{
		out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
		out.println("<br>");
		out.print("<center>Successful Bid, Go Back </center>");
	}
	else{
		out.println("<center><p> <a href=\"logout.jsp\"  style=\"position: absolute; top: 0; right: 0; width: 100px; text-align:right;\" >Logout</a>. </p> </center>");
		out.println("<br>");
		out.print("<center>Failure, Go Back</center>");
	}
}












%>

</body>
</html>
