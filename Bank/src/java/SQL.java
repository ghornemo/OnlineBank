
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
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
    
    /**
     * loginRequest(String email, String pass): 
     */
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
    
    public static boolean registrationRequest(ArrayList<String> infoList){
        
        String firstName = infoList.get(0);
        String lastName = infoList.get(1);
        String email = infoList.get(2);
        String password = infoList.get(3);
        String dob = infoList.get(4);
        String phone = infoList.get(5);
        String addressLine1 = infoList.get(6);
        String addressLine2 = infoList.get(7);
        String city = infoList.get(8);
        String region = infoList.get(9);
        String postalCode = infoList.get(10);
        String country = infoList.get(11);
        String question1 = infoList.get(12);
        String answer1 = infoList.get(13);
        String question2 = infoList.get(14);
        String answer2 = infoList.get(15);
        
        Connection conn = database(); //get database connection.
        
        try {
            
            System.out.println("Creating statement...");
            Statement stmt = conn.createStatement();
            String sql;

            //generate account number
            String accountNumber = "";

            //check if email already exists(client already has an account)
            sql = "select email from clients where email='" + email + "';";
            ResultSet rs = stmt.executeQuery(sql);

            if (!rs.isBeforeFirst()) {
                
                sql = " insert into users (accountNumber, firstName, lastName, email, password,"
                        + " dob, phone, addressLine1, addressLine2, city, region"
                        + " postalCode, country, question1, question2, answer1, answer2)"
                        + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                // create the mysql insert preparedstatement
                PreparedStatement preparedStmt = conn.prepareStatement(sql);
                preparedStmt.setString(1, accountNumber);
                preparedStmt.setString(2, firstName);
                preparedStmt.setString(3, lastName);
                preparedStmt.setString(4, email);
                preparedStmt.setString(5, password);
                preparedStmt.setString(6, dob);
                preparedStmt.setString(7, phone);
                preparedStmt.setString(8, addressLine1);
                preparedStmt.setString(9, addressLine2);
                preparedStmt.setString(10, city);
                preparedStmt.setString(11, region);
                preparedStmt.setString(12, postalCode);
                preparedStmt.setString(13, country);
                preparedStmt.setString(14, question1);
                preparedStmt.setString(15, question2);
                preparedStmt.setString(16, answer1);
                preparedStmt.setString(17, answer2);
                
                

            }else{
                //Email Already Exist for User.
                
            }
             
            //ResultSet rs = stmt.executeQuery();
            String authentication = "";
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        return false;
    }
        
        
}
