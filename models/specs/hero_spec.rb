require("minitest/autorun")
require_relative("../hero")

class TestHero < MiniTest::Test

  def setup
    @hero1 = Hero.new("id" => 1, "name" => "Thrall",
      "world" => "Warcraft", "hireable" => true)

  end

  def test_name()
    result = @hero1.name()
    assert_equal("Thrall", result)
  end

end#of class
