$(document).ready(function () {

    $("#login-button").click(function () {

        if (validateLoginForm()) {
            
            $("#msg").removeClass("alert alert-danger text-center");
            $("#status").removeClass("alert alert-danger text-center");
            $("#status").remove();

            var email = $("#email").val();
            var pass = $("#pwd").val();

            $.ajax({
                url: "login",
                data: {email: email, password: pass},
                type: "POST",
                cache: false,

                success: function (data) {

                    console.log(data);

                    if (data.toString() === "false") {
                        $("#msg").prepend("<div id='status'><strong>!! Incorrect Email Or Password !!" +
                                "<br/>Please, Try Again.</strong></div>")
                                .addClass("alert alert-danger text-center");
                    }
                    
                    if(data.toString() === "questions.jsp"){
                        window.location.replace(data);
                    }
                    
                    if(data.toString() === "myAccount.jsp"){
                        window.location.replace(data);
                    }
                },

                error: function (error) {
                    alert(error);
                }

            });
        }
    });


});



function validateLoginForm(){
    
    var email = $('#email');
    var pwd = $('#pwd');
    
    pwd.removeClass("red-border");
    email.removeClass("red-border");
    
    $("#msg").removeClass("alert alert-danger text-center");
    $("#status").removeClass("alert alert-danger text-center");
    $("#status").remove();
    
    var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!emailRegex.test(email.val())){
        email.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Not a valid Email Address.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if(pwd.val() === ""){
        pwd.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Please Enter your password.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    return true;
}