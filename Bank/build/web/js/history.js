/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    //some work...
    $('table').scrollTableBody();
});

function myFunction() {
    var showing = document.getElementById("options").value;
    if(showing === "chequing") {
        $('td:contains("chequing")').parent().show();
        $('td:contains("Chequing")').parent().show();
        $('td:contains("savings")').parent().hide();
        $('td:contains("Savings")').parent().hide();
    }else{
        $('td:contains("chequing")').parent().hide();
        $('td:contains("Chequing")').parent().hide();
        $('td:contains("savings")').parent().show();
        $('td:contains("Savings")').parent().show();
    }
    window.alert(account);
}