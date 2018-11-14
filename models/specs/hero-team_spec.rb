require("minitest/autorun")
require_relative("../hero-team")
require_relative("../hero")
require_relative("../team")

require('pry')

class TestHeroTeam < MiniTest::Test

  def setup
    @hero1_team5 = HeroTeam.new("id" => 1, "team_id" => 5, "hero_id" => 1)

    @hero3_team5 = HeroTeam.new("id" => 2, "team_id" => 5, "hero_id" => 3)

    @hero2_team6 = HeroTeam.new("id" => 2, "team_id" => 5, "hero_id" => 3)
  end

  def test_id()
    result = @hero1_team5.id()
    assert_equal(1, result)
  end

  def test_team_id()
    result = @hero3_team5.team_id()
    assert_equal(5, result)
  end

  def test_hero_id()
    result = @hero1_team5.hero_id()
    assert_equal(1, result)
  end

end
