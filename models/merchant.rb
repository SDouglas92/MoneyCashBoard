require_relative('../db/SqlRunner.rb')

class Merchant

  def self.all
    # Pulls all instances of merchants from database
    sql = "SELECT * FROM merchants;"
    results = SqlRunner.run(sql)
    return merchants = results.map {|result| Merchant.new(result)} 
  end

  def self.find(id)
   # find merchant by id  
   sql = "SELECT * FROM merchants WHERE id = #{id}"
   merchant = SqlRunner.run(sql).first
  end

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

  def transactions()
    # Gets all transactions related to merchant
    sql = "SELECT * FROM transactions WHERE id = merchant_id;"
    transactions = SqlRunner.run(sql)
    return result = transactions.map {|transaction| Transaction.new(transaction)}
  end

end