require('minitest/autorun')
require('minitest/rg')

require_relative('../models/analysis.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transactions.rb')
require_relative('../models/tags.rb')
require('pry-byebug')

class AnalysisTest < MiniTest::Test

  def setup 
      @analysis = Analysis.new()
  end

  def test_total_amount_spent
    assert_equal(70, @analysis.total_all_transactions())
  end

  def test_total_by_trasnaction
    @merchant1 = Merchant.find(1)
    transactions = @merchant1.transactions
    assert_equal(10, @analysis.total_by_transactions(transactions))
  end

  def test_total_transactions_as_percentage
    accounts = Account.all
    @account = accounts.first
    assert_equal(70, @analysis.total_percentage(@account))
  end

  def test_tag_as_percentage
    accounts = Account.all
    @account = accounts.first
    assert_equal(10, @analysis.tag_as_percentage(@account, 1))
  end



end