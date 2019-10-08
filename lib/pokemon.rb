require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db 
  def initialize(db)
    self.db = db
    self.id = id
    self.name = name 
    self.type = type 
    
  end
  
  def self.save(name, type, db)
    
  end 
end
