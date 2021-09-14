<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href = "/cssfiles/login_style.css" rel="stylesheet" type="text/css">
<body style = "background-color: lightblue;">



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search Bar Options</title>
	</head>
	
	<body>

		<center>Welcome to Search Options! Please be Aware of Specifications for Each Search Box</center> <!-- the usual HTML way -->
	
							  
	<br>
	<form action="VehicleTypeSearch.jsp" method="post">
	Vehicle Type (Bike, Car, SUV) :<input type="text" name="type" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="ListDateSearch.jsp" method="post">
	List Date (Day (3-letters only) Month (3-letters only) 00 (day) 00:00:00 UTC 2021):<input type="text" name="dateSQL" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="BidDateSearch.jsp" method="post">
	Bid Date (Day (3-letters only) Month (3-letters only) 00 (day) 00:00:00 UTC 2021), :<input type="text" name="dateSQL" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="VehicleIDSearch.jsp" method="post">
	Vehicle ID :<input type="text" name="vehicleID" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="BidIDSearch.jsp" method="post">
	bidID :<input type="text" name="bidID" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="CustomerIDSearch.jsp" method="post">
	customerID (Seller - History of Listings for specified CustomerID):<input type="text" name="customerID" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="BiddingCustomerIDSearch.jsp" method="post">
	customerID (Bidder - History of Bids for specified CustomerID):<input type="text" name="customerID" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="ModelNameSearch.jsp" method="post">
	Name of Model :<input type="text" name="modelName" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="ModelMakeSearch.jsp" method="post">
	Model Make (Company) :<input type="text" name="modelMake" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="ModelYearSearch.jsp" method="post">
	Model Year :<input type="text" name="modelYear" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="PriceAndBelowSearch.jsp" method="post">
	Specified Price and Below (Entries where current highest bid is at or below price specified) :<input type="text" name="pAB" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="PriceAndAboveSearch.jsp" method="post">
	Specified Price and Above :<input type="text" name="pAA" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="HistoryofBidding.jsp" method="post">
	Enter VehicleID for Bidding History :<input type="text" name="history" /><br>
	<input type="submit" value="Search" /> </form>
	
	<form action="SimilarItems.jsp" method="post">
	Enter VehicleID for Similar Items in the Past Month :<input type="text" name="similar" /><br>
	<input type="submit" value="Search" /> </form>
	
	<br>

</body>
</html>