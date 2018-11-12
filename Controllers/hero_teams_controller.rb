require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')
require_relative('../models/hero')
require_relative('../models/hero-team')
also_reload('../models/*')

get '/hero_teams/new' do
  # new?team_id=<%= @team.id %>
  # @team = Team.find(params['id'])
  # p @team
  @heroes = Hero.all
  erb(:"hero-teams/new")
end
