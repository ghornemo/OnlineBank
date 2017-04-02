$(document).ready(function () {
   // loadQuestions();

    $("#sq-button").click(function () {
        
        if (validateSecurityForm()) {

            var ans1 = $("#answer1").val();
            var ans2 = $("#answer2").val();

            $.ajax({
                url: 'Questions',
                data: {answer1: ans1, answer2: ans2},
                type: 'POST',
                cache: false,

                success: function (data) {
                    console.log(data);

                    if (data.toString() === "false") {
                        $("#msg").prepend("<div id='status'><strong>!! Incorrect Answer To Security Question !!" +
                                "<br/>Please, Try Again.</strong></div>")
                                .addClass("alert alert-danger text-center");
                    }

                    if (data.toString() === "myAccount.jsp") {
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


function validateSecurityForm() {
    
    var ans1 = $('#answer1');
    var ans2 = $('#answer2');
    
    ans1.removeClass("red-border");
    ans2.removeClass("red-border");
    
    $("#msg").removeClass("alert alert-danger text-center");
    $("#status").removeClass("alert alert-danger text-center");
    $("#status").remove();
    
    if(ans1.val() === ""){
        ans1.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Please Enter An Answer For First Security Question.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if(ans2.val() === ""){
        ans2.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Please Enter An Answer For Second Security Question.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }

    return true;
}
