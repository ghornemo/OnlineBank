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
        <div>TODO write content</div>
         <form name="questions" action="Questions" method="post">
             <span class="question1"><%=question1%></span>
<input type="text" name="answer1">
             <span class="question2"><%=question2%></span>
<input type="text" name="answer2">
 <input type="submit" value="Submit">
</form>
    </body>
    
</html>
