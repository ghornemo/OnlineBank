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
        <script src="js/myAccount.js"></script>
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
                        <!--<li><a href="#">About</a></li>
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Contact</a></li>-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="\Bank\logout"><span class="glyphicon glyphicon-log-out"></span>Log Out</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid text-center">    

            <div class="row content">
                
                <div class="col-sm-2 sidenav">
                    <h3>Make Changes</h3>
                    <div class="vertical-menu">
                        <a href="#">Change Password</a>
                        <a href="#">Loan application & rates</a>
                        <a href="#">Transaction History</a>
                        <a href="#">Support</a>
                    </div>
                </div>

                <div class="col-sm-8 text-left">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1>Welcome <%=client.getFirstName() + " " + client.getLastName()%></h1>
                            <p>Check Your Account Balances And Make Transactions With Ease.</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-2" id="toggle-container">
                            <a id="toggle-summary">-</a>
                        </div>
                        <div class="col-sm-10">
                            <h4 id="summary-heading">My Personal Summary</h4>
                        </div>
                    </div>
                    <div class="row" id="summary">
                        <div class="col-sm-6">
                            <p>Banking: </p>
                            <p>Credit: </p>
                            <p>Total: </p>
                        </div>
                        <div class="col-sm-6">
                            <p><%=700%></p>
                            <p><%=80%></p>
                            <p><%=620%></p>
                        </div>
                    </div>
                        
                    <h3>Banking</h3>
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table table-hover">
                                <tr>
                                    <th><p>Account</p></th>
                                    <th class="balance"><p>Balance</p></th>
                                </tr>
                                <tr>
                                    <td><p>Checking Account</p></td>
                                    <td><p><%=500%><p></td>
                                </tr>
                                <tr>
                                    <td><p>Savings Account</p></td>
                                    <td><p><%=200%><p></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <hr>
                    
                    <h3>Credit Cards, Loans & Mortgages</h3>
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table table-hover">
                                <tr>
                                    <th><p>Account</p></th>
                                    <th class="balance"><p>Balance</p></th>
                                </tr>
                                <tr>
                                    <td><p>Credit Account</p></td>
                                    <td><p><%=80%><p></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                                
                <div class="col-sm-2 sidenav">
                    <h3>Transfers</h3>
                    <div class="vertical-menu">
                        <a href="#">Transfer Fund</a>
                        <a href="#">Send Inter E-Transfer</a>
                    </div>
                </div>
                                
            </div>
                                
        </div>
    </body>
</html>
