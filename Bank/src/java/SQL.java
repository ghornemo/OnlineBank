
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
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
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
            sql = "select password from client where email='" + email + "';";
            ResultSet rs = stmt.executeQuery(sql);
            String authentication = "";
            if (rs.next()) {
                authentication = rs.getString("password").trim();
                System.out.println("Password received from database: " + authentication);
                System.out.println("Password received from post: " + pass);
            }
            if (authentication.equals(pass)) {
                return true;
            }
            conn.close();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        return false;
    }

    /**
     * registrationRequest(ArrayList<String> infoList):
     */
    public static boolean registrationRequest(ArrayList<String> infoList) {

        String firstName = infoList.get(0).trim();
        String lastName = infoList.get(1).trim();
        String email = infoList.get(2).trim();
        String password = infoList.get(3).trim();
        String dob = infoList.get(4).trim();
        String phone = infoList.get(5).trim();
        String addressLine1 = infoList.get(6).trim();
        String addressLine2 = infoList.get(7).trim();
        String city = infoList.get(8).trim();
        String region = infoList.get(9).trim();
        String postalCode = infoList.get(10).trim();
        String country = infoList.get(11).trim();
        String question1 = infoList.get(12).trim();
        String answer1 = infoList.get(13).trim();
        String question2 = infoList.get(14).trim();
        String answer2 = infoList.get(15).trim();

        Connection conn = database(); //get database connection.

        try {

            System.out.println("Creating statement...");
            Statement stmt = conn.createStatement();
            String sql;

            //generate account number
            String accountNumber = "000000000000";

            //check if email already exists(client already has an account)
            sql = "select email from client where email='" + email + "';";
            ResultSet rs = stmt.executeQuery(sql);

            if (!rs.isBeforeFirst()) { 
                //email doesn't exist in database.
                
                sql = " insert into client (accountnumber, firstname, lastname, email, password,"
                        + " dob, phone, addressline1, addressline2, city, region,"
                        + " postalcode, country, question1, question2, answer1, answer2)"
                        + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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

                preparedStmt.executeQuery();

            } else {
                //Email Already Exist for User.
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
            }
        }

        return true;
    }

}
