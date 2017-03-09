/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DefinedClass.Client;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gemal
 */
public class QuestionServlet extends HttpServlet {

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
        //Handling the GET Request! Basically the same in all circumstances.
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        if(session != null)
            session.invalidate();
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuestionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionServlet at " + request.getContextPath() + "</h1>");
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
    
    public String cookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for(Cookie cookie : cookies)
                if(cookie.getName().equals(name))
                    return cookie.getValue();
        }
        return null;
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
        //Method do handle the security question verification
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String email = cookie(request, "email");
            String IP = request.getRemoteAddr();
            String submitted1 = req.getParameter("answer1");
            String submitted2 = req.getParameter("answer2");
            String[] realAnswer = SQL.answers(email);
            if(submitted1.equalsIgnoreCase(realAnswer[0]) && submitted2.equalsIgnoreCase(realAnswer[1])) {
                //Successfully answered security questions
                SQL.addIP(email, IP);
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("client", new Client(email));

                //set session to expire in 1 min
                session.setMaxInactiveInterval(1000);
                Cookie emailCookie = new Cookie("email", email);
                response.addCookie(emailCookie);

                //Get endCoded URL string
                String encodedURL = response.encodeRedirectURL("/Bank/myAccount.jsp");

                response.sendRedirect(encodedURL);
            }else {
                //Unsuccessfully answered security questions
                processRequest(request, response);
            }
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
