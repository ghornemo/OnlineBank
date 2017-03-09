<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="css/main.css"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="js/questions.js"></script>
    </head>
    <body>
                <%
              
            String question1 = "question1";
            String question2 = "question2";

                        Cookie[] cookies = request.getCookies();
            if(cookies != null) {
                for(Cookie cookie : cookies) {
                    if(cookie.getName().equals("question1")) {
                        question1 = cookie.getValue();
                    }
                    if(cookie.getName().equals("question2")) {
                        question2 = cookie.getValue();
                    }
                }
            }
            

        %>
        <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Online-Bank</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Login</a></li>
      <li><a href="#">Register</a></li>
      <li><a href="#">Contact Us</a></li>
    </ul>
  </div>
</nav>
        <h1 align="center"><b>Unrecognized access point...</b></h1>
        <div class="well panel panel-primary" align="center">
            <div class="panel-header">
                <p>Here at Online-Bank, protecting our clients is a top priority.</p>
                <p>It seems that you are attempting to login from a new IP address.</p>
                <p>To confirm ownership of the account, you will need to answer</p>
                security questions.
            </div>
            <div class="panel-body">
                <form name="questions" action="Questions" method="post">
                    <div class="form-group">
                        <span id="q1" class="question1"><%=question1%></span>
                        <input for="q1" type="text" name="answer1">
                    </div>
                    <div class="form-group">
                        <span class="question2"><%=question2%></span>
                        <input type="text" name="answer2">
                    </div>
                    
                    <input type="submit" value="Submit">
               </form>
            </div>
        </div>
    </body>
    
</html>
