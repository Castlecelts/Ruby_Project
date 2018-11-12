require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative('controllers/heroes_controller')
require_relative('controllers/teams_controller')
require_relative('controllers/hero_teams_controller')




get '/' do
  erb( :index )
end
