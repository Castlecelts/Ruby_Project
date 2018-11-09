require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/hero')
also_reload('../models/*')

get '/heroes' do
  # "HEROES PAGE"
  erb( :"heroes/index")
end
