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
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;


/**
 *
 * @author lipyeow
 */
@ManagedBean (name="Attempt")
@SessionScoped
public class AttemptBean implements Serializable {
    private static String dbURL = "jdbc:derby://localhost:1527/ics321;user=dbuser;password=ics321";
    // jdbc Connection
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    /**
     * Creates a new instance of AttemptBean
     */
    public AttemptBean() {
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            //Get a connection
            conn = DriverManager.getConnection(dbURL); 
        }
        catch (ClassNotFoundException except){
        } catch (InstantiationException except) {
        } catch (IllegalAccessException except) {
        } catch (SQLException except) {
        }
        
    }
    
    //connect to DB and get customer list
    public List<Attempt> getAttemptList() throws SQLException{
 

	if(conn==null)
            throw new SQLException("Can't get database connection");
 
	ps = conn.prepareStatement(
		"select * from attempts order by atime desc fetch first 5 rows only"); 
 
	//get attempt data from database
	ResultSet result =  ps.executeQuery();
 
	List<Attempt> list = new ArrayList<Attempt>();
 
	while(result.next()){
			Attempt at = new Attempt();
 
			at.setAtime(result.getTimestamp("atime"));
			at.setUsernum(result.getInt("usernum"));
			at.setActualnum(result.getInt("actualnum"));
			
			//store all data into a List
			list.add(at);
	}
 
	return list;
    }
}

