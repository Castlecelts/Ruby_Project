require_relative('../db/sql_runner')
require_relative('./hero')
require_relative('./hero-team')

require('pry')

class Team

  attr_reader :id
  attr_accessor :name, :region

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @region = params['region']
  end

  def save()
    sql = "INSERT INTO teams
    (
      name,
      region
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @region]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM teams"
    results = SqlRunner.run(sql)
    return results.map { |team| Team.new(team)  }
  end

  def self.find(id)
    sql = "SELECT * FROM teams
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    team = Team.new(result)
    return team
  end

  def update()
    sql = "UPDATE teams
    SET
    (
      name,
      region
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@name, @region, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM teams
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def hero_list()
    sql = "SELECT heroes.* FROM heroes
    INNER JOIN hero_teams
    ON hero_teams.hero_id = heroes.id
    WHERE team_id = $1"
    values = [@id]
    heroes_hash = SqlRunner.run(sql, values)
    heroes = heroes_hash.map{|hero| Hero.new(hero)}
    return heroes
  end


end
