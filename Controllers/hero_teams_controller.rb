require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')
require_relative('../models/hero')
require_relative('../models/hero-team')
also_reload('../models/*')

#index temp
get '/hero_teams' do
  "Hello World"
end


#new
get '/hero_teams/new' do
  @team = Team.find(params['team_id'])
  @heroes = Hero.all_true
  erb(:"hero-teams/new")
end

#create
post '/hero_teams' do
  HeroTeam.new(params).save
  hero = Hero.find(params['hero_id'])
  hero.hired
  hero.update
  redirect to '/teams'
  # '/teams/#{params['team_id']}'
end

#delete
post '/hero_teams/:id/delete' do
  @hero_teams_row = HeroTeam.find(params['id'])
  heroes_in_team = @hero_teams_row.heroes
    heroes_in_team.fired
    heroes_in_team.update
  @hero_teams_row.delete
    redirect to '/teams'
end
