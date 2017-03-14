function validateForm() {
    
    var first = document.forms["register"]["firstName"].value;
    if (first == "") {
        alert("Name must be filled out");
        return false;
    }
    
    var last = document.forms["register"]["lastName"].value;
    if (last === "") {
        last.style.backgroundColor = red;
        alert("Name must be filled out");
        return false;
    }

    var p = document.forms["register"]["password"].value;
    var paswd = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
    if (!p.value.match(paswd)) {     
        p.style.backgroundColor = red;
        alert("password should be between 7 to 15 characters and contain least one numeric digit and a special character");
        return false;
    }

    var p2 = document.forms["register"]["password2"].value;
    if (!p.equals(p2)) {
        p2.style.backgroundColor = red;
        alert("Passwords do not match");
        return false;
    }

    var x = document.forms["register"]["address"].value;
    if (x === "") {
        x.style.backgroundColor = red;
        alert("Address must be filled out");
        return false;
    }
    var x = document.forms["register"]["email"].value;
    if (x === "") {
        x.style.backgroundColor = red;
        alert("Email must be filled out");
        return false;
    }
    var x = document.forms["register"]["phone"].value;
    if (x === "") {
        x.style.backgroundColor = red;
        alert("Phone must be filled out");
        return false;
    }
    var x = document.forms["register"]["answer1"].value;
    if (x === "") {
        x.style.backgroundColor = red;
        alert("Missing security question 1");
        return false;
    }
    var x = document.forms["register"]["answer2"].value;
    if (x === "") {
        alert("Missing security question 2");
        return false;
    }
    
    return true;
}


