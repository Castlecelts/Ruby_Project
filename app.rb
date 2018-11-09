require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/heroes_controller')
require_relative('controllers/teams_controller')


get '/' do
  erb( :index )
end
