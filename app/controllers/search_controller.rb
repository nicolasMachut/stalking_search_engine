require 'open-uri'
class SearchController < ApplicationController


  def search
    keyword = [params[:keyWords]][0]

    response = open('https://api.github.com/users?since=135').read
    puts JSON.parse(response)[0].login

    render json: find(keyword)
  end

  def find (value)
    return Personne.any_of({nom: value},{prenom: value}, {genre:value}, {anneeNaissance:value})
  end

end
