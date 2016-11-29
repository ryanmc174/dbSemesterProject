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
			//Get the selected radio button from the HelloWorld.jsp
			String entity = request.getParameter("command");
			//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
			String str = "SELECT * FROM " + entity;
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