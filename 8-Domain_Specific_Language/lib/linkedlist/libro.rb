require 'linkedlist/version'
require 'date'

module Book
  # Clase Libro del modulo Book
  #
  class Libro
    # Se tiene acceso de lectura y escritura a todos los atributos
    attr_accessor :autores, :titulo, :fecha, :pais, :anio, :editorial, :edicion, :volumen
    def initialize(autores, titulo, fecha, pais = nil, anio, editorial, edicion, volumen)
      fail ArgumentError, 'Autores no es un Array' unless autores.is_a?(Array)
      cadena = ''
      autores.each do |au|
        fail ArgumentError, 'Uno de los autores no es un string' unless au.is_a?(String)
        fail ArgumentError, 'Se especifica unicamente el nombre o el apellido' unless au.split(/\W+/).length > 1
        aux = au.split(/\W+/)
        cadena += aux[1]
        cadena += ', '
        unless aux[2].nil?
          cadena += aux[2][0]
          cadena += '. '
        end
        cadena += aux[0][0]
        cadena += '.'
        cadena += ' & ' unless au == autores.last
      end

      fail ArgumentError, 'El titulo no es un string' unless titulo.is_a?(String)
      fail ArgumentError, 'La fecha no es de tipo Date' unless fecha.is_a?(Date)
      fail ArgumentError, 'El pais no es string o nulo' unless pais.nil? || pais.is_a?(String)

      @autores = cadena

      aux2 = titulo.split(/\W+/)
      aux2.each do |aux3|
        if aux3.length > 3
          aux3.capitalize!
        else
          aux3.downcase!
        end
      end

      @titulo = aux2.join(' ')

      @fecha = fecha
      @pais = pais

      #Comprobación de tipo
      fail ArgumentError, 'Anio debe ser un entero' unless anio.is_a?(Integer)
      fecha = Date.new(anio, 1, 1)
      fail ArgumentError, 'La editorial no es una cadena de caracteres' unless editorial.is_a?(String)
      fail ArgumentError, 'La edicion no es un entero' unless edicion.is_a?(Integer)
      fail ArgumentError, 'El volumen no es un entero' unless volumen.is_a?(Integer)
      #
      
      #Asignación de valores
      @editorial = editorial
      @edicion = edicion
      @volumen = volumen
      #
    end

    def <=>(other)
      if @autores == other.autores
        if @fecha == other.fecha
          if @titulo == other.titulo #Iguales
            return 0
          else
            vector = [@titulo, other.titulo]
            vector.sort_by!(&:downcase)
            return -1 if vector.first == @titulo
            return 1
          end
        elsif fecha > other.fecha
          return 1
        else
          return -1
        end
      else
        vector = [@autores, other.autores]
        vector.sort_by!(&:downcase)
        return 1 if vector.first == @autores
        return -1
      end
    end

    def que_soy
      # Devuelve un texto
      'Soy un Libro'
    end
  end
  #
end
