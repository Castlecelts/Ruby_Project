require_relative( "../models/hero" )
require_relative( "../models/team" )
require_relative( "../models/hero-team" )
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

hero3 = Hero.new({
  "name" => "Fenix",
  "world" => "Starcraft",
  "hireable" => false
  })

hero3.save

hero4 = Hero.new({
  "name" => "Raynor",
  "world" => "Starcraft",
  "hireable" => false
  })

hero4.save

hero5 = Hero.new({
  "name" => "Jaina",
  "world" => "Warcraft",
  "hireable" => true
  })

hero5.save

hero6 = Hero.new({
  "name" => "Kael'thas",
  "world" => "Warcraft",
  "hireable" => true
  })

hero6.save

###############################################################################

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

###############################################################################

hero1_team1  = HeroTeam.new({
  "team_id" => team1.id,
  "hero_id" => hero1.id
  })

hero1_team1 .save

hero5_team1  = HeroTeam.new({
  "team_id" => team1.id,
  "hero_id" => hero5.id
  })

hero5_team1 .save

hero6_team1  = HeroTeam.new({
  "team_id" => team1.id,
  "hero_id" => hero6.id
  })

hero6_team1 .save

hero2_team2  = HeroTeam.new({
  "team_id" => team2.id,
  "hero_id" => hero2.id
  })

hero2_team2 .save

hero3_team2  = HeroTeam.new({
  "team_id" => team2.id,
  "hero_id" => hero3.id
  })

hero3_team2 .save

hero4_team2  = HeroTeam.new({
  "team_id" => team2.id,
  "hero_id" => hero4.id
  })

hero4_team2 .save
