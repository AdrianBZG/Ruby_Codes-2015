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
  def + (other)
	aux = mcm(@denominador, other.denominador)
    Numero_Fraccionario.new(((aux/@denominador)*@numerador)+((aux/other.denominador)*other.numerador), aux)
  end
  def - (other)
	aux = mcm(@denominador, other.denominador)
    Numero_Fraccionario.new(((aux/other.denominador)*other.numerador)-((aux/@denominador)*@numerador), aux)
  end
  def * (other)
    Numero_Fraccionario.new((@numerador * other.numerador),(@denominador * other.denominador))
  end
  def / (other)
    Numero_Fraccionario.new((@numerador * other.denominador),(@denominador * other.numerador))
  end
end