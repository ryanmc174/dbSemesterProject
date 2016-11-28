<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mass Shootings</title>
</head>
<body>
Mass Shootings in the United States 2014 - 2016 <!-- the usual HTML way -->
									  
<br>
 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<form method="get" action="showshootings.jsp" enctype=text/plain>
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <input type="radio" name="command" value="MassShootings_2014"/>2014 Shootings
  <br>
  <input type="radio" name="command" value="MassShootings_2015"/>2015 Shootings
    <!-- when the radio for bars is chosen, then 'command' will have value 
     | 'bars', in the show.jsp file, when you access request.parameters -->
  <br>
  <input type="radio" name="command" value="MassShootings_2016"/>2016 Shootings
  <br>
  <input type="submit" value="submit" />
</form>
<br>

Alternatively, lets type in a bar and a beer and  a price limit.
<br>
	<form method="post" action="newBeer.jsp">
	<table>
	<tr>    
	<td>Bar</td><td><input type="text" name="bar"></td>
	</tr>
	<tr>
	<td>Beer</td><td><input type="text" name="beer"></td>
	</tr>
	<tr>
	<td>Price</td><td><input type="text" name="price"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
<br>

Query based on number killed
<br>
	<form method="query" action="query.jsp">
		<select name="price" size=1>
			<option value="0.0">0 or More</option>
			<option value="2.0">2 or More</option>
			<option value="5.0">5 or More</option>
			<option value="8.0">8 or More</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

</body>
</html>