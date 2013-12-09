package db;

import java.util.*;
import java.sql.*;
import java.io.*;

public class SQLConnectBean {

    private Connection dbConnection;
    private ResultSet sqlQueryResult;

    public boolean connectToDB() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("The driver loaded");

            dbConnection = DriverManager.getConnection ("jdbc:mysql://localhost/dblab?user=user");
            return true;
        } catch (Exception e) {
            System.out.println("The driver couldn't be loaded");
            return false;
        }
    }

    public boolean connectToOrcl() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            dbConnection = DriverManager.getConnection ("jdbc:oracle:thin:@bert.mi.fh-offenburg.de:1521:orcl", "dblab10", "dblab10");
            return true;
        } catch (Exception e) {
            System.err.println("The driver couldn't be loaded");
            return false;
        }
    }

    /* Ausgabe */
    public ResultSet sqlQuery(String query) {
        try {
            sqlQueryResult = dbConnection.createStatement().executeQuery(query);
            return sqlQueryResult;
        } catch (Exception e) {
            System.out.println("Query Failed");
            return null;
        }
    }
    /* Eingabe */
    public boolean sqlExecute(String query) throws SQLException {
        Statement stmt = dbConnection.createStatement(); 
        stmt.execute(query);
        commit();
        return true;
    }

    /* Commit */
    public void commit() throws SQLException {
        dbConnection.commit();
    }
}
