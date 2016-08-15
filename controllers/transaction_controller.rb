require_relative('../models/transactions.rb')
require_relative('../models/merchant.rb')

# Index
get '/transactions' do
  @transactions = Transaction.all()
  erb(:'transactions/index')
end

# New
get '/transactions/new' do
  @merchants = Merchant.all
  erb(:'transactions/new')
end

# Create
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:'transactions/create')
end

# Show
get '/transactions/:id' do

end
