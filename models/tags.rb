require_relative('../db/SqlRunner.rb')

class Tag

  def self.all
    sql = "SELECT * FROM tags;"
    tags = SqlRunner.run(sql)
    return result = tags.map {|tag| Tag.new(tag)}
  end

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO tags (name) VALUES '#{@name}' RETURNING *;"
    tag =  SqlRunner.run(sql).first
    return @id = tag['id']
  end

end