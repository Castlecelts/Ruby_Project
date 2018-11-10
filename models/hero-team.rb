require_relative('../db/sql_runner')
require('pry')

class HeroTeam

  attr_reader :id, :team_id, :hero_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @team_id = params['team_id'].to_i
    @hero_id = params['hero_id'].to_i
  end

  def save()
    sql = "INSERT INTO hero_teams
    (
      team_id,
      hero_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@team_id, @hero_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def heroes()
    sql = "SELECT * FROM heroes WHERE id = $1"
    values = [@hero_id]
    results = SqlRunner.run(sql, values)
    return Hero.new(results.new)
  end


end#of class
