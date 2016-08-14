require_relative('../db/SqlRunner.rb')

class Transactions

  attr_reader(:id, :amount, :merchant_id)

  def initialize(options)
    # Creates new instances of transactions, takes in hash of options
    @id = options['id']
    @amount = options['amount']
    @merchant_id = options['merchant_id']
  end 

  def save
    # Saves instance to database
    sql = "INSERT INTO transactions (amount, merchant_id) VALUES ('#{@amount}', '#{@merchant_id}') RETURNING *"
    trans = SqlRunner.run(sql).first
    @id = trans['id']
  end


end