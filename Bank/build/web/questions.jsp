<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Authentication required</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css"/>
        <link rel="stylesheet" href="css/securityQuestions.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/questions.js"></script>
    </head>
    <body>
        <%

            String question1 = "question1";
            String question2 = "question2";

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("question1")) {
                        question1 = cookie.getValue();
                    }
                    if (cookie.getName().equals("question2")) {
                        question2 = cookie.getValue();
                    }
                }
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
                    <a class="navbar-brand" href="myAccount.jsp">OnlineBank</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="myAccount.jsp">Home</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html"><span class="glyphicon glyphicon-log-in"></span>Log In</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">

            <div class="row">
                <div class="col-sm-12 text-center">
                    <h1 id="header"><b>UnRecognized Access Point</b></h1>
                    <div class="text-center" id="description">
                        <p>Here at Online-Bank, protecting our clients is a top priority.</p>
                        <p>It seems that you are attempting to login from a new IP address.</p>
                        <p>To confirm ownership of the account, you will need to answer
                        security questions.</p>
                    </div>
                </div>
            </div>

            <div class="row">
                
                <div class="col-sm-12 text-center" id="securityForm">
                    
                    <form name="questions" action="Questions" method="post">
                        <div id="msg"> </div>
                        <div class="form-group">
                            <label for="answer1"><%=question1%></label>
                            <input class="form-control" type="text" name="answer1" id="answer1">
                        </div>
                        <div class="form-group">
                            <label for="answer2"><%=question2%></label>
                            <input type="text" class="form-control" name="answer2" id="answer2">
                        </div>                                  
                    </form>

                    <button id ="sq-button" class="btn btn-default btn-lg" type="submit" value="Submit">Submit</button>
                </div>    
                            
            </div>



        </div>
    </body>

</html>
