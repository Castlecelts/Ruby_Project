require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')
also_reload('../models/*')

#index
get '/teams' do
  @teams= Team.all()
  erb(:"teams/index")
end
