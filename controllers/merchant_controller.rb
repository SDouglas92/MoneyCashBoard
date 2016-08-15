require_relative('../models/transactions.rb')
require_relative('../models/merchant.rb')
require_relative('../models/analysis.rb')

# Index
get '/merchants' do
  @merchants = Merchant.all
  erb(:'merchants/index')
end

# New
get '/merchants/new' do
  erb(:'merchants/new')
end

# Create
post '/merchants' do

end

# Show

get '/merchants/:id' do

end