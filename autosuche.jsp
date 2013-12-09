<!DOCTYPE HTML>
	<head>
		<title> Autos suchen... </title>
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	</head>
	<body>
		<!-- // Pakete importieren:-->
		<%@ page import="java.util.*"%>
		<%@ page language="java" import="java.sql.*"%>
        <jsp:useBean id="dbConnection" class="dblab10.SQLConnectBean" scope="session"/>

		<h3> Autos suchen...</h3>
		
		<form method="POST" action="autosuche.jsp"> 
			
			<label><input type="text" name="autoNr" placeholder="Hier autoNr eingeben..."></label>
			<br>
			
			<input type="submit" value="Suchen">
			<input type="reset" value="Zur&uuml;cksetzen">
		
		</form>
		
		<%
			// Parameter "autoNr" aus dem POST-Request anfordern und in String name speichern
			String autoNr = request.getParameter("autoNr");
            ResultSet result = null;

			if (autoNr==null) {
				autoNr="";}

            String query = "SELECT * FROM Auto WHERE autoNr = '" +autoNr+ "' ";

            if (dbConnection.connectToMySQL()) {
                result = dbConnection.sqlQuery(query);
            }
		%>

		<hr>
		<p> Suchergebnisse: </p>
		
	<table>	
		<tr>
			<th> Autonummer </th>
			<th> Farbe </th>
			<th> Modell-Bezeichnung </th>
			<th> PS-Zahl </th>
		</tr>
		<tr>
			<% while (result.next())
			{
				out.println("<td>"+result.getString(1)+"</td>");
				out.println("<td>"+result.getString(2)+"</td>");
				out.println("<td>"+result.getString(3)+"</td>");
				out.println("<td>"+result.getString(4)+"</td>");
			} 

            dbConnection.cleanUp();
            %>
		</tr>
	</table>	
	</body>
</HTML>		
