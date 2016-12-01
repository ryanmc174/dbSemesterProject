<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mass Shootings</title>
<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript" src="js/raphael.js"></script>
<script type="text/javascript" src="js/jquery.usmap.js"></script>

</head>
<body>
Mass Shootings in the United States 2014 - 2016 <!-- the usual HTML way -->

<h5>Results:</h5>
<div id="clickedState">Click on a State</div>
<br>
<div id="map" style="width: 300px; height: 200px;"></div>

<div id="population"> Population:  </div>
<div id="percentWhite"> White %: </div>
<div id="percentBlack"> Black %: </div>
<div id="percentAsian"> Asian %: </div>
<div id="percentHispanic"> Hispanic %: </div>
<div id="percentOther"> Other %: </div>
<div id="numKilled"> Number of Deaths: </div>

<script> 
$(document).ready(function() {
    $('#map').usmap({
    	stateHoverStyles: {fill: 'red'},
    	click: function(event, data) {
    		$('#clickedState')
    		.text('You clicked: '+data.name)
    	    .parent().effect('highlight', {color: '#C7F464'}, 2000);
    	}
    });
  });
</script>
 								  
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

Query based on several factors
<br>
	<form method="query" action="query.jsp">
		Year<select name="year" size=1>
			<option value="any">Any</option>
			<option value="MassShootings_2014">2014</option>
			<option value="MassShootings_2015">2015</option>
			<option value="MassShootings_2016">2016</option>
		</select><br>	
		Month of Incident<select name="month" size=1>
			<option value="any">Any</option>
			<option value="Jan">January</option>
			<option value="Feb">February</option>
			<option value="Mar">March</option>
			<option value="Apr">April</option>
			<option value="May">May</option>
			<option value="Jun">June</option>
			<option value="Jul">July</option>
			<option value="Aug">August</option>
			<option value="Sep">September</option>
			<option value="Oct">October</option>
			<option value="Nov">November</option>
			<option value="Dec">December</option>
		</select><br>
		State <select name="state" size=1>
			<option value="any">Any</option>
			<option value="Alabama">Alabama</option>
			<option value="Alaska">Alaska</option>
			<option value="Arizona">Arizona</option>
			<option value="Arkansas">Arkansas</option>
			<option value="California">California</option>
			<option value="Colorado">Colorado</option>
			<option value="Connecticut">Connecticut</option>
			<option value="Delaware">Delaware</option>
			<option value="District Of Columbia">District Of Columbia</option>
			<option value="Florida">Florida</option>
			<option value="Georgia">Georgia</option>
			<option value="Hawaii">Hawaii</option>
			<option value="Idaho">Idaho</option>
			<option value="Illinois">Illinois</option>
			<option value="Indiana">Indiana</option>
			<option value="Iowa">Iowa</option>
			<option value="Kansas">Kansas</option>
			<option value="Kentucky">Kentucky</option>
			<option value="Louisiana">Louisiana</option>
			<option value="Maine">Maine</option>
			<option value="Maryland">Maryland</option>
			<option value="Massachusetts">Massachusetts</option>
			<option value="Michigan">Michigan</option>
			<option value="Minnesota">Minnesota</option>
			<option value="Mississippi">Mississippi</option>
			<option value="Missouri">Missouri</option>
			<option value="Montana">Montana</option>
			<option value="Nebraska">Nebraska</option>
			<option value="Nevada">Nevada</option>
			<option value="New Hampshire">New Hampshire</option>
			<option value="New Jersey">New Jersey</option>
			<option value="New Mexico">New Mexico</option>
			<option value="New York">New York</option>
			<option value="North Carolina">North Carolina</option>
			<option value="North Dakota">North Dakota</option>
			<option value="Ohio">Ohio</option>
			<option value="Oklahoma">Oklahoma</option>
			<option value="Oregon">Oregon</option>
			<option value="Pennsylvania">Pennsylvania</option>
			<option value="Rhode Island">Rhode Island</option>
			<option value="South Carolina">South Carolina</option>
			<option value="South Dakota">South Dakota</option>
			<option value="Tennessee">Tennessee</option>
			<option value="Texas">Texas</option>
			<option value="Utah">Utah</option>
			<option value="Vermont">Vermont</option>
			<option value="Virginia">Virginia</option>
			<option value="Washington">Washington</option>
			<option value="West Virginia">West Virginia</option>
			<option value="Wisconsin">Wisconsin</option>
			<option value="Wyoming">Wyoming</option>
		</select>
		<br>
		Number Killed<select name="killed" size=1>
			<option value="any">Any</option>
			<option value="0.0">0 or More</option>
			<option value="2.0">2 or More</option>
			<option value="5.0">5 or More</option>
			<option value="8.0">8 or More</option>
		</select>	
		
	<br> <input type="submit" value="submit">
	</form>
<br>

</body>
</html>