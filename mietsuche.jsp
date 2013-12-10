<!DOCTYPE HTML>
	<head>
		<title> Mietvertrag suchen... </title>
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	</head>
	<body>
		<!-- // Pakete importieren:-->
		<%@ page import="java.util.*"%>
		<%@ page language="java" import="java.sql.*"%>
        <jsp:useBean id="dbConnection" class="dblab10.SQLConnectBean" scope="session"/>

		<h1> Mietvertrag suchen...</h1>
		
		<form method="POST" action="mietsuche.jsp"> 
			
			<label><input type="text" name="auftragsNr" placeholder="Hier auftragsNr eingeben..."></label>
			<br>
			
			<input type="submit" value="Suchen">
			<input type="reset" value="Zur&uuml;cksetzen">
		
		</form>
		
		<%
			// Parameter "auftragsNr" aus dem POST-Request anfordern und in String name speichern
			String auftragsNr = request.getParameter("auftragsNr");
            ResultSet result = null;
            String query = null;

			if ((auftragsNr == null) || (auftragsNr.equals("all"))) {
                query = "SELECT * FROM mietet";
            } else {
                query = "SELECT * FROM mietet WHERE auftragsNr = '" +auftragsNr+ "' ";
            }

            if (dbConnection.connectToMySQL()) {
            //if (dbConnection.connectToOrcl()) {
                result = dbConnection.sqlQuery(query);
            }
		%>

		<hr>
		<p> Suchergebnisse: </p>
		
	<table>	
		<tr>
			<th> Auftragsnummer </th>
			<th> Kundennummer </th>
			<th> Datum </th>
			<th> Autonummer </th>
			<th> Personalnummer </th>
		</tr>
			<% 
                while (result.next()) {
                    out.println("<tr>");
                    out.println("<td>"+result.getString(1)+"</td>");
                    out.println("<td>"+result.getString(2)+"</td>");
                    out.println("<td>"+result.getString(3)+"</td>");
                    out.println("<td>"+result.getString(4)+"</td>");
					 out.println("<td>"+result.getString(5)+"</td>");
                    out.println("</tr>");
                } 
                dbConnection.cleanUp();
            %>
	</table>	
	</body>
</HTML>		
