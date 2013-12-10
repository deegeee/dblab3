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

		<h1> Autos suchen...</h1>
		
		<form method="POST" action="kundensuche.jsp"> 
			
			<label><input type="text" name="kundenNr" placeholder="Hier kundenNr eingeben..."></label>
			<br>
			
			<input type="submit" value="Suchen">
			<input type="reset" value="Zur&uuml;cksetzen">
		
		</form>
		
		<%
			// Parameter "kundenNr" aus dem POST-Request anfordern und in String name speichern
			String kundenNr = request.getParameter("kundenNr");
            ResultSet result = null;
            String query = null;

			if ((kundenNr == null) || (kundenNr.equals("all"))) {
                query = "SELECT * FROM Kunde";
            } else {
                query = "SELECT * FROM Kunde WHERE kundenNr = '" +kundenNr+ "' ";
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
			<th> Kundennummer </th>
			<th> Vorname </th>
			<th> Nachname </th>
			<th> Geburtsdatum </th>
		</tr>
			<% 
                while (result.next()) {
                    out.println("<tr>");
                    out.println("<td>"+result.getString(1)+"</td>");
                    out.println("<td>"+result.getString(2)+"</td>");
                    out.println("<td>"+result.getString(3)+"</td>");
                    out.println("<td>"+result.getString(4)+"</td>");
                    out.println("</tr>");
                } 
                dbConnection.cleanUp();
            %>
	</table>	
	</body>
</HTML>		
