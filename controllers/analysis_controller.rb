require_relative('../models/transactions.rb')
require_relative('../models/merchant.rb')
require_relative('../models/analysis.rb')
require_relative('../models/account.rb')

get '/analysis/all' do
  accounts = Account.all
  @account = accounts.first
  @tags = Tag.all
  @analysis = Analysis.new()
  erb(:'analysis/index_all')
end