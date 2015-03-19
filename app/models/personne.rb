class Personne
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nom, type: String, default: 'empty'

  def initialize(nom)
    @nom = nom
    puts @nom
  end

end