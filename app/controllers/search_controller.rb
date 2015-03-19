class SearchController < ApplicationController
  def search
    puts [params[:keyWords]]

    fakeData = [{ nom: "Machut", prenom: "Nicolas", genre: "", anneeNaissance: "", tel: "", mail: "", photos: [], adresse: {rue: "", codePostal: "", ville: "", }, profils: [], relations: [] }, { nom: "Souan", prenom: "Edouard", genre: "",anneeNaissance: "",tel: "",mail: "",photos: [],adresse: {rue: "",codePostal: "",ville: "" },profils: [],relations: [] }, { nom: "Henin", prenom: "Johan", genre: "",anneeNaissance: "",tel: "",mail: "",photos: [],adresse: {rue: "",codePostal: "",ville: "" },profils: [],relations: [] }]
    #Personne.new("Nicolas", "Machut");
    #Personne.all
    render json: fakeData
  end
end
