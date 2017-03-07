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
        <title>Account Overview</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/account.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#">OnlineBank</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-log-out"></span>Log Out</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid text-center">    
            
            <div class="row content">
                <div class="col-sm-2 sidenav">
                    <div><a href="#">Change Password</a></div>
                    <div><a href="#">Loan application & rates</a></div>
                    <div><a href="#">Transaction History</a></div>
                    <div><a href="#">Support</a></div>
                </div>
                
                <div class="col-sm-8 text-left"> 
                    <h1>Welcome <%=client.getFirstName() + " " + client.getLastName()%></h1>
                    <p>Check Your Account Balances And Make Transactions With Ease.</p>
                    <hr>
                    <h3>Test</h3>
                    <p>Lorem ipsum...</p>
                </div>
                    
                <div class="col-sm-2 sidenav">
                    <h1>Account balances</h1>
                    <div class="well">
                        <p id="checking">Checkings: $0</p>
                    </div>
                    <div class="well">
                        <p id="savings">Savings: $0</p>
                    </div>
                    <button type="button">Transfer Funds</button>
                    <button type="button">Send Inter E-Transfer</button> 
                </div>
            </div>
        </div>
    </body>
</html>
