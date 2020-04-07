class Pokemon 
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(name:, type:, db:, id:nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    
    db.execute(sql, name, type)
  end
  
  # def self.find(id_num, db)
  #   pokemon = db.execute("SELECT * FROM pokemon where id = ?", id_num)
  #   pokemon1 = self.new(pokemon)
  #   pokemon1.id = pokemon[0][0]
  #   pokemon1.name = pokemon[0][1]
  #   pokemon1.type = pokemon[0][2]
  #   pokemon1.db = db
  #   pokemon1
  # end
  
    def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  end
end
