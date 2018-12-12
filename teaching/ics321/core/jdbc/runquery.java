import java.sql.*;
import java.io.*;
import java.util.*;
import java.lang.String;
import oracle.jdbc.pool.OracleDataSource;

public class runquery {
    /* Private Members*/
    private static PreparedStatement poStmt;
    private static Statement selectStmt;
    private static ResultSet rs;
    private static Connection conn;

    /*needed for properties file*/
    static Properties connProps = new Properties();

    /* Main program -- checks the input from the user*/
    public static void main(String[] args) {
        String db, pid, userName, passwd, host, port, query, results, qfile;
        String interactive = "";
        String rollbackcommit="rollback";
        pid=results=qfile=query=host=port=db=userName=passwd=null;
        int verbose=0;

        try {
            /* load the contents of properties file in case of missing arguments*/
            connProps.load(new FileInputStream ("mydb.properties"));
            db=connProps.getProperty("databaseName");
            userName=connProps.getProperty("userName");
            passwd=connProps.getProperty("password");
            host=connProps.getProperty("hostName");
            port=connProps.getProperty("portNumber");
            rollbackcommit=connProps.getProperty("rollbackCommit");
            interactive=connProps.getProperty("interactive");

            /* Update each with user input in arguments*/
            for (int i=0; i< args.length; i++) {
                if (args[i].equals("-q")) {
                    qfile=args[++i];
                    query = readFromFile(qfile);
                }
            }
            /*connect to the database using the above parameters*/
            conn=openConn(db,userName,passwd,host,port);

            System.out.println("     Query file = " + qfile);

            results = run(query);

            if ( verbose > 1 ) {
                System.out.println(results);
            }

        } catch (IOException io) {
            System.out.println(io.getMessage());
        } catch (NullPointerException ne) {
            System.out.println("NullPointerException");
        }

        /** close connections **/
        closeConn();
        if ( verbose > 0 ) {
            System.out.println();
            System.out.println("     Disconnect from the '"+db+"' database");
            System.out.println("     Disconnected.");
        }
    }//main

    public static String run(String query) {
        String results;
        int i;
        Timing r = new Timing();

        results="";

        try {
            selectStmt = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,
                                              ResultSet.CONCUR_READ_ONLY);
            r.start();
            rs= selectStmt.executeQuery(query);
            r.stop();
            System.out.println("     " + r.print("Execute "));

            ResultSetMetaData rsmd = rs.getMetaData();
            int ncols = rsmd.getColumnCount();

            r.start();
            i=0;
            while (rs.next()) {
                for ( int j = 1 ; j <= ncols; j++ ) {
                    /* results = results + "," + rs.getString(j); */
                    results = rs.getString(j);
                }
                /* results = results + "\n"; */
                i = i + 1;
            }
            r.stop();
            System.out.println("     " + r.print("Return"));

            System.out.println("     " + "Cardinality = " + i );

            rs.close();
            selectStmt.close();
        } catch (SQLException sqle) {
            System.out.println("Error Msg: "+ sqle.getMessage());
            System.out.println("SQLState: "+sqle.getSQLState());
            System.out.println("SQLError: "+sqle.getErrorCode());
            System.out.println("Rollback the transaction and quit the program");
            System.out.println();
            try {
                conn.setAutoCommit(false);
            } catch (java.sql.SQLException e) {
                e.printStackTrace();
                System.exit(-1);
            }
            try {
                conn.rollback();
            } catch (Exception e) {
                JdbcException jdbcExc = new JdbcException(e, conn);
                jdbcExc.handle();
            }
            System.exit(1);
        }

        return results;
    }

    /* Close conections*/
    public static void closeConn() {
        try {
            conn.close();
            /*poStmt.close();*/
        } catch (SQLException sqle) {
            System.out.println("Error Msg: "+ sqle.getMessage());
            System.out.println("SQLState: "+sqle.getSQLState());
            System.out.println("SQLError: "+sqle.getErrorCode());
            System.out.println("Rollback the transaction and quit the program");
            System.out.println();
            try {
                conn.rollback();
            } catch (Exception e) {
                JdbcException jdbcExc = new JdbcException(e, conn);
                jdbcExc.handle();
            }
            System.exit(1);
        }
    }

    /*
     * Get Database connection using Database name, username, password, machine name and port number
     */
    public static Connection openConn(String db, String userName, String passwd, String host, String port) {
        Connection conn=null;

        try {
            OracleDataSource ds;

            ds = new OracleDataSource();

            /** Create Database URL and establish DB Connection **/
            String databaseURL = "jdbc:oracle:thin:@"+host+":"+port;
            ds.setURL(databaseURL); 

            conn = ds.getConnection(userName,passwd);

            /** print any error messages **/
            if (conn==null)System.out.println("Connection Failed \n");
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
            System.exit(-1);
        }

        return conn;

    }

    public static String readFromFile(String fileName) {
        StringBuffer sb = new StringBuffer();
        try {

            FileReader fr = new FileReader(fileName);
            BufferedReader br = new BufferedReader(fr);
            String line = null;

            while ((line = br.readLine()) != null) {
                if (!line.startsWith("--") && !line.startsWith("%") && !line.startsWith("~") && !line.startsWith(";"))
                    sb.append(line + "\n");
            }
        } catch (Exception e) {
            System.out.println("runquery:readFromFile for file " + fileName
                               + " expection: " + e.toString());
        }
        return sb.toString();
    }

}//end class readxml

class JdbcException extends Exception {
    Connection conn;

    public JdbcException(Exception e) {
        super(e.getMessage());
        conn = null;
    }

    public JdbcException(Exception e, Connection con) {
        super(e.getMessage());
        conn = con;
    }

    public void handle() {
        System.out.println(getMessage());
        System.out.println();

        if (conn != null) {
            try {
                System.out.println("--Rollback the transaction-----");
                conn.rollback();
                System.out.println("  Rollback done!");
            } catch (Exception e) {
            };
        }
    } // handle

    public void handleExpectedErr() {
        System.out.println();
        System.out.println(
            "**************** Expected Error ******************\n");
        System.out.println(getMessage());
        System.out.println(
            "**************************************************");
    } // handleExpectedError
} // JdbcException


