require_relative( "../models/hero" )
require_relative( "../models/team" )
require("pry-byebug")

hero1 = Hero.new({
  "name" => "Thrall",
  "world" => "Warcraft",
  "hireable" => true
  })

hero1.save

hero2 = Hero.new({
  "name" => "Artanis",
  "world" => "Starcraft",
  "hireable" => true
  })

hero2.save

team1 = Team.new({
  "name" => "GenG",
  "region" => "North America"
  })

team1.save

team2 = Team.new({
  "name" => "Fnatic",
  "region" => "Europe"
  })

team2.save
