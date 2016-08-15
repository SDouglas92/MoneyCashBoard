require_relative('../db/SqlRunner.rb')

class Transaction

  def self.all 
    sql = "SELECT * FROM transactions;"
    results = SqlRunner.run(sql)
    return transactions = results.map {|result| Transaction.new(result)}
  end

  def self.find(id)
    # find transaction by id
    sql = "SELECT * FROM transactions WHERE id = #{id};"
    transaction = SqlRunner.run(sql).first
  end

  def self.find_by_tag(tag)
    # find transaction by tag 
    sql = "SELECT * FROM transaction WHERE tag = '#{tag}';"
    transactions = SqlRunner.run(sql)
    return result =  transactions.map {|transaction| Transaction.new(transaction)}
  end

  attr_reader(:id, :amount, :merchant_id, :tag)

  def initialize(options)
    # Creates new instances of transactions, takes in hash of options
    @id = options['id'].to_i
    @amount = options['amount'].to_f
    @merchant_id = options['merchant_id'].to_i
    @tag = options['tag']
  end 

  def save
    # Saves instance to database
    sql = "INSERT INTO transactions (amount, merchant_id, tag) VALUES ('#{@amount.to_f}', '#{@merchant_id}', '#{@tag}') RETURNING *"
    trans = SqlRunner.run(sql).first
    @id = trans['id']
  end

  def merchants
    # Gets name of merchant related to transaction
    sql = "SELECT name FROM merchants WHERE #{@merchant_id} = id;"
    return name = SqlRunner.run(sql).first
  end


end