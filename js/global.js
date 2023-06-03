$(document).ready(function () {
    $("nav#navbar").load("_content_navbar.html")
    $("div#footer").load("_content_footer.html")
    $("div#domaines").load("core/domaine/list.php")
    list_all_formations()
})

function consult_formation(id) {
    $.post("core/formation/consult.php", {id:id}, function (data) { $("div#formations").html(data) }, 'text')
}

function list_all_formations() {
    $("div#formations").load("core/formation/list_all.php")    
}

function list_formations(idd, title) {
    if(idd > 0 && title.length > 0) {
        $.post("core/formation/list.php", {idd:idd, title: title}, function (data) { $("div#formations").html(data) }, 'text')
    }
    else {
        alert("Attention : Veuillez cliquer sur un domaine valide !!!")
    }
}

function search_formations() {
    var info = $("input#search").val()
    if(info.length > 0) {
        $.post("core/formation/search.php", {info:info}, function (data) { $("div#formations").html(data) }, 'text')
    }
    else
    {
        list_all_formations()
    }
}