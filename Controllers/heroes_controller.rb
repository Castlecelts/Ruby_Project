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
