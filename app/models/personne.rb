require 'mongoid'
class Personne
  include Mongoid::Document

  field :nom

end