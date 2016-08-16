require_relative('../db/SqlRunner.rb')

class Tag

  def self.all
    sql = "SELECT * FROM tags;"
    tags = SqlRunner.run(sql)
    return result = tags.map {|tag| Tag.new(tag)}
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = #{id};"
    tag = SqlRunner.run(sql).first
    return result = Tag.new(tag)
  end

  def self.update(options)
    sql = "UPDATE tags SET name = '#{options['name']}' WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM tags WHERE id = #{id};"
    SqlRunner.run(sql)
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