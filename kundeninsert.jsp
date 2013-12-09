<!DOCTYPE html>
	<head> 
		<title> Neuen Kunden anlegen </title>
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	</head>
	<body>
	
	<form method="POST" action="kundeninsert.jsp">
	
	<h1> Neuen Kunden anlegen </h1>
	<fieldset> 
		<legend> F&uuml;llen Sie bitte die ben&ouml;tigten Felder aus </legend>
		
		<label> kundenNr ---- <input type="text" name="kundenNr" value=""> </label><br>
		<label> vorname -----<input type="text" name="vorname" value=""></label><br>
		<label> nachname --- <input	type="text" name="nachname" value=""> </label> <br>
		<label> geburtsdatum  <input type="text" name="geburtsdatum" value=""> </label> <br>
	</fieldset>
	<br>
	<input type="submit" value="Anlegen">
	<input type="reset" value="Zur&uuml;cksetzen">
	</form>	
	
	
	<%@ page import="java.util.*"%>
	<%@ page language="java" import="java.sql.*"%>
	
	<%
		String kundenNr = request.getParameter("kundenNr");
		String vorname = request.getParameter("vorname");
		String nachname = request.getParameter("nachname");
		String geburtsdatum = request.getParameter("geburtsdatum");
		
		try {
			// Oracle-Driver laden
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Verbindung zur Datenbank initiieren
			Connection myconnection = DriverManager.getConnection ("jdbc:oracle:thin:@bert.mi.fh-offenburg.de:1521:orcl", "dblab10", "dblab10");
			// Eigenes Statement erzeugen
			Statement mystatement  = myconnection.createStatement();
			
			if (kundenNr==null)
				{;}
			
			String query = "INSERT INTO Kunde VALUES ('"+kundenNr+"', '"+vorname+"', '"+nachname+"', '"+geburtsdatum+"')";
			ResultSet myresult = mystatement.executeQuery(query);
			myresult.close();
			
			ResultSet result2 = statement.executeQuery("select * from Kunde");
	%>
	
	<table>
		
		<tr>
			<th> Autonummer </th>
			<th> vorname </th>
			<th> nachnamel-Bezeichnung </th>
			<th> geburtsdatum-Zahl </th>
		</tr>
		<tr>
			<% while (result2.next())
			{
				out.println("<td>"+result2.getString(1)+"</td>");
				out.println("<td>"+result2.getString(2)+"</td>");
				out.println("<td>"+result2.getString(3)+"</td>");
				out.println("<td>"+result2.getString(4)+"</td>");
			} %>
		</tr>
	</table>	
			
	<%		
			result2.close();
			mystatement.close();
			myconnection.close();
			} catch (Exception e) {out.println("Error: "+e);}
	%>	
	
	
	
	
	</body>
	</html>				
