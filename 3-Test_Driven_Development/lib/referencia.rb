# "Referencia"
# Adrián Rodríguez Bazaga

require "referencia/version"

class Referencia
  #Se tiene acceso de lectura y escritura a todos los atributos
  attr_accessor :autores, :titulo, :serie, :editorial, :numero_edicion, :fecha_publicacion, :numeros_isbn
  def initialize(autores, titulo, serie, editorial, numero_edicion, fecha_publicacion, numeros_isbn)
  	@autores, @titulo, @serie, @editorial, @numero_edicion, @fecha_publicacion, @numeros_isbn = autores, titulo, serie, editorial, numero_edicion, fecha_publicacion, numeros_isbn
  end
  
  def get_autores
      # Devuelve el listado de autores
      @autores
  end
  
  def get_titulo
      # Devuelve el título
      @titulo
  end
  
  def get_serie
      # Devuelve la serie
      @serie
  end
  
  def get_editorial
      # Devuelve la editorial
      @editorial
  end
  
  def get_numero_edicion
      # Devuelve el número de edición
      @numero_edicion
  end
  
  def get_fecha_publicacion
      # Devuelve la fecha de publicación
      @fecha_publicacion
  end
  
  def get_isbn
      # Devuelve el listado de números ISBN
      @numeros_isbn
  end
  
  def get_referencia_formateada
      # Devuelve la referencia formateada (Estándar IEEE)
      # Este estándar es: Autores, Titulo del libro, Edicion. Lugar de publicación: Editorial, Año de publicación.
      # Omitimos 'Lugar de publicación ya que no lo tenemos'
      puts "#{@autores.inspect}, #{@titulo}, #{@numero_edicion}. #{@editorial}, #{@fecha_publicacion}"
  end
end
