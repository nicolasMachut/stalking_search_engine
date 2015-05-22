require 'open-uri'
require 'regexp'
class SearchController < ApplicationController


  def search
    keyword = [params[:keyWords]][0]

    render json: find(keyword)
  end

  def find (value)
    return Personne.any_of({nom: Regexp.new ("/.*"+value+".*/")},{prenom: value}, {genre:value}, {anneeNaissance:value})
  end

end
