class Pokemon 
  attr_accessor :name,:type, :db 
  attr_reader :id
  def initialize(id: nil, name:,type:, db:) 
 
    @id = id if id 
    @name = name 
    @type = type 
    @db = db
      
  end 
  
  def self.create_table
    sql = <<-SQL 
      CREATE TABLE IF NOT EXISTS pokemon (
      id INTEGER PRIMARY KEY,
      name TEXT, 
      type TEXT
      ) 
      
    SQL
    
    @db.execute(sql) 
    
    
  end
  
  def self.save(name,type,db) 
      @db = db
    sql = <<-SQL
      INSERT INTO pokemon (name,type) 
      VALUES (?,?)
    SQL
    new_pok = Pokemon.new(name: name,type: type,db: db) 
   self.create_table
   
    
      @db.execute(sql,new_pok.name,new_pok.type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
      new_pok
 
  end
  
  
  def self.find(id,db) 
  
    p @db.execute("SELECT * FROM pokemon")
  
   @db.execute("SELECT * FROM pokemon WHERE id = ?;", id).map do |row|
     self.new_from_db(row,db)
    end.first
    
    
  end
  
  def self.new_from_db(row,db)
    new_pok = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db) 
    new_pok
   
  end
end
