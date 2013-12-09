<!DOCTYPE HTML>
	<head>
		<title> Autos suchen... </title>
	</head>
	<body>
		<h3> Autos suchen...</h3>
		
		<form method="POST" action="/PFAD/ZUR/DATEI/autosuche.jsp"> 
			
			<label><input type="text" name="autoNr" value="Hier autoNr eingeben..."></label>
			<br>
			
			<input type="submit" value="Suchen">
			<input type="reset" value="Zur&uuml;cksetzen">
		
		</form>
		
		
		<!-- // Pakete importieren:-->
		<%@ page import="java.util.*"%>
		<%@ page language="java" import="java.sql.*"%>
		
		<%
			// Parameter "name" aus dem POST-Request anfordern und in String name speichern
			String autoNr = request.getParameter("autoNr");
			if (autoNr==null) {
				autoNr="";}
			
			try {
				// Oracle-Driver laden
				Class.forName("oracle.jdbc.driver.OracleDriver");
				// Verbindung zur Datenbank initiieren
				Connection myconnection = DriverManager.getConnection ("jdbc:oracle:thin:@bert.mi.fh-offenburg.de:1521:orcl", "dblab10", "dblab10");
				// Eigenes Statement erzeugen
				Statement mystatement  = myconnection.createStatement();
				// SQL-Anfrage formulieren
				String query = "SELECT * FROM Auto WHERE autoNr == '" +autoNr+ "' ";
				// SQL-Anfrage ausführen
				ResultSet result_search = mystatement.executeQuery(query);
		%>
		<hr>
		<p> Suchergebnisse: </p>
		
		<ul> <!-- Punktliste-->
			<%
				// Solange unser ResultSet noch weitere "Treffer"-Objekte beinhaltet...
				while(result_search.next())
				{
			%>
				<!-- Gebe diese Treffer in einer Liste in HTML aus -->
				<!-- getString(1) steht für die erste Spalte der Tabelle von der SELECT-Anfrage -->
					<li> <%=result_search.getString(1)%> </li>
								
				<% } %>
		</ul>
		
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
