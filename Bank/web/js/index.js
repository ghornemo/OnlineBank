function validateForm() {
    var x = document.forms["login"]["email"].value;
    if (x === "") {
        x.style.backgroundColor=red;
        alert("Email address is required to login.");
        return false;
    }
    x = document.forms["login"]["password"].value;
    if (x === "") {
        x.style.backgroundColor=red;
        alert("password is required to login.");
        return false;
    }
    return true;
}


