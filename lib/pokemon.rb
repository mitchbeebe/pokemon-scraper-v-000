class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type)
    sql = <<-SQL
      insert into pokemon (id, name, type)
      values (?, ?)
    SQL
    @db.execute(sql, @name, @type)
  end
end
