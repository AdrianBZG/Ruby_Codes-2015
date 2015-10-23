class Numero_Fraccionario
  attr_reader :numerador, :denominador
  def initialize(numerador, denominador)
    @numerador, @denominador = numerador, denominador
  end
  def to_s
    "#{@x}/#{@y}"
  end
end