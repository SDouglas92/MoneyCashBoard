require_relative('../models/transactions.rb')
require_relative('../models/merchant.rb')
require_relative('../models/analysis.rb')
require_relative('../models/tags.rb')
require ('pry-byebug')

# New search- tag
# Gets user to input tag the want to search for
get '/transactions/tag/new' do
  @tags = Tag.all()
  erb(:'tags/new_search')
end

# Create search - tag
# Shows results based on the tag the user has searched
post '/transactions/tag' do
  binding.pry
  @transactions = Transaction.find_by_tag(params['tag_id'])
  @analysis = Analysis.new()
   erb(:'tags/index_search')
end