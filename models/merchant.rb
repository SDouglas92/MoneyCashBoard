require_relative('../db/SqlRunner.rb')

class Merchant

  attr_reader(:id, :name)

  def initialize(options)
    # Create new instance of Merhant class, passing in hash 
    @id = options['id']
    @name = options['name']
  end

  def save()
    # Saves instance into db 
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id']
  end

end