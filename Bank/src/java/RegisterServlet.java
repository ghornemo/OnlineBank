/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

        ArrayList<String> infoList = new ArrayList<String>();
        
        infoList.add(request.getParameter("firstName"));
        infoList.add(request.getParameter("lastName"));
        infoList.add(request.getParameter("email"));
        infoList.add(request.getParameter("password"));
        infoList.add(request.getParameter("dob"));
        infoList.add(request.getParameter("phone"));
        infoList.add(request.getParameter("address-line1"));
        infoList.add(request.getParameter("address-line2"));
        infoList.add(request.getParameter("city"));
        infoList.add(request.getParameter("region"));
        infoList.add(request.getParameter("postal-code"));
        infoList.add(request.getParameter("country"));
        infoList.add(request.getParameter("question1"));
        infoList.add(request.getParameter("answer1"));
        infoList.add(request.getParameter("question2"));
        infoList.add(request.getParameter("answer2"));
        
        
        boolean userCreated = SQL.registrationRequest(infoList);   //send to add info to database.

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
        if (userCreated) {
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet RegisterServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
                out.println("<p>" + infoList.get(0) + "</br>" + infoList.get(1) + "</br>" + infoList.get(2) + "</br>"
                        + infoList.get(3) + "</br>" + infoList.get(4) + "</br>" + infoList.get(5) + "</br>" + infoList.get(6) + "</br>"
                        + infoList.get(7) + "</br>" + infoList.get(8) + "</br>" + infoList.get(9) + "</br>" + infoList.get(10) + "</br>"
                        + infoList.get(11) + "</br>" + infoList.get(12) + "</br>" + infoList.get(13) + "</br>" + infoList.get(14) + "</br>"
                        + infoList.get(15) + "</p>");
                out.println("<p>"+"You Have been registered!!!"+"</b>"+"A verification email has been sent."+"</p>");
                out.println("</body>");
                out.println("</html>");
            }
        }else{
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet RegisterServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
                out.println("<p>"+"User Already exists"+"</p>");
                out.println("</body>");
                out.println("</html>");
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
