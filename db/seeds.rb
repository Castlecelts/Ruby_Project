require_relative( "../models/hero" )
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
