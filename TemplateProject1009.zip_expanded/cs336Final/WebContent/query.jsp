<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();
	
		try {

			//Create a connection string
			String url = "jdbc:mysql://cs336db.coije5twjt1b.us-east-1.rds.amazonaws.com:3306/Crime_MassShootings";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "RyanMc174", "masterpassword");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the year from the HelloWorld.jsp
			String entity_year = request.getParameter("year");
			//Get the date from HelloWorld.jsp
			String entity_month = request.getParameter("month");
			//Get the state from HelloWorld.jsp
			String entity_state = request.getParameter("state");
			//Get the numKilled from HelloWorld.jsp
			String entity_killed = request.getParameter("killed");
			
			
			String str2014 = "SELECT * FROM MassShootings_2014 ";
			String str2015 = "SELECT * FROM MassShootings_2015 ";
			String str2016 = "SELECT * FROM MassShootings_2016 ";
			
			String str = "SELECT * FROM ";
			
			//Build Query depending on values of above strings
			if(!entity_year.equals("any")) {
				str = str + entity_year;
				if(entity_state.equals("any")) {
					str = str + " WHERE State LIKE '%'";
				} else {
					str = str + " WHERE State ='" + entity_state + "'";
				}
				if(!entity_killed.equals("any")) {
					str = str + " AND NumKilled >= " + entity_killed;
				}
				if(!entity_month.equals("any")) {
					str = str + " AND IncidentDate LIKE '%" + entity_month + "%'";
				}
			} else {
				//any month must access all tables
				if(entity_state.equals("any")) {
					str2014 = str2014 + " WHERE State LIKE '%'";
					str2015 = str2015 + " WHERE State LIKE '%'";
					str2016 = str2016 + " WHERE State LIKE '%'";
				} else {
					str2014 = str2014 + " WHERE State ='" + entity_state + "'";
					str2015 = str2015 + " WHERE State ='" + entity_state + "'";
					str2016 = str2016 + " WHERE State ='" + entity_state + "'";
				}
				if(!entity_killed.equals("any")) {
					str2014 = str2014 + "AND NumKilled >= " + entity_killed;
					str2015 = str2015 + "AND NumKilled >= " + entity_killed;
					str2016 = str2016 + "AND NumKilled >= " + entity_killed;
				}
				if(!entity_month.equals("any")) {
					str2014 = str2014 + "AND IncidentDate LIKE '%" + entity_month + "%'";
					str2015 = str2015 + "AND IncidentDate LIKE '%" + entity_month + "%'";
					str2016 = str2016 + "AND IncidentDate LIKE '%" + entity_month + "%'";
				}
				str = str2014 + " UNION " + str2015 + " UNION " + str2016;
			}
			
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Incident Date");
			out.print("</td>");
			out.print("<td>");
			out.print("State");
			out.print("</td>");
			out.print("<td>");
			out.print("City or County");
			out.print("</td>");
			out.print("<td>");
			out.print("Address");
			out.print("</td>");
			out.print("<td>");
			out.print("Number Killed");
			out.print("</td>");
			out.print("<td>");
			out.print("Number Injured");
			out.print("</td>");
			out.print("<td>");
			out.print("Operations");
			out.print("</td>");
			out.print("<td>");
			out.print("Incident ID");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			//print out the rows in order
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print(result.getString("IncidentDate"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("State"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("City or County"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("Address"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("NumKilled"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("# Injured"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("Operations"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("Incident ID"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>