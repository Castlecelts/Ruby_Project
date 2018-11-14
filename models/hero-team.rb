require_relative('../db/sql_runner')
require_relative('./hero')
require_relative('./team')
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
    sql = "SELECT heroes.* FROM heroes WHERE id = $1"
    values = [@hero_id]
    results = SqlRunner.run(sql, values)
    return Hero.new(results.first)
  end

  def teams()
    sql = "SELECT teams.* FROM teams WHERE id = $1"
    values = [@team_id]
    results = SqlRunner.run(sql, values)
    return Team.new(results.first)
  end

  def self.all()
    sql = "SELECT * FROM hero_teams"
    results = SqlRunner.run(sql)
    return results.map { |join| HeroTeam.new(join)  }
  end

  def self.find(id)
    sql = "SELECT * FROM hero_teams
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    heroteam = HeroTeam.new(result)
    return heroteam
  end

  def delete()
    sql = "DELETE FROM hero_teams
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_hero(id)
    sql = "DELETE FROM hero_teams
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



  # def update()
  #   sql = "UPDATE heroes
  #   SET
  #   (
  #     name,
  #     world,
  #     hireable
  #     ) =
  #     (
  #       $1, $2, $3
  #     )
  #     WHERE id = $4"
  #     values = [@name, @world, @hireable, @id]
  #     SqlRunner.run(sql, values)
  # end


end#of class
