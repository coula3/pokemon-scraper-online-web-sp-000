class Pokemon 
  attr_accessor :id, :name, :type, :db
  
  def initialize(name:, type:, db:, id:nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (name = ?, type = ?, db = ?)
    SQL
    
    @db.execute(sql, self.name, self.type)
    # @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
end
