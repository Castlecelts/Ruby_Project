require_relative('../db/sql_runner')
require('pry')

class HeroTeam

  attr_reader :id, :team_id, :hero_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @team_id = params['team_id'].to_i
    @hero_id = params['hero_id'].to_i
  end

end#of class
