require_relative('../models/analysis.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transactions.rb')
require_relative('../models/tags.rb')

@merchant1 = Merchant.new({'name' => 'merchant1'})
@merchant2 = Merchant.new({'name' => 'merchant2'})

@merchant1.save()
@merchant2.save()

@tag1 = Tag.new({'name' => "Food"})
@tag2 = Tag.new({'name' => "Alcohol"})

@tag1.save()
@tag2.save()

@transaction1 = Transaction.new({'amount' => 10, 'merchant_id' => @merchant1.id, 'tag_id' => @tag1.id})
@transaction2 = Transaction.new({'amount' => 20, 'merchant_id' => @merchant2.id, 'tag_id' => @tag2.id})
@transaction3 = Transaction.new({'amount' => 40, 'merchant_id' => @merchant2.id, 'tag_id' => @tag2.id})

@transaction1.save()
@transaction2.save()
@transaction3.save()

@account = Account.new({'name' => "Simon", 'balance' => 100})
@account.save()