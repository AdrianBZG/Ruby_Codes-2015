class Numero_Fraccionario
  attr_accessor :numerador, :denominador
  def initialize(numerador, denominador)
    @numerador, @denominador = numerador, denominador
  end
  def to_s
    "#{@x}/#{@y}"
  end
  def mcd(valor1, valor2)
	if valor1 == 0
		valor2
	else
		mcd(valor2%valor1, valor1)
	end
  end
  def mcm(valor1, valor2)
    (valor1/mcd(valor1,valor2))*valor2
  end
end