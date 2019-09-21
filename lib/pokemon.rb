class Pokemon
   attr_accessor :name,:type,:id,:db

   def initialize(name:,type:,id:nil,db:)
      @name=name
      @type=type
      @id=id
      @db=db
   end

   def self.save(name_a,type_a,id_a=nil,db_a)
      new_pokemon=Pokemon.new(name:name_a,type:type_a,db:db_a,id:id_a)
      sql=<<-SQL
         INSERT INTO pokemon (name,type)
         VALUES (?,?)
      SQL
      new_pokemon.db.execute(sql,new_pokemon.name,new_pokemon.type)
      new_pokemon.id=new_pokemon.db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
      new_pokemon
   end

   def self.find(id,db)
      sql=<<-SQL
         SELECT * FROM pokemon
         WHERE id=?
         LIMIT 1
      SQL
      db.execute(sql,id).map do |row|
         self.new(name:row[1],type:row[2],id:row[0],db:db)
      end.first

   end

end
