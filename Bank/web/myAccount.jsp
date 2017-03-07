<%-- 
    Document   : myAccount
    Created on : Mar 7, 2017, 2:03:56 PM
    Author     : kene
--%>

<%@page import="DefinedClass.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Overview</title>
    </head>
    <body>
        <%
            Client client = null;

            if (session.getAttribute("client") == null) {
                response.sendRedirect("/Bank/");
            } else {
                client = (Client) session.getAttribute("client");
            }

        %>
        <h1>Welcome <%=client.getFirstName() + " " + client.getLastName()%></h1>
    </body>
</html>
