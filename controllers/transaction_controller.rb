require_relative('../models/transactions.rb')
require_relative('../models/merchant.rb')
require_relative('../models/analysis.rb')
require_relative('../models/tags.rb')
require('pry-byebug')

# Index
get '/transactions' do
  @transactions = Transaction.all()
  @analysis = Analysis.new
  erb(:'transactions/index')
end

# New
get '/transactions/new' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:'transactions/new')
end

# Create
post '/transactions' do
  # binding.pry
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:'transactions/create')
end

# Show
get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:'transactions/show')
end

# Edit 
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'].to_i)
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:'transactions/edit')
end
# Update
post '/transactions/:id' do
  Transaction.update(params)
  redirect(to("/transactions/#{params[:id]}"))
end

# Destroy
post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect(to('/transactions'))
end



