require_relative('../db/sql_runner')
require('pry')

class Hero

  attr_reader :id
  attr_accessor :name, :world, :hireable

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @world = params['world']
    @hireable = params['hireable']
  end

  def hired
    return @hireable = false
  end

  def fired
    return @hireable = true
  end

  def hireable_pretty
    if @hireable == "t"
      return "Available for Hire"
    elsif @hireable == "f"
      return "This hero has been taken"
    end
  end

  def save()
    sql = "INSERT INTO heroes
    (
      name,
      world,
      hireable
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @world, @hireable]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM heroes"
    results = SqlRunner.run(sql)
    return results.map { |hero| Hero.new(hero)  }
  end

  def self.all_true()
    sql = "SELECT * FROM heroes WHERE hireable = true"
    results = SqlRunner.run(sql)
    return results.map { |hero| Hero.new(hero)  }
  end

  def self.find(id)
    sql = "SELECT * FROM heroes
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    hero = Hero.new(result)
    return hero
  end

  def update()
    sql = "UPDATE heroes
    SET
    (
      name,
      world,
      hireable
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @world, @hireable, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM heroes
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end#of class
