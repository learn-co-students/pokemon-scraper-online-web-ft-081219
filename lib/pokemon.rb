class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(keywords)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, database_connection)
        database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, database_connection)
        pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id)
        new_pokemon = self.new(pokemon)
        new_pokemon.id = pokemon[0][0]
        new_pokemon.name = pokemon[0][1]
        new_pokemon.type = pokemon [0][2]
        new_pokemon.db = database_connection
        new_pokemon
    end


end
