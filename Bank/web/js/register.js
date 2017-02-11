function validateForm() {
    var x = document.getElementById("firstName").value;
    alert(x);
    if (x === "") {
        x.style.backgroundColor=red;
        alert("Name must be filled out");
        return false;
    }
    var x = document.forms["register"]["lastName"].value;
    if (x === "") {
        x.style.backgroundColor=red;
        alert("Name must be filled out");
        return false;
    }
    var x = document.forms["register"]["address"].value;
    if (x === "") {
        x.style.backgroundColor=red;
        alert("Address must be filled out");
        return false;
    }
    var x = document.forms["register"]["email"].value;
    if (x === "") {
        x.style.backgroundColor=red;
        alert("Email must be filled out");
        return false;
    }
    var x = document.forms["register"]["phone"].value;
    if (x === "") {
        x.style.backgroundColor=red;
        alert("Phone must be filled out");
        return false;
    }
    var x = document.forms["register"]["answer1"].value;
    if (x === "") {
        x.style.backgroundColor=red;
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


