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

# New - tag
# Gets user to input tag the want to search for
get '/transactions/tag/new' do
  @tags = Tag.all()
  erb(:'transactions/tag')
end

# Create - tag
# Shows results based on the tag the user has searched
post '/transactions/tag' do
  # binding.pry
  @transactions = Transaction.find_by_tag(params['tag_id'])
  @analysis = Analysis.new()
   erb(:'transactions/tag_index')
end
