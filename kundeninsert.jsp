<!DOCTYPE html>
	<head> 
		<title> Neuen Kunden anlegen </title>
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	</head>
	<body>

        <%@ page import="java.util.*"%>
        <%@ page language="java" import="java.sql.*"%>
        <jsp:useBean id="dbConnection" class="dblab10.SQLConnectBean" scope="session"/>
	
	<form method="POST" action="kundeninsert.jsp">
	
	<h1> Neuen Kunden anlegen </h1>
	<fieldset> 
		<legend> F&uuml;llen Sie bitte die ben&ouml;tigten Felder aus </legend>
		
		<label> kundenNr ------------- <input type="text" name="kundenNr" value=""> </label><br>
		<label> vorname  ------------- <input type="text" name="vorname" value=""></label><br>
		<label> nachname ------------- <input type="text" name="nachname" value=""> </label> <br>
		<label> geburtsdatum --------- <input type="text" name="geburtsdatum" placeholder="TT-MON-YYYY"> </label> <br>
	</fieldset>
	<br>
	<input type="submit" value="Anlegen">
	<input type="reset" value="Zur&uuml;cksetzen">
	</form>	
	
	
	
	<%
		String kundenNr = request.getParameter("kundenNr");
		String vorname = request.getParameter("vorname");
		String nachname = request.getParameter("nachname");
		String geburtsdatum = request.getParameter("geburtsdatum");
        String query = null;

        ResultSet result = null;

        if (dbConnection.connectToMySQL()) {
        //if (dbConnection.connectToOrcl()) {
            if (kundenNr == null) {
                ;
            } else {
                // Eigenes Statement erzeugen
                query = "INSERT INTO Kunde VALUES ('"+kundenNr+"', '"+vorname+"', '"+nachname+"', '"+geburtsdatum+"')";
                //out.println("<p>"+query+"</p>");
                // INSERT Befehl
                dbConnection.sqlExecute(query);
            }
        }
	%>
	
	<table>
		
		<tr>
			<th> Kundennummer </th>
			<th> Vorname </th>
			<th> Nachname </th>
			<th> Geburtsdatum </th>
		</tr>
			<% 
                query = "select * from Kunde";
                result = dbConnection.sqlQuery(query);

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
	</html>				
