require 'open-uri'
require 'regex'
class SearchController < ApplicationController


  def search
    keyword = [params[:keyWords]][0]

    render json: find(keyword)
  end

  def find (value)

    value = /.*#{value}.*/i

    return Personne.any_of({nom: value},{prenom: value}, {anneeNaissance:value}, {tel:value}, {mail:value})
  end

end
