require_relative('../models/transactions.rb')
require_relative('../models/merchant.rb')
require_relative('../models/analysis.rb')
require_relative('../models/tags.rb')
require ('pry-byebug')

# New
get '/tags/new' do
  erb(:'tags/new')
end

# Create
post '/tags' do
  @tag = Tag.new(params)
  @tag.save()
  redirect(to("/tags"))
end

# index
get '/tags' do
  @tags = Tag.all()
  erb(:'tags/index')
end

# Show
get '/tags/:id' do
  @transactions = Transaction.find_by_tag(params['id'])
  @tag = Tag.find(params['id'])
  @analysis = Analysis.new()
   erb(:'tags/show')
end

# Edit
get '/tags/:id/edit' do
  @tag = Tag.find(params['id'])
  erb(:'tags/edit')
end

# Update
post '/tags/:id' do
  Tag.update(params)
  redirect(to("/tags"))
end

# Delete
post '/tags/:id/delete' do
  Tag.delete(params[:id])
  redirect(to("/tags"))
end


