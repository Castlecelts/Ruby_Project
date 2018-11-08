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









end#of class
