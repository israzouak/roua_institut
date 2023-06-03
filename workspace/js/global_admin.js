$(document).ready(function () {
    list_domaines()
})

function list_all_trainees() {
    $("div#display").load("core/user/list_all_trainees_for_admin")
}

function delete_trainer(id) {
    if(confirm('Voulez-vous supprimer cette ligne ?')) {
        $.post("core/user/delete.php", {id:id}, function (data) { alert(data); window.location.reload(); }, 'text')
    } 
}

function add_trainer() {
    $("div#display").load("form_trainer.html")
}

function list_all_trainers() {
    $("div#display").load("core/user/list_all_trainers_for_admin.php")
}

function list_domaines() {
    $("div#display").load("core/domaine/list_for_admin.php")
}

function delete_domaine(idd) {
    if(confirm('Voulez-vous supprimer cette ligne ?')) {
        $.post("core/domaine/delete.php", {idd:idd}, function (data) { alert(data); window.location.reload(); }, 'text')
    }
}

function list_trainees(idf) {
    $.post("core/user/list_trainees_for_admin.php", {idf:idf}, function (data) { $("div#display").html(data) }, 'text')
}

function list_trainers(idf) {
    $.post("core/user/list_trainers_for_admin.php", {idf:idf}, function (data) { $("div#display").html(data) }, 'text')
}

function list_my_affectations() {
    $("div#display").load("core/formation/list_for_trainer.php")  
}

function add_subscription(idf) {
    $.post("core/subscription/add.php", {idf:idf}, function (data) { alert(data) }, 'text')
}

function list_my_subscriptions() {
    $("div#display").load("core/subscription/list.php")    
}

function consult_formation(id) {
    $.post("core/formation/consult.php", {id:id}, function (data) { $("div#display").html(data) }, 'text')
}

function delete_formation(id) {
    if(confirm('Voulez-vous supprimer cette ligne ?')) {
        $.post("core/formation/delete.php", {id:id}, function (data) { alert(data); window.location.reload(); }, 'text')
    }
}

function add_formation($idd) {
    $("div#display").load("form_formation.php?idd="+$idd)    
}

function list_all_formations() {
    $("div#display").load("core/formation/list_all_for_admin.php")    
}

function list_formations(idd, title) {
    if(idd > 0 && title.length > 0) {
        $.post("core/formation/list.php", {idd:idd, title: title}, function (data) { $("div#display").html(data) }, 'text')
    }
    else {
        alert("Attention : Veuillez cliquer sur un domaine valide !!!")
    }
}

function search_formations() {
    var info = $("input#search").val()
    if(info.length > 0) {
        $.post("core/formation/search.php", {info:info}, function (data) { $("div#display").html(data) }, 'text')
    }
    else
    {
        list_all_formations()
    }
}