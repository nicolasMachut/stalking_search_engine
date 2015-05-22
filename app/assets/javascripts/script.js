function search () {

    var keyWords = $("#recherche").val();

    if (keyWords != "") {
        $("#results").hide();
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
            console.log(msg);
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

    var nomPrenom = createParagraphe(personne.nom + " " + personne.prenom);

    var email = createParagraphe(personne.mail);

    var telephone = createParagraphe(personne.tel)

    var adresse = createParagraphe(personne.adresse.rue + " " + personne.adresse.codePostal + " " + personne.adresse.ville);


    row.appendChild(col);
    col.appendChild(card);
    card.appendChild(nomPrenom);
    card.appendChild(email);
    card.appendChild(adresse);
    card.appendChild(telephone);

    document.getElementById("results").appendChild(row);
}

function createParagraphe (text) {
    var para = document.createElement("p");
    para.setAttribute("class", "white-text");
    var value = document.createTextNode(text);
    para.appendChild(value);
    return para;
}