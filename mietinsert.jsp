<!DOCTYPE html>
	<head> 
		<title> Neuen Mietvertrag anlegen </title>
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	</head>
	<body>

        <%@ page import="java.util.*"%>
        <%@ page language="java" import="java.sql.*"%>
        <jsp:useBean id="dbConnection" class="dblab10.SQLConnectBean" scope="session"/>
	
	<form method="POST" action="mietinsert.jsp">
	
	<h1> Neuen Mietvertrag anlegen </h1>
	<fieldset> 
		<legend> F&uuml;llen Sie bitte die ben&ouml;tigten Felder aus </legend>
		
		<label> auftragsNr ----- <input type="text" name="auftragsNr" value=""> </label><br>
		<label> kundenNr ------- <input type="text" name="kundenNr" value=""></label><br>
		<label> Datum ---------- <input	type="text" name="datum" value=""></label> <br>
		<label> autoNr --------- <input type="text" name="autoNr" value=""> </label> <br>
		<label> personalNr ----- <input type="text" name="personalNr" value=""> </label> <br>

	</fieldset>
	<br>
	<input type="submit" value="Anlegen">
	<input type="reset" value="Zur&uuml;cksetzen">
	</form>	
	
	
	
	<%
		String auftragsNr = request.getParameter("auftragsNr");
		String kundenNr = request.getParameter("kundenNr");
		String datum = request.getParameter("datum");
		String autoNr = request.getParameter("autoNr");
		String personalNr = request.getParameter("personalNr");
        String query = null;

        ResultSet result = null;

        if (dbConnection.connectToMySQL()) {
        //if (dbConnection.connectToOrcl()) {
            if (auftragsNr == null) {
                ;
            } else {
                // Eigenes Statement erzeugen
                query = "INSERT INTO mietet VALUES ('"+auftragsNr+"', '"+kundenNr+"', '"+datum+"', '"+autoNr+"', '"+personalNr+"')";
                //out.println("<p>"+query+"</p>");
                // INSERT Befehl
                dbConnection.sqlExecute(query);
            }
        }
	%>
	
	<table>
		
		<tr>
			<th> Auftragsnummer </th>
			<th> Kundennummer </th>
			<th> Datum </th>
			<th> Autonummer </th>
			<th> Personalnummer </th>
		</tr>
			<% 
                query = "select * from mietet";
                result = dbConnection.sqlQuery(query);

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
	</html>				
