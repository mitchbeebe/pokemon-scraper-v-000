class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      insert into pokemon (name, type)
      values (?, ?)
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find(name)
    sql = <<-SQL
      select *
      from pokemon
      where name = ?
    SQL
    db.execute(sql, name)
  end
end
