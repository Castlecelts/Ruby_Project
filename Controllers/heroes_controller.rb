require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/hero')
also_reload('../models/*')

#index
get '/heroes' do
  @heroes = Hero.all()
  erb( :"heroes/index")
end

#new
get '/heroes/new' do
  erb( :"heroes/new")
end

#create
post '/heroes' do
  Hero.new(params).save
  redirect to '/heroes'
end

#show
get '/heroes/:id' do
  @hero = Hero.find(params['id'])
  erb( :"heroes/show")
end

#edit
get '/heroes/:id/edit' do
  @hero = Hero.find(params['id'])
  erb( :"heroes/edit")
end

#update
post '/heroes/:id' do
  hero = Hero.new(params)
  hero.update
  redirect to "/heroes/#{params['id']}"
end

#delete
post '/heroes/:id/delete' do
  hero = Hero.find(params['id'])
  hero.delete
  redirect to '/heroes'
end
