
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ghornemo
 */
public class SQL {
    
    public static Connection database() {
              Connection conn = null;
      try {
         Class.forName("org.postgresql.Driver");
         conn = DriverManager
            .getConnection("jdbc:postgresql://159.203.41.250/bank",
            "postgres", "3782893");
      System.out.println("Opened database successfully");
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
          return null;
      }
        return conn;
    }

    public static boolean loginRequest(String email, String pass) {
      Connection conn = database();
      try {
     //Execute a query
      System.out.println("Creating statement...");
      Statement stmt = conn.createStatement();
      String sql;
      sql = "select password from clients where email='"+email+"';";
      ResultSet rs = stmt.executeQuery(sql);
      String authentication = "";
      if(rs.next()) {
          authentication = rs.getString("password").trim();
          System.out.println("Password received from database: "+authentication);
          System.out.println("Password received from post: "+pass);
      }
      if(authentication.equals(pass))
        return true;
      conn.close();
      return false;
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
      }
      return false;
    }
    
    public static boolean registrationRequest(){
        return false;
    }
        
        
}
