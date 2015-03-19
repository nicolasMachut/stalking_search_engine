class Personne

  include MongoMapper::Document

  key :nom,           String
  key :prenom,        String
  key :genre,         String

end