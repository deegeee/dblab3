<!DOCTYPE html>
	<head> 
		<title> Neues Auto anlegen </title>
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	</head>
	<body>

        <%@ page import="java.util.*"%>
        <%@ page language="java" import="java.sql.*"%>
        <jsp:useBean id="dbConnection" class="dblab10.SQLConnectBean" scope="session"/>
	
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
	
	
	
	<%
		String autoNr = request.getParameter("autoNr");
		String farbe = request.getParameter("farbe");
		String model = request.getParameter("model");
		String ps = request.getParameter("ps");

        ResultSet result = null;

        if (dbConnection.connectToMySQL()) {
            if (autoNr == null) {
                ;
            } else {
                // Eigenes Statement erzeugen
                String query = "INSERT INTO Auto VALUES ('"+autoNr+"', '"+farbe+"', '"+model+"', '"+ps+"')";
                // INSERT Befehl
                result = dbConnection.sqlQuery(query);
            }
        }
	%>
	
	<table>
		
		<tr>
			<th> Autonummer </th>
			<th> Farbe </th>
			<th> Modell-Bezeichnung </th>
			<th> PS-Zahl </th>
		</tr>
			<% 
                result = dbConnection.sqlQuery("select * from Auto");

                while (result.next()) {
                    out.println("<tr>");
                    out.println("<td>"+result.getString(1)+"</td>");
                    out.println("<td>"+result.getString(2)+"</td>");
                    out.println("<td>"+result.getString(3)+"</td>");
                    out.println("<td>"+result.getString(4)+"</td>");
                    out.println("<tr>");
                } 
                dbConnection.cleanUp();
            %>
	</table>	
			
	</body>
	</html>				
