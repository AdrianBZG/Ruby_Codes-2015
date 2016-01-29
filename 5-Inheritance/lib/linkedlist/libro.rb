require "linkedlist/version"

module Book

  # Clase Libro del modulo Book
  class Libro
    #Se tiene acceso de lectura y escritura a todos los atributos
    attr_accessor :autores, :titulo, :serie, :editorial, :numero_edicion, :fecha_publicacion, :numeros_isbn
    def initialize(autores, titulo, serie, editorial, numero_edicion, fecha_publicacion, numeros_isbn)
  	    @autores, @titulo, @serie, @editorial, @numero_edicion, @fecha_publicacion, @numeros_isbn = autores, titulo, serie, editorial, numero_edicion, fecha_publicacion, numeros_isbn
    end
  
    def get_referencia_formateada
      # Devuelve la referencia formateada (Estándar IEEE)
      # Este estándar es: Autores, Titulo del libro, Edicion. Lugar de publicación: Editorial, Año de publicación.
      # Omitimos 'Lugar de publicación ya que no lo tenemos'
      "#{@autores[0]}. #{@titulo}, #{@numero_edicion}. #{@editorial}, #{@fecha_publicacion}"
    end
    
    def que_soy
      # Devuelve un texto
      "Soy un Libro"
    end
  end
  #
end
