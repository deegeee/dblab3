package dblab10;

import java.util.*;
import java.sql.*;
import java.io.*;

public class SQLConnectBean {

    private Connection dbConnection;
    private ResultSet sqlQueryResult;
    private boolean isConnected = false;

    /* Verbindung zur Datenbank herstellen */
    public boolean connectToMySQL() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            dbConnection = DriverManager.getConnection ("jdbc:mysql://localhost/dblab?user=user");
            isConnected = true;
            return true;
        } catch (Exception e) {
            System.out.println("The driver couldn't be loaded");
            isConnected = false;
            return false;
        }
    }

    public boolean connectToOrcl() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            dbConnection = DriverManager.getConnection ("jdbc:oracle:thin:@bert.mi.fh-offenburg.de:1521:orcl", "dblab10", "dblab10");
            isConnected = true;
            return true;
        } catch (Exception e) {
            System.err.println("The driver couldn't be loaded");
            isConnected = false;
            return false;
        }
    }

    /* Ausgabe */
    public ResultSet sqlQuery(String query) throws SQLException {
        if (isConnected) {
            sqlQueryResult = dbConnection.createStatement().executeQuery(query);
            return sqlQueryResult;
        }
    }

    /* Aendern */
    public void sqlExecute(String query) throws SQLException {
        if (isConnected) {
            if (dbConnection.createStatement().execute(query)) {
                commit();
            }
        } else {
            return null;
        }
    } 

    /* Commit */
    public void commit() throws SQLException {
        dbConnection.commit();
    }

    /* Datenbankverbindung schliessen */
    public void cleanUp() throws SQLException {
        if (isConnected) {
            dbConnection.close();
            sqlQueryResult.close();
            isConnected = false;
        }
    }

}
