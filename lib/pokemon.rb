require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db 
  def initialize(db:, id:, name:, type:)
    @db = db
    self.id = id
    self.name = name 
    self.type = type 
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) 
      VALUES (?, ?)", name, type) 
  end 
  
  def self.find(id, db)
    pokemon = db.execute("SELECT *
    FROM pokemon
    WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db) 
  end 
end
