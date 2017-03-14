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


