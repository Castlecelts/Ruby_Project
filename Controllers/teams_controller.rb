require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')
also_reload('../models/*')

#index
get '/teams' do
  @teams= Team.all()
  erb(:"teams/index")
end

#new
get '/teams/new' do
  erb( :"teams/new")
end

#create
post '/teams' do
  Team.new(params).save
  redirect to '/teams'
end

#show
get '/teams/:id' do
  @team = Team.find(params['id'])
  erb(:"teams/show")
end

#Edit
get '/teams/:id/edit' do
  @team = Team.find(params['id'])
  erb( :"teams/edit")
end

#update
post '/teams/:id' do
  team = Team.new(params)
  team.update
  redirect to "/teams/#{params['id']}"
end

#delete
post '/teams/:id/delete' do
  team = Team.find(params['id'])
  team.delete
  redirect to '/teams'
end
