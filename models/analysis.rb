require_relative('./merchant.rb')
require_relative('./transactions.rb')
require('pry-byebug')

class Analysis

  attr_reader(:transactions, :merchants)

  def intialize(trans, merchs)
    @transactions = trans
    @merchants = merchs   
  end

  def total()
    binding.pry
    total = 0
    for transaction in @transactions
      total += transaction.amount
    end
    return total
  end

  def test_total_by_tag()

  end


end