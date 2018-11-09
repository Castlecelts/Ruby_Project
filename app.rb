require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require_relative('controllers/heroes_controller')


get '/' do
  erb( :index )
end
