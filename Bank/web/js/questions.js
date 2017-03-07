/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function loadQuestions() {
    var q1 = getCookie("question1");
    var q2 = getCookie("question2");
    var $question1 = document.querySelector('.question1');
    var $question2 = document.querySelector('.question2');

$question1.innerHTML = q1;
$question2.innerHTML = q2;
}
loadQuestions();