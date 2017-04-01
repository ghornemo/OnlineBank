$(document).ready(function () {

    //toggle the account summary.
    $("#toggle-summary").click(function () {
        $("#summary").toggle(1000, function () {});

        if ($("#toggle-summary").text() == "-")
            $("#toggle-summary").html("+");
        else
            $("#toggle-summary").html("-");

    });

    //transer funds button.
    $("#transfer-button").click(function () {

        if (validateTransfer()) {

            var receiver = $('#to').find(":selected").text();
            var sender = $('#from').find(":selected").text();
            var money = $('#amount').val();
            console.log(receiver + " " + sender + " " + money);

            $.ajax({
                url: 'swap',
                data: {to: receiver, from: sender, amount: money},
                type: "POST",
                cache: false,

                success: function (data) {

                    $("#transfer-msg").removeClass("alert alert-success alert-danger text-center");
                    $("#status").removeClass("alert alert-success alert-danger text-center");
                    $("#status").remove();


                    if (data.toString() === "true") {

                        $("#transfer-msg").prepend("<div id='status'><strong>" + "** Transaction Successful **</br>"
                                + "Transferred " + money + " From " + sender + " To " + receiver + "."
                                + "</strong></div>").addClass("alert alert-success text-center");

                        var s = "chequing";

                        if (receiver.toUpperCase() === s.toUpperCase()) {

                            var amount = parseFloat($("#checkings").text());
                            amount = amount + parseFloat(money);
                            $("#checkings").text(amount + "");

                            amount = parseFloat($("#savings").text());
                            amount = amount - parseFloat(money);
                            $("#savings").text(amount + "");

                        } else {

                            var amount = parseFloat($("#checkings").text());
                            amount = amount - parseFloat(money);
                            $("#checkings").text(amount + "");

                            amount = parseFloat($("#savings").text());
                            amount = amount + parseFloat(money);
                            $("#savings").text(amount + "");
                        }

                    } else {
                        $("#transfer-msg").prepend("<div id='status'><strong>" +
                                "!! Transaction Failed !!</br>Not enough funds in " + sender + " to transfer."
                                + "</strong></div>").addClass("alert alert-danger text-center");
                    }

                },

                error: function (error) {
                    alert(error);
                }
            });

        }

        //close modal for trasferring within accounts.
        $("#close-transfer").click(function () {
            $("#transfer-msg").removeClass("alert alert-success alert-danger text-center");
            $("#status").removeClass("alert alert-success alert-danger text-center");
            $("#status").remove();
            $("#amount").val("");
            $("#from").val("chequing");
            $("#to").val("chequing");
        });

    });


    //etranser funds button.
    $("#etransfer-button").click(function () {

        if (validateETransfer()) {

            var eReceiver = $('#e-receiver').val();
            var account = $('#account').find(":selected").text();
            var eMoney = $('#e-amount').val();
            console.log(eReceiver + " " + account + " " + eMoney);

            $.ajax({
                url: 'etransfer',
                data: {receiver: eReceiver, account: account, amount: eMoney},
                type: "POST",
                cache: false,

                success: function (data) {

                    $("#etransfer-msg").removeClass("alert alert-success alert-danger text-center");
                    $("#e-status").removeClass("alert alert-success alert-danger text-center");
                    $("#e-status").remove();

                    console.log(data + " " + typeof data);

                    if (data.toString() === "true") {

                        $("#etransfer-msg").prepend("<div id='e-status'><strong>" + "** Transaction Successful **</br>"
                                + "Transferred " + eMoney + " From " + account + " To " + eReceiver + "."
                                + "</strong></div>").addClass("alert alert-success text-center");

                        var s = "chequing";

                        if (account.toUpperCase() === s.toUpperCase()) {

                            amount = parseFloat($("#checkings").text());
                            amount = amount - parseFloat(eMoney);
                            $("#checkings").text(amount + "");

                        } else {

                            var amount = parseFloat($("#savings").text());
                            amount = amount - parseFloat(eMoney);
                            $("#savings").text(amount + "");

                        }

                    } else {
                        $("#etransfer-msg").prepend("<div id='e-status'><strong>" +
                                "!! Transaction Failed !!</br>Not enough funds in " + account + " to eTransfer."
                                + "</strong></div>").addClass("alert alert-danger text-center");
                    }

                },

                error: function (error) {
                    alert(error);
                }
            });
        }
        //close modal for eTransfers
        $("#close-etransfer").click(function () {
            $("#etransfer-msg").removeClass("alert alert-success alert-danger text-center");
            $("#e-status").removeClass("alert alert-success alert-danger text-center");
            $("#e-status").remove();
            $("#e-receiver").val("");
            $("#account").val("chequing");
            $("#e-amount").val("");
        });

    });

    //change password.
    $("#change-pass-button").click(function () {

        if (validatePwdForm()) {

            var oldpwd = $('#oldpwd').val();
            var newpwd = $('#newpwd1').val();
            console.log(oldpwd + " " + newpwd);

            $.ajax({
                url: 'changePass',
                data: {oldPassword: oldpwd, newPassword: newpwd},
                type: "POST",
                cache: false,

                success: function (data) {

                    $("#change-pass-msg").removeClass("alert alert-success alert-danger text-center");
                    $("#pwd-status").removeClass("alert alert-success alert-danger text-center");
                    $("#pwd-status").remove();

                    console.log(data + " " + typeof data);

                    if (data.toString() === "true") {

                        $("#change-pass-msg").prepend("<div id='pwd-status'><strong>"
                                + "** Password Successfully Changed **"
                                + "</strong></div>").addClass("alert alert-success text-center");


                    } else {
                        $("#change-pass-msg").prepend("<div id='pwd-status'><strong>" +
                                "!! Password Change Failed !!</br>Please Try Again."
                                + "</strong></div>").addClass("alert alert-danger text-center");
                    }

                },

                error: function (error) {
                    alert(error);
                }
            });

        }
        //close modal for password change
        $("#close-change-pass").click(function () {
            $("#change-pass-msg").removeClass("alert alert-success alert-danger text-center");
            $("#pwd-status").removeClass("alert alert-success alert-danger text-center");
            $("#pwd-status").remove();
            $("#newpwd1").val("");
            $("#oldpwd").val("");
            $("#newpwd2").val("");
        });

    });


});




