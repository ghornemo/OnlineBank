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
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/history.js"></script>
    </head>
    <body>
        <table class="table table-bordered">
            <tr><td>Account</td><td>Amount</td><td>Source</td><td>Time</td></tr>
<c:forEach items="${transactions}" var="Transaction">
    <tr>
        <td>${Transaction.account}    </td>    
        <td>${Transaction.amount}    </td>    
        <td>${Transaction.source}    </td>   
        <td>${Transaction.date}</td>
    </tr>
</c:forEach>
</table>
    </body>
</html>
