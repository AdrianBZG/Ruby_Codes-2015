# Clase "Numero Fraccionario"
# Adrián Rodríguez Bazaga

class Numero_Fraccionario
  # Se tiene acceso de lectura y escritura a 'numerador' y 'denominador'
  attr_accessor :numerador, :denominador
  def initialize(numerador, denominador)
  	# Constructor: Los fraccionarios no se simplifican en su inicialización, se debe hacer intencionadamente
  	# con el método 'simplificar'
  	@numerador, @denominador = numerador, denominador
  end
  def to_s
  	#Mostrar numerador y denominador
  	"#{@numerador}/#{@denominador}"
  end
  def mcd(valor1, valor2)
  	#Maximo comun divisor
  	if valor1 == 0
		valor2
	else
		mcd(valor2%valor1, valor1)
	end
  end
  def mcm(valor1, valor2)
  	#Minimo comun multiplo
  	(valor1/mcd(valor1,valor2))*valor2
  end  
  def + (other)
  	#Suma de dos objetos tipo numero fraccionario
	aux = mcm(@denominador, other.denominador)
	Numero_Fraccionario.new(((aux/@denominador)*@numerador)+((aux/other.denominador)*other.numerador), aux)
  end
  def - (other)
  	#Resta de dos objetos tipo numero fraccionario
  	aux = mcm(@denominador, other.denominador)
	Numero_Fraccionario.new(((aux/other.denominador)*other.numerador)-((aux/@denominador)*@numerador), aux)
  end
  def * (other)
  	#Multiplicación de dos objetos tipo numero fraccionario
  	Numero_Fraccionario.new((@numerador * other.numerador),(@denominador * other.denominador))
  end
  def / (other)
  	#División de dos objetos tipo numero fraccionario
  	Numero_Fraccionario.new((@numerador * other.denominador),(@denominador * other.numerador))
  end
  def simplificar
  	#Simplificación de un numero fraccionario (objeto)
  	aux = mcd(@numerador,@denominador)
  	Numero_Fraccionario.new(@numerador/aux, @denominador/aux)
  end
  def igual_que (other)
  	#Comparador de igualdad entre dos objetos de tipo numero fraccionario
  	if @denominador == other.denominador and @numerador == other.numerador
  		true
  	else
  		false
  	end
  end
  def distinto_que (other)
  	#Comparador de distinto entre dos objetos de tipo numero fraccionario
  	if @denominador == other.denominador and @numerador == other.numerador
  		false
  	else
  		true
  	end
  end
  def menor_que (other)
  	#Comparador de menor que entre dos objetos de tipo numero fraccionario
  	if @denominador > other.denominador || (@denominador == other.denominador and @numerador < other.numerador)
  		true
	else
		false
	end
  end
  def mayor_que (other)
  	#Comparador de mayor que entre dos objetos de tipo numero fraccionario
	if !menor_que(other) and !igual_que(other)
		true
	else
		false
	end
  end
  def -@
    	Numero_Fraccionario.new(@numerador*-1,@denominador)
  end
  def *(value)
    	Numero_Fraccionario.new(@numerador*value.to_i,@denominador)  
  end
end
