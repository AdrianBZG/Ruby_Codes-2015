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
  def test_resta
  	assert_equal("450/100", (Point.new(50,10) - Point.new(5,10)).to_s)
  end
  def test_multiplicacion
  	assert_equal("200/50", (@numero_fraccionario_1 * @numero_fraccionario_2).to_s)
  end
  def test_division
  	assert_equal("100/100", (@numero_fraccionario_1 / @numero_fraccionario_2).to_s)
  end
  def test_simplificar
  	assert_equal("2/1", @numero_fraccionario_1.simplificar.to_s)
  	assert_equal("2/1", @numero_fraccionario_2.simplificar.to_s)
  end
  def test_comparaciones
  	num1_simplificado = @numero_fraccionario_1.simplificar
  	num2_simplificado = @numero_fraccionario_2.simplificar
  	assert_equal(true, num1_simplicado.igual_que(num2_simplificado))
  	assert_equal(false, num1_simplicado.distinto_que(num2_simplificado))
	assert_equal(false, num1_simplicado.menor_que(num2_simplificado))
	assert_equal(false, num1_simplicado.mayor_que(num2_simplificado))
  end
end
