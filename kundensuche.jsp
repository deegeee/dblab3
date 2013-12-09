<!DOCTYPE HTML>
	<head>
		<title> Kunden suchen... </title>
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	</head>
	<body>
		<h3> Kunden suchen...</h3>
		
		<form method="POST" action="kundensuche.jsp"> 
			
			<label><input type="text" name="kundenNr" value="Hier kundenNr eingeben..."></label>
			<br>
			<input type="submit" value="Suchen">
			<input type="reset" value="Zur&uuml;cksetzen">
		
		</form>
		
		
		<!-- // Pakete importieren:-->
		<%@ page import="java.util.*"%>
		<%@ page language="java" import="java.sql.*"%>
		
		<%
			// Parameter "name" aus dem POST-Request anfordern und in String name speichern
			String kundenNr = request.getParameter("kundenNr");
			if (kundenNr==null) {
				kundenNr="";}
			
			try {
				// Oracle-Driver laden
				Class.forName("oracle.jdbc.driver.OracleDriver");
				// Verbindung zur Datenbank initiieren
				Connection myconnection = DriverManager.getConnection ("jdbc:oracle:thin:@bert.mi.fh-offenburg.de:1521:orcl", "dblab10", "dblab10");
				// Eigenes Statement erzeugen
				Statement mystatement  = myconnection.createStatement();
				// SQL-Anfrage formulieren
				String query = "SELECT * FROM Auto WHERE kundenNr = '" +kundenNr+ "' ";
				// SQL-Anfrage ausführen
				ResultSet result_search = mystatement.executeQuery(query);
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
		<tr>
			<% while (result_search.next())
			{
				out.println("<td>"+result_search.getString(1)+"</td>");
				out.println("<td>"+result_search.getString(2)+"</td>");
				out.println("<td>"+result_search.getString(3)+"</td>");
				out.println("<td>"+result_search.getString(4)+"</td>");
			} %>
		</tr>
	</table>	
		
		
		<%
			// ResultSet/ Statement/ Verbindung schließen + Fehlerabfang
			result_search.close();
			mystatement.close();
			myconnection.close();
			} catch(Exception e) {
				  out.println("Error! Something went wrong!" + e);}
		%>		  
				  							
		
	</body>
</HTML>		
