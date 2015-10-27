require 'lib/fraccionarios'
require 'test/unit'

class TestFraccionario < Test::Unit::TestCase
  def setup
  	@numero_fraccionario_1 = Numero_Fraccionario.new(10,5)
  	@numero_fraccionario_2 = Numero_Fraccionario.new(20,10)
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
  	assert_equal(30, @numero_fraccionario_2.mcm(15,6))
  end
  def test_suma
  	assert_equal("40/10", (@numero_fraccionario_1 + @numero_fraccionario_2).to_s)
  end
  def test_resta
  	assert_equal("-45/10", (Numero_Fraccionario.new(50,10) - Numero_Fraccionario.new(5,10)).to_s)
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
  def test_negacion
    	num1_simplificado = @numero_fraccionario_1.simplificar
    	num1_simplificado = -num1_simplificado
  	assert_equal("-2/1", num1_simplificado.to_s)
  end
  def test_multiplicacionporvalor
    	num1_simplificado = @numero_fraccionario_1.simplificar
    	num1_simplificado = num1_simplificado*5
  	assert_equal("10/1", num1_simplificado.to_s)
  end
  def test_comparaciones
  	num1_simplificado = @numero_fraccionario_1.simplificar
  	num2_simplificado = @numero_fraccionario_2.simplificar
  	assert_equal(true, num1_simplificado.igual_que(num2_simplificado))
  	assert_equal(false, num1_simplificado.distinto_que(num2_simplificado))
	assert_equal(false, num1_simplificado.menor_que(num2_simplificado))
	assert_equal(false, num1_simplificado.mayor_que(num2_simplificado))
  end
  def test_tof
  	assert_equal("2", @numero_fraccionario_1.to_f)
  end
  def test_reciproco
  	num1_simplificado = @numero_fraccionario_1.simplificar
  	assert_equal("1/2", num1_simplificado.to_s)
  end
end
