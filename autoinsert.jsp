<!DOCTYPE html>
	<head> 
		<title> Neues Auto anlegen </title>
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	</head>
	<body>
	
	<form method="POST" action="autoinsert.jsp">
	
	<h1> Neues Auto anlegen </h1>
	<fieldset> 
		<legend> F&uuml;llen Sie bitte die ben&ouml;tigten Felder aus </legend>
		
		<label> autoNr ------------- <input type="text" name="autoNr" value="" tabindex="5"> </label><br>
		<label> farbe ---------------
						<select name="farbe" size=1>
							<option value="schwarz"> Schwarz </option>
							<option value="weiss"> Weiss </option>
							<option value="silber"> Silber </option>
							<option value="blau"> Blau </option>
							<option value="rot"> Rot </option>
						</select>	
		</label><br>
		<label> Model-Bezeichner <input	type="text" name="model" value="" tabindex="5"> </label> <br>
		<label> PS-Zahl ------------ <input type="text" name="ps" value=""> </label> <br>
	</fieldset>
	<br>
	<input type="submit" value="Anlegen">
	<input type="reset" value="Zur&uuml;cksetzen">
	</form>	
	
	
	<%@ page import="java.util.*"%>
	<%@ page language="java" import="java.sql.*"%>
	
	<%
		String autoNr = request.getParameter("autoNr");
		String farbe = request.getParameter("farbe");
		String model = request.getParameter("model");
		String ps = request.getParameter("ps");
		
		try {
			// Oracle-Driver laden
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Verbindung zur Datenbank initiieren
			Connection myconnection = DriverManager.getConnection ("jdbc:oracle:thin:@bert.mi.fh-offenburg.de:1521:orcl", "dblab10", "dblab10");
			// Eigenes Statement erzeugen
			Statement mystatement  = myconnection.createStatement();
			
			if (autoNr==null)
				{;}
			
			String query = "INSERT INTO Auto VALUES ('"+autoNr+"', '"+farbe+"', '"+model+"', '"+ps+"')";
			ResultSet myresult = mystatement.executeQuery(query);
			myresult.close();
			
			ResultSet result2 = statement.executeQuery("select * from Auto");
	%>
	
	<table>
		
		<tr>
			<th> auto </th>
			<th> autafafo </th>
			<th> autofaf </th>
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
