require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')
require_relative('../models/hero')
require_relative('../models/hero-team')
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
  @heroes = @team.hero_list()
  @numbering = 0
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
  @team = Team.find(params['id'])
  heroes_in_team = @team.hero_list
    to_be_updated = heroes_in_team.each {|hero| hero.fired}
    to_be_updated.each{|hero| hero.update}
  @team.delete
  redirect to '/teams'
end
