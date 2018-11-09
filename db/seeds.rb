require_relative( "../models/hero" )
require("pry-byebug")

hero1 = Hero.new({
  "name" => "Thrall",
  "world" => "Warcraft",
  "hireable" => true
  })

hero1.save
