function validateForm() {
    var x = document.forms["register"]["firstName"].value;
    if (x == "") {
        alert("Name must be filled out");
        return false;
    }
}


