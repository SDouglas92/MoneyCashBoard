require_relative('./merchant.rb')
require_relative('./transactions.rb')
require('pry-byebug')

class Analysis

  attr_reader(:transactions, :merchants)

  def initialize(trans, merchs)
    @transactions = trans
    @merchants = merchs   
  end

  def total_all_transactions()
    # binding.pry
    total = 0
    for transaction in @transactions
      total += transaction.amount
    end
    return total
  end



end