require_relative('../models/account.rb')

#edit
get '/accounts' do
  accounts = Account.all
  @account = accounts.first
  erb(:'accounts/edit')
end

#update
post '/accounts' do
  Account.update(params)
  redirect(to('/analysis/all'))
end

