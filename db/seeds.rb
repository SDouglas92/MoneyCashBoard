require_relative('../models/analysis.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transactions.rb')
require_relative('../models/tags.rb')

@merchant1 = Merchant.new({'name' => 'Tesco'})
@merchant2 = Merchant.new({'name' => 'Asda'})
@merchant3 = Merchant.new({'name' => 'Amazon'})

@merchant1.save()
@merchant2.save()
@merchant3.save()

@tag1 = Tag.new({'name' => "Food"})
@tag2 = Tag.new({'name' => "Alcohol"})
@tag3 = Tag.new({'name' => "Games"})
@tag4 = Tag.new({'name' => "Shoes"})

@tag1.save()
@tag2.save()
@tag3.save()
@tag4.save()

@transaction1 = Transaction.new({'amount' => 10.99, 'merchant_id' => @merchant1.id, 'tag_id' => @tag1.id})
@transaction2 = Transaction.new({'amount' => 20.21, 'merchant_id' => @merchant2.id, 'tag_id' => @tag2.id})
@transaction3 = Transaction.new({'amount' => 40.00, 'merchant_id' => @merchant3.id, 'tag_id' => @tag3.id})
@transaction4 = Transaction.new({'amount' => 65.50, 'merchant_id' => @merchant3.id, 'tag_id' => @tag4.id})

@transaction1.save()
@transaction2.save()
@transaction3.save()
@transaction4.save()

@account = Account.new({'name' => "User", 'balance' => 100})
@account.save()