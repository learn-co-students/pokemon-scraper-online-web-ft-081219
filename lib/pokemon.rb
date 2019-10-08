require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db 
  def initialize(id, name, type, db)
    @id = id
    @name = name 
    @type = type 
    @db = db
  end
  
  def self.save(name, type)
    #binding.pry 
    
    sql =
    "INSERT INTO pokemon (name,type)
    VALUE (?, ?)"
    
    DB[:conn].execute(sql, self.name. self.type)
    id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end 
end
