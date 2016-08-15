require('minitest/autorun')
require('minitest/rg')

require_relative('../models/analysis.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transactions.rb')

class AnalysisTest < MiniTest::Test

  def setup 
    @merchant1 = Merchant.new({'name' => 'merchant1'})
    @merchant2 = Merchant.new({'name' => 'merchant2'})

    @merchant1.save()
    @merchant2.save()

    @transaction1 = Transaction.new({'amount' => 10, 'merchant_id' => @merchant1.id, 'tag' => 'Food'})
    @transaction2 = Transaction.new({'amount' => 20, 'merchant_id' => @merchant2.id, 'tag' => 'Fuel'})

    @transaction1.save()
    @transaction2.save()

    @analysis = Analysis.new()

  end

  def test_total_amount_spent
    assert_equal(30, @analysis.total_all_transactions())
  end

  def test_total_by_merchant
    assert_equal(10, @analysis.total_by_merchant(@merchant1))
  end



end