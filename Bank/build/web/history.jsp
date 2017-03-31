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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/history.js"></script>
    </head>
    <body>
        <h1> Transaction History </h1>
<select id="options" onchange="myFunction()">
  <option value="chequing">Chequing</option>
  <option value="savings">Savings</option>
</select>
        <div class="container-fluid" style="height: 500px">
            <table id="theTable" class="table table-bordered">
                <thead>
                    <tr><td>Account</td><td>Amount</td><td>Source</td><td>Time</td></tr>
                </thead>
                    <tbody style="overflow: auto; height: 400px; position: absolute">
                    
                        <c:forEach items="${transactions}" var="Transaction">
                            <tr style="width:100%">
                                <td>${Transaction.account}    </td>    
                                <td>${Transaction.amount}    </td>    
                                <td>${Transaction.source}    </td>   
                                <td>${Transaction.date}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
            </table>
        </div>
    </body>
</html>