/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package guessNumber;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Locale;
import java.util.Random;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lipyeow
 */
@ManagedBean(name="UserNumberBean")
@SessionScoped
public class UserNumberBean implements Serializable {

    private static String dbURL = "jdbc:derby://localhost:1527/ics321;user=dbuser;password=ics321";
    // jdbc Connection
    private static Connection conn = null;
    private static Statement st = null;
                    
    Integer randomInt;
    Integer userNumber;
    String response;

    public String getResponse() throws SQLException {
        if (userNumber != null){
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                //Get a connection
                conn = DriverManager.getConnection(dbURL); 
            } catch (ClassNotFoundException except){
            } catch (InstantiationException except) {
            } catch (IllegalAccessException except) {
            } catch (SQLException except) {
            }
            
            if(conn==null)
            throw new SQLException("Can't get database connection");
 
            st = conn.createStatement(); 
            
            // get current time in SQL timestamp format
            Calendar rightnow = Calendar.getInstance();
            Timestamp ts = new Timestamp(rightnow.getTimeInMillis());
            
            String query = "INSERT INTO ATTEMPTS VALUES(TIMESTAMP('" 
                    + ts.toString() + "'), " + userNumber + "," + randomInt + ")";
            
            //insert data into database
            st.executeUpdate(query);
 
            
            if(userNumber.compareTo(randomInt) == 0) {

                //invalidate user session
                FacesContext context = FacesContext.getCurrentInstance();
                HttpSession session = (HttpSession) context.getExternalContext().getSession(false);
                session.invalidate();

                return "Yay! You got it!";
            }
        }

        return "<p>Sorry, " + userNumber + " isn't it.</p>"
                    + "<p>Guess again...</p>";
    
    }

    public Integer getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(Integer userNumber) {
        this.userNumber = userNumber;
    }
    /**
     * Creates a new instance of UserNumberBean
     */
    public UserNumberBean() {
        Random randomGR = new Random();
        randomInt = new Integer(randomGR.nextInt(10));
        System.out.println("Duke's number: " + randomInt);
    }
    
}
