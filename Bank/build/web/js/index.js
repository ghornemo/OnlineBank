/*$(document).ready(function () {

    $("#login-button").click(function () {

        $("#msg").removeClass("alert alert-danger text-center");
        $("#status").removeClass("alert alert-danger text-center");
        $("#status").remove();

        var email = $("#email").text();
        var pass = $("#pwd").text();

        $.ajax({
            url: "login",
            data: {email: email, password: pass},
            type: "POST",
            cache: false,

            success: function (data) {
                
                console.log(data);
                
                if (data.toString() != "false") {
                    $("#msg").prepend("<div id='status'><strong>!! Incorrect Email Or Password !!</strong>" +
                            "<br/>Please, Try Again.</div>")
                            .addClass("alert alert-danger text-center");
                }
            },

            error: function (error) {
                alert(error);
            }

        });

    });

});*/




function validateForm() {
    var x = document.forms["login"]["email"].value;
    if (x == "") {
        alert("Email address is required to login.");
        return false;
    }
    x = document.forms["login"]["password"].value;
    if (x == "") {
        alert("password is required to login.");
        return false;
    }
    return true;
}


