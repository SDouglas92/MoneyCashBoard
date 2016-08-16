require_relative('../db/SqlRunner.rb')

class Account

  def self.all
    sql = "SELECT * FROM accounts;"
    accounts = SqlRunner.run(sql)
    return result = accounts.map {|account| Account.new(account)}
  end

  attr_reader(:id, :name, :balance)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @balance = options['balance'].to_i
  end

  def save
    sql = "INSERT INTO accounts (name, balance) VALUES ('#{@name}', #{@balance}) RETURNING *;"
    account = SqlRunner.run(sql).first
    @id = account['id']
  end

end