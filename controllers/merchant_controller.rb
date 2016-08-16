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
  @merchant = Merchant.new(params)
  @merchant.save()
  erb(:'merchants/create')
end

# Show
get '/merchants/:id' do
  @merchant = Merchant.find(params['id'])
  @analysis = Analysis.new()
  erb(:'merchants/show')
end

# Edit
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params['id'])
  erb(:'merchants/edit')
end

# Update
post '/merchants/:id' do
  Merchant.update(params)
  redirect(to("/merchants/:id"))
end

# Delete
post '/merchants/:id/delete' do
  redirect(to("/merchants"))
end