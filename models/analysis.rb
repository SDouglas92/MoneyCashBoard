require_relative('./merchant.rb')
require_relative('./transactions.rb')
require('pry-byebug')

class Analysis

  attr_reader(:transactions, :merchants)

  def initialize()
    @transactions = Transaction.all
    @merchants = Merchant.all 
  end

  def total_all_transactions()
    # calculates the total cost of all transactions
    # binding.pry
    total = 0
    for transaction in @transactions
      total += transaction.amount
    end
    return total
  end

  def total_by_merchant(merchant)
    # calculates cost of selected merchants transactions
    transactions = merchant.transactions
    total = 0
    for transaction in transactions
      total += transaction.amount
    end
    # binding.pry
    return total

  end



end