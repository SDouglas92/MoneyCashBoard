require_relative('./merchant.rb')
require_relative('./transactions.rb')
require_relative('./account.rb')
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

  def total_by_transactions(transactions)
    # calculates cost of selected merchants transactions
    total = 0
    for transaction in transactions
      total += transaction.amount
    end
    # binding.pry
    return total

  end

  def total_percentage(account)
    # binding.pry
    total = total_all_transactions()
    # total = 70
    balance = account.balance
    proportion = total.to_f / balance.to_f
    percentage = proportion * 100
    percentage
  end

  def tag_as_percentage(account, tag)
    transactions = Transaction.find_by_tag(tag)
    total = total_by_transactions(transactions)
    balance = account.balance
    percentage = (total/balance) * 100
    return percentage.round(2)
  end



end