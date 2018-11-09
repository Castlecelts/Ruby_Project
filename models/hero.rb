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










end#of class
