/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kene
 */
public class RegisterServlet extends HttpServlet {

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
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("address-line1");
        String addressLine2 = request.getParameter("address-line2");
        String city = request.getParameter("city");
        String region = request.getParameter("region");
        String postalCode = request.getParameter("postal-code");
        String country = request.getParameter("country");
        String question1 = request.getParameter("question1");
        String answer1 = request.getParameter("answer1");
        String question2 = request.getParameter("question2");
        String answer2 = request.getParameter("answer2");
        
        /////////////////////////////////////////////////////////////
        //TODO
        //Connect to database
        //using SQL.registrationRequest() in SQL.java
        //In there check if email address already exists in database
        //If not Insert registration data into database
        //if insertion is successful prompt user email will be sent
        //use send mailer.java to send email as done below.
        //if email sends successfully prompt user to checkemail for verification.
        /////////////////////////////////////////////////////////////
        
        //email verification.
        int pin = new Random().nextInt(99999);
        String topic = "Verify your bank account";
        String message = "This is an automated email send by Online Bank. You have ";
                message += "recently applied for a bank account with OnlineBank.\n";
                message += "Your verification key: "+pin;        
        new mailer().sendMail(email, topic, message);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println(firstName + "<br />" + lastName + "<br />" + email + "<br />" + dob  + "<br />" + phone  + "<br />" + 
                        addressLine1  + "<br />" + addressLine2  + "<br />" + city  + "<br />" + region + "<br />" + postalCode  + "<br />" +
                        country  + "<br />" + question1  + "<br />" + answer1  + "<br />" + question2  + "<br />" + answer2);
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
