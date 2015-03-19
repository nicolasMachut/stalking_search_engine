class Personne < ActiveRecord::Base

  attr_accessor :prenom
  attr_accessor :nom

  def initialize(prenom, nom)
    @prenom = prenom
    @nom = nom
  end


  def nom(val)
    @name = val.capitalize
  end

  def nom
    @name
  end

  def prenom(val)
    @prenom = val
  end

  def nom
    @prenom
  end

end