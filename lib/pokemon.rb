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
  #   pokemon1
  # end
  
   def self.find(num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon.hp = pokemon[0][3]
    return new_pokemon
  end

  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [num], [self.id])
    self.hp = num
  end
  
end
