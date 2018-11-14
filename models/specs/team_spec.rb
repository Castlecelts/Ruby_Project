require("minitest/autorun")
require_relative("../hero")
require('pry')

class TestTeam < MiniTest::Test

  def setup
    @team1 = Team.new("id" => 1, "name" => "GenG", "region" => "North America")

    @team2 = Team.new("id" => 2, "name" => "Fnatic", "region" => "Europe")
  end

  def test_id()
    result = @team2.id()
    assert_equal(2, result)
  end

  def test_name()
    result = @team1.name()
    assert_equal("GenG", result)
  end

  def test_region()
    result = @team1.region()
    assert_equal("North America", result)
  end

end
