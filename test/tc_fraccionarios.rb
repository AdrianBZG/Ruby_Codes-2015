require 'lib/fraccionarios'
require 'test/unit'

class TestPoint < Test::Unit::TestCase
  def setup
    @numero_fraccionario_1 = Point.new(10,5)
    @numero_fraccionario_2 = Point.new(20,10)
  end
  def test_tos
    assert_equal("10/5", @numero_fraccionario_1.to_s)
	assert_equal("20/10", @numero_fraccionario_2.to_s)
  end
end