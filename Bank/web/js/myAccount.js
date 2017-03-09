$(document).ready(function(){
    $("#toggle-summary").click(function(){
        $("#summary").toggle(1000,function(){});
        
        if($("#toggle-summary").text() == "-")
           $("#toggle-summary").html("+");
        else
           $("#toggle-summary").html("-"); 
        
    });
});


