require_relative('../db/sql_runner')

class Hero

  attr_reader :id
  attr_accessor :name, :world, :hireable

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @world = params['world']
    @hireable = params['hireable']
  end

  def hireable_pretty
    if @hireable
      return "Available for Hire"
    else
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










end#of class
