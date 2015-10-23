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
  def test_mcd
    assert_equal(5, @numero_fraccionario_1.mcd(10,5))
	assert_equal(8, @numero_fraccionario_1.mcd(40,8))
  end
  def test_mcm
    assert_equal(5, @numero_fraccionario_1.mcm(5,1))
	assert_equal(60, @numero_fraccionario_2.mcm(15,6))
  end
  def test_suma
    assert_equal("40/10", (@numero_fraccionario_1 + @numero_fraccionario_2).to_s)
  end
end
