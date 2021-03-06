/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DefinedClass.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
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
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ghornemo
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String status = "";
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean success = SQL.loginRequest(email, password);
        String IP = request.getRemoteAddr();
        if (success) {
            status = "Successful login";
        } else {
            status = "Invalid login details";
        }
        status += success;
        //Unsuccessful Login
        if (!success) {
            try (PrintWriter out = response.getWriter()) {
               
                out.print(success);
                System.out.println(success);

            }
            //Successful login
        } else {
            
            //create session in all cases whether cx has exisiting ip or not.
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("client", new Client(email));

            //set session to expire in 15 mins
            session.setMaxInactiveInterval(15000);
            Cookie emailCookie = new Cookie("email", email);
            response.addCookie(emailCookie);

            if (SQL.existingIP(email, IP)) {//existing IP
                //Get endCoded URL string
                /*String encodedURL = response.encodeRedirectURL("/Bank/myAccount.jsp");
                response.sendRedirect(encodedURL);*/
                try (PrintWriter out = response.getWriter()) {
               
                    out.print("myAccount.jsp");

                }

            } else {//New IP
                String[] questions = SQL.questions(email);
                Cookie cookie1 = new Cookie("question1", questions[0]);
                response.addCookie(cookie1);
                Cookie cookie2 = new Cookie("question2", questions[1]);
                response.addCookie(cookie2);
                /*String encodedURL = response.encodeRedirectURL("/Bank/questions.jsp");
                response.sendRedirect(encodedURL);*/
                try (PrintWriter out = response.getWriter()) {
               
                    out.print("questions.jsp");

                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("Successfully handled login post request.");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
