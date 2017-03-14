/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateTransfer() {
    return true;
}

function validateForm() {
    var flag = true;
    var old = document.forms["newpass"]["oldpwd"].value;
    var new1 = document.forms["newpass"]["newpwd1"].value;
    var new2 = document.forms["newpass"]["newpwd2"].value;
    if(oldpwd === "" || new1 === "") {
        window.alert("Please enter all fields");
        flag = false;
    }
    if(new1 !== new2) {
        window.alert("New passwords do not match");
        flag = false;
    }
    return flag;
}
