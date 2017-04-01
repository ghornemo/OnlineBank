$(document).ready(function () {

    $("#register").click(function () {

        if (validateRegisterForm()) {

            var first = $("#firstName").val();
            var last = $("#lastName").val();
            var email = $("#email").val();
            var pwd = $("#password").val();
            var dob = $("#dob").val();
            var phone = $("#phone").val();
            var addressLine1 = $("#address-line1").val();
            var addressLine2 = $("#address-line2").val();
            var city = $("#city").val();
            var region = $("#region").val();
            var postalCode = $("#postal-code").val();
            var country = $("#country").find(":selected").text();
            var q1 = $("#question1").find(":selected").text();
            var a1 = $("#answer1").val();
            var q2 = $("#question2").find(":selected").text();
            var a2 = $("#answer2").val();

            console.log(first + " " + last + " " + email);

            $.ajax({
                url: 'register',
                data: {firstName: first, lastName: last, email: email, password: pwd, dob: dob,
                    phone: phone, addressLine1: addressLine1, addressLine2: addressLine2, city: city,
                    region: region, postalCode: postalCode, country: country, question1: q1, question2: q2, answer1: a1, answer2: a2},

                type: "POST",
                cache: false,

                success: function (data) {

                    console.log("success: " + data);

                    $("#msg").removeClass("alert alert-success alert-danger text-center");
                    $("#status").removeClass("alert alert-success alert-danger text-center");
                    $("#status").remove();

                    if (data.toString() === "true") {

                        $("#msg").prepend("<div id='status'><strong>** Registration Successful **</strong></div>")
                                .addClass("alert alert-success text-center");

                    } else {
                        $("#msg").prepend("<div id='status'><strong>!! Registration Failed !!<br />" +
                                "User Already Exist! Go To Log In Page.</strong></div>")
                                .addClass("alert alert-danger text-center");
                    }

                },

                error: function (error) {
                    alert(error);
                }
            });

        }
    });
});



function validateRegisterForm() {

    var first = $("#firstName");
    var last = $("#lastName");
    var email = $("#email");
    var pwd = $("#password");
    var pwd2 = $("#password2");
    var dob = $("#dob");
    var phone = $("#phone");
    var addressLine1 = $("#address-line1");
    var addressLine2 = $("#address-line2");
    var city = $("#city");
    var region = $("#region");
    var postalCode = $("#postal-code");
    var country = $("#country");
    var q1 = $("#question1");
    var a1 = $("#answer1");
    var q2 = $("#question2");
    var a2 = $("#answer2");

    first.removeClass("red-border");
    last.removeClass("red-border");
    email.removeClass("red-border");
    pwd.removeClass("red-border");
    phone.removeClass("red-border");
    dob.removeClass("red-border");
    addressLine1.removeClass("red-border");
    addressLine2.removeClass("red-border");
    city.removeClass("red-border");
    region.removeClass("red-border");
    postalCode.removeClass("red-border");
    country.removeClass("red-border");
    q1.removeClass("red-border");
    q2.removeClass("red-border");
    a1.removeClass("red-border");
    a2.removeClass("red-border");
    $("#msg").removeClass("alert alert-danger text-center");
    $("#status").removeClass("alert alert-danger text-center");
    $("#status").remove();

    if (first.val() === "") {
        first.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Enter your First Name.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if (last.val() === "") {
        last.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Enter your Last Name.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }

    var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!emailRegex.test(email.val())){
        email.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Not a valid Email Address.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    var pwdRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;
    if(!pwdRegex.test(pwd.val())){
        pwd.addClass("red-border");
        
        $("#msg").prepend("<div id='status'><strong>Password must meet requirements: <br />"+
        "Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number "+
        "and 1 Special Character.</strong></div>").addClass("alert alert-danger text-center");
        return false;
    }
    
    if(!(pwd.val() === pwd2.val())){
        pwd2.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Passwords did not match.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    var dateRegex = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
    if(!dateRegex.test(dob.val())){
        dob.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Not a valid Date<br />"+
                "Enter Date in one of the following formats: dd/mm/yyyy, dd-mm-yyyy or dd.mm.yyyy</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
  //  var phoneRegex = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][0‌​2-8]1|[2-9][02-8][02‌​-9])\s*)|([2-9]1‌​[02-9]|[2-9][02-8]1|‌​[2-9][02-8][02-9]))\‌​s*(?:[.-]\s*)?)?([2-‌​9]1[02-9]|[2-9][02-9‌​]1|[2-9][02-9]{2})\s‌​*(?:[.-]\s*)?([0-9]{‌​4})$/;
    if(phone.val()==="" || isNaN(phone.val()) || !(phone.val().length===10)){ //|| !phoneRegex.test(phone.val())){
        console.log(isNaN(phone.val()) + " " + phone.val().length);
        phone.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Not a valid Phone Number<br />"+
                "Enter Date in the following formats: ##########</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if (addressLine1.val() === "") {
        addressLine1.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Enter your Address.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if (city.val() === "") {
        city.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Enter your City.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if (region.val() === "") {
        region.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Enter your Region.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if (postalCode.val() === "") {
        postalCode.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Enter Your Zip/Postal code.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if (country.find(":selected").text() === "(please select a country)") {
        country.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Select Your Country.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if (a1.val() === "") {
        a1.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Enter Your Answer To Security Question One.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if (a2.val() === "") {
        a2.addClass("red-border");
        $("#msg").prepend("<div id='status'><strong>Enter Your Answer To Security Question Two.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
      
    
    return true;
}


