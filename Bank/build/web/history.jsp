<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Transaction History</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  <link rel="stylesheet" href="css/main.css"/>
        <link rel="stylesheet" href="css/history.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/history.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="myAccount.jsp">OnlineBank</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="myAccount.jsp">Home</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="\logout"><span class="glyphicon glyphicon-log-out"></span>Log Out</a></li>
                    </ul>
                </div>
            </div>
        </nav>
            <h1> Transaction History </h1>
            <select id="options" onchange="myFunction()">
                <option value="all">All accounts</option>
                <option value="chequing">Chequing</option>
                <option value="savings">Savings</option>
            </select>
            <select>
                <option id="date">Date</option>
                <option id="amount">Amount</option>
            </select>
            <div class="scrollingtable">
                <div>
                    <div>
                        <table id="theTable" class="table" cellspacing="1">
                            <thead>
                                <tr>
                                    <th onclick="sortTable(0)"><div label="Account"></div></th>
                                    <th onclick="numericalSortTable(1)"><div label="Amount"></div></th>
                                    <th onclick="sortTable(2)"><div label="Source"></div></th>
                                    <th onclick="dateSortTable(3)"><div label="Date"></div></th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--<tbody style="overflow: auto; height: 400px; position: absolute"> -->

                                <c:forEach items="${transactions}" var="Transaction">
                                    <tr style="width:100%; height:40px">
                                        <td>${Transaction.account}    </td>    
                                        <td>${Transaction.amount}    </td>    
                                        <td>${Transaction.source}    </td>   
                                        <td>${Transaction.date}</td>
                                    </tr>
                                </c:forEach>
                            </tbody> 
                        </table>
                    </div>
                </div>
            </div>
    </body>
</html>