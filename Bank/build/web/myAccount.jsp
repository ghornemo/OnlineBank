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
        <script src="js/account.js"></script>
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
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="\logout"><span class="glyphicon glyphicon-log-out"></span>Log Out</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid text-center">    

            <div class="row content">

                <div class="col-sm-2 sidenav">
                    <h3>Make Changes</h3>
                    <div class="vertical-menu">
                        <a data-toggle="modal" data-target="#myModal">Change Password</a>
                        <a href="#">Loan application & rates</a>
                        <a href="transactions?email=<%= session.getAttribute("email") %>">Transaction History</a>
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
                            <p><%=client.getCheckingsBalance()+client.getSavingsBalance()%></p>
                            <p><%=0%></p>
                            <p><%=client.getCheckingsBalance()+client.getSavingsBalance()%></p>
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
                                    <td><p><%=client.getCheckingsBalance()%><p></td>
                                </tr>
                                <tr>
                                    <td><p>Savings Account</p></td>
                                    <td><p><%=client.getSavingsBalance()%><p></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <hr>

                </div>

                <div class="col-sm-2 sidenav">
                    <h3>Transfers</h3>
                    <div class="vertical-menu">
                        <a data-toggle="modal" data-target="#swapModal">Transfer Fund</a>
                        <a data-toggle="modal" data-target="#transferModal">Send Inter E-Transfer</a>
                    </div>
                </div>

            </div>

        </div>

        <!-- Model for transferring funds between account -->
        <div id="swapModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Transfer Funds</h4>
                    </div>
                    <div class="modal-body">
                        <form  name="swap" action="swap" method="post">
                            <div class="form-group">
                                <label for="oldpwd">From:</label>
                                <select class="form-control" id="from" name="from">
                                    <option>chequing</option>
                                    <option>savings</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="account">To:</label>
                                <select class="form-control" id="to" name="to">
                                    <option>chequing</option>
                                    <option>savings</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="amount">Select amount:</label>
                                <input type="number" min="0" step=".01" class="form-control" id="amount" name="amount">
                            </div>
                            <% Client e = (Client)session.getAttribute("client"); System.out.println(e);%>
                            <input type="hidden" name="email" id="test" value=<%=e.getEmail() %>/>
                            <button type="submit" class="btn btn-default" value="Submit">Submit</button>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>                      

        <!-- Model for sending e-transfer -->
        <div id="transferModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Configure E-Transfer</h4>
                    </div>
                    <div class="modal-body">
                        <form  name="etransfer" action="etransfer" method="post">
                            <div class="form-group">
                                <label for="receiver">Recipient email:</label>
                                <input type="email" class="form-control" id="receiver" name="receiver">
                            </div>
                            <div class="form-group">
                                <label for="account">Select account:</label>
                                <select class="form-control" id="account" name="account">
                                    <option>Chequing</option>
                                    <option>Savings</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="amount">Select amount:</label>
                                <input type="number" min="0" step=".01" class="form-control" id="amount" name="amount">
                            </div>
                            <button type="submit" class="btn btn-default" value="Submit">Submit</button>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>  
        
        <!-- Model for changing password -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Change Password</h4>
                    </div>
                    <div class="modal-body">
                        <form  name="newpass" action="changePass" onsubmit="return validateForm()" method="post">
                            <div class="form-group">
                                <label for="oldpwd">Current Password:</label>
                                <input type="password" class="form-control" id="oldpwd" name="oldPassword">
                            </div>
                            <div class="form-group">
                                <label for="newpwd1">New Password:</label>
                                <input type="password" class="form-control" id="newpwd1" name="newPassword">
                            </div>
                            <div class="form-group">
                                <label for="newpwd2">Confirm Password:</label>
                                <input type="password" class="form-control" id="newpwd2" name="newPassword2">
                            </div>
                            <button type="submit" class="btn btn-default" value="Submit">Submit</button>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>    

    </body>
</html>