function validateTransfer() {
     
    var receiver = $('#to');
    var sender = $('#from');
    var money = $('#amount');
    
    receiver.removeClass("red-border");
    sender.removeClass("red-border");
    money.removeClass("red-border");
    
    $("#transfer-msg").removeClass("alert alert-success alert-danger text-center");
    $("#status").removeClass("alert alert-success alert-danger text-center");
    $("#status").remove();
    
    if(receiver.find(":selected").text()===""){
        receiver.addClass("red-border");
        $("#transfer-msg").prepend("<div id='status'><strong>Select An Account As Receiver.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if(sender.find(":selected").text()===""){
        sender.addClass("red-border");
        $("#transfer-msg").prepend("<div id='status'><strong>Select An Account As Sender.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if(money.val()==="" || isNaN(money.val())){
        money.addClass("red-border");
        $("#transfer-msg").prepend("<div id='status'><strong>Enter An Amount To Send.</br>Ensure You Enter Valid Number.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if(sender.find(":selected").text()===receiver.find(":selected").text()){
        sender.addClass("red-border");
        receiver.addClass("red-border");
        $("#transfer-msg").prepend("<div id='status'><strong>Sender and Receiver Account Cannot Be The Same</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }


    return true;
}

function validateETransfer() {
    
    var eReceiver = $('#e-receiver');
    var account = $('#account');
    var eMoney = $('#e-amount');
    
    eReceiver.removeClass("red-border");
    account.removeClass("red-border");
    eMoney.removeClass("red-border");
    
    $("#etransfer-msg").removeClass("alert alert-success alert-danger text-center");
    $("#e-status").removeClass("alert alert-success alert-danger text-center");
    $("#e-status").remove();
    
    var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!emailRegex.test(eReceiver.val())){
        eReceiver.addClass("red-border");
        $("#etransfer-msg").prepend("<div id='e-status'><strong>Not a valid Email Address.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if(account.find(":selected").text() === ""){
        account.addClass("red-border");
        $("#etransfer-msg").prepend("<div id='e-status'><strong>Select An Account To Withraw From.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    if(eMoney.val() === "" || isNaN(eMoney.val())){
        eMoney.addClass("red-border");
        $("#etransfer-msg").prepend("<div id='e-status'><strong>Enter An Amount To Send.</br>Ensure You Enter Valid Number.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    

    return true;
}


function validatePwdForm() {

    var oldpwd = $('#oldpwd');
    var newpwd = $('#newpwd1');
    var newpwd2 = $('#newpwd2');
    
    oldpwd.removeClass("red-border");
    newpwd.removeClass("red-border");
    newpwd2.removeClass("red-border");
    $("#change-pass-msg").removeClass("alert alert-success alert-danger text-center");
    $("#pwd-status").removeClass("alert alert-success alert-danger text-center");
    $("#pwd-status").remove();
    
    if(oldpwd.val() === ""){
        oldpwd.addClass("red-border");
        
        $("#change-pass-msg").prepend("<div id='pwd-status'><strong>Enter Current Password.</strong></div>")
                             .addClass("alert alert-danger text-center");
        return false;
    }
    
    var pwdRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;
    if(!pwdRegex.test(newpwd.val())){
        newpwd.addClass("red-border");
        
        $("#change-pass-msg").prepend("<div id='pwd-status'><strong>Password must meet requirements: <br />"+
        "Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number "+
        "and 1 Special Character.</strong></div>").addClass("alert alert-danger text-center");
        return false;
    }
    
    if(!(newpwd.val() === newpwd2.val())){
        newpwd2.addClass("red-border");
        $("#change-pass-msg").prepend("<div id='pwd-status'><strong>Passwords did not match.</strong></div>")
                .addClass("alert alert-danger text-center");
        return false;
    }
    
    return true;
}

