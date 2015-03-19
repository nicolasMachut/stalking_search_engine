class SearchController < ApplicationController
  def search
    puts [params[:keyWords]]

    fakeData = [{ nom: "Machut", prenom: "Nicolas", genre: "", anneeNaissance: "", tel: "", mail: "", photos: [], adresse: {rue: "", codePostal: "", ville: "", }, profils: [], relations: [] }, { nom: "Souan", prenom: "Edouard", genre: "",anneeNaissance: "",tel: "",mail: "",photos: [],adresse: {rue: "",codePostal: "",ville: "" },profils: [],relations: [] }, { nom: "Henin", prenom: "Johan", genre: "",anneeNaissance: "",tel: "",mail: "",photos: [],adresse: {rue: "",codePostal: "",ville: "" },profils: [],relations: [] }]

    personne = Personne.new("nicolas")
    puts personne.all
    puts personne.save
    puts personne.all

    render json: fakeData
  end
end
