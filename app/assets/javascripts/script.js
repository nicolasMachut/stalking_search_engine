function search () {

    var keyWords = $("#recherche").val();

    if (keyWords != "") {
        $("#results").slideUp();
        $("#results").empty();
        $("#searchProgresse").slideDown();
        searchRequest(keyWords);
    } else {
        toast("Please enter your search criteria", 2500)
    }
}

function searchRequest (keyWords) {

    var url = "/search/search";

    $.ajax({
        method: "GET",
        url: url,
        data: { keyWords: keyWords }
    })
        .done(function( msg ) {
            $("#searchProgresse").slideUp();
            $("#results").slideDown();
            var nbResult = msg.length;
            toast(nbResult + " result(s) match your search", 4000)

            for (var i = 0; i < nbResult; i++) {
                afficherPersonne(msg[i], i);
            }
        });
}

function afficherPersonne (personne, i) {

    var row = null;

    if( i % 2 > 0 ) {
        row = document.getElementById("personne." + (i-1));
    } else {
        row = document.createElement("div");
        row.setAttribute("class", "row");
        row.setAttribute("id", "personne." + i);
    }

    var col = document.createElement("div");
    col.setAttribute("class", "col s12 m6");

    var card = document.createElement("div");
    card.setAttribute("class", "card-panel teal z-depth-2");

    var span = document.createElement("span");
    span.setAttribute("class", "white-text");
    var t = document.createTextNode(personne.nom + " " + personne.prenom);
    span.appendChild(t);

    row.appendChild(col);
    col.appendChild(card);
    card.appendChild(span);

    document.getElementById("results").appendChild(row);
}