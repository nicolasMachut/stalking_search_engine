class Personne
  include Mongoid::Document
  field :nom, type: String, default: 'empty'
end