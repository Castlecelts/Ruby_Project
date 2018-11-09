require("minitest/autorun")
require_relative("../hero")
require('pry')

class TestHero < MiniTest::Test

  def setup
    @hero1 = Hero.new("id" => 1, "name" => "Thrall", "world" => "Warcraft", "hireable" => "t")

    @hero2 = Hero.new("id" => 2, "name" => "Artanis", "world" => "Starcraft", "hireable" => "f")

  end#of setup

  #############################################################################

  def test_id()
    result = @hero2.id()
    assert_equal(2, result)
  end

  def test_name()
    result = @hero1.name()
    assert_equal("Thrall", result)
  end

  def test_world()
    result = @hero1.world()
    assert_equal("Warcraft", result)
  end

  def test_hireable_true()
    result = @hero1.hireable()
    assert_equal("t", result)
  end

  def test_hireable_false()
    result = @hero2.hireable()
    assert_equal("f", result)
  end

###############################################################################

  def test_hireable_pretty_true()
    result = @hero1.hireable_pretty
    assert_equal("Available for Hire", result)
  end

  def test_hireable_pretty_false()
    result = @hero2.hireable_pretty
    assert_equal("This hero has been taken", result)
  end

end#of class
