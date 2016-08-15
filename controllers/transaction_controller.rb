require_relative('../models/transactions.rb')

# Index
get '/transactions' do
  @transactions = Transaction.all()
  erb(:'transactions/index')
end

# New
get '/transactions/new' do
  erb(:'transactions/new')
end

# Create
post '/transactions' do

end

# Show
get '/transactions/:id' do

end
