class Pokemon
  attr_accessible :name, :type, :db 
  attr_reader :id 
  
  def initialize(id=nil, name, type, db)
    @id = id
    @name = name
    @type = db
  end
  
  def self.pokemon_from_db
    
  end 
end
