require 'linkedlist/version'
require 'date'

module Ref
  # Clase Referencia
  class Referencia
    include Comparable
    # Se tiene acceso de lectura y escritura a todos los atributos
    attr_accessor :autores, :titulo, :fecha, :pais, :anio, :editorial, :edicion, :volumen
    def initialize(autores, titulo, fecha, pais = nil, anio, editorial, edicion, volumen)
      # Comprobamos tipo
      fail ArgumentError, 'Autores debe ser un array' unless autores.is_a?(Array)
      #

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

      @autores = cadena

      # Comprobamos tipos
      fail ArgumentError, 'El titulo no es un string' unless titulo.is_a?(String)
      fail ArgumentError, 'La fecha no es de tipo Date' unless fecha.is_a?(Date)
      fail ArgumentError, 'El pais no es string o nulo' unless pais.nil? || pais.is_a?(String)
      #

      aux2 = titulo.split(/\W+/)
      aux2.each do |aux3|
        if aux3.length > 3
          aux3.capitalize!
        else
          aux3.downcase!
        end
      end

      # Asignamos el titulo formateado
      @titulo = aux2.join(' ')
      #

      # Asignamos fecha y pais
      @fecha = fecha
      @pais = pais
      #

      # Compruebo tipo
      fail ArgumentError, 'Anio debe ser un entero' unless anio.is_a?(Integer)
      fecha = Date.new(anio, 1, 1)
      fail ArgumentError, 'La editorial no es una cadena de caracteres' unless editorial.is_a?(String)
      fail ArgumentError, 'La edicion no es un entero' unless edicion.is_a?(Integer)
      fail ArgumentError, 'El volumen no es un entero' unless volumen.is_a?(Integer)
      #

      # Asignamos los valores
      @editorial = editorial
      @edicion = edicion
      @volumen = volumen
      #
    end # Fin constructor

    def <=>(other)
      if @autores == other.autores
        if @fecha == other.fecha
          if @titulo == other.titulo # Iguales
            return 0
          else
            aux = [@titulo, other.titulo]
            aux.sort_by!(&:downcase)
            return -1 if aux.first == @titulo
            return 1
            end
        elsif fecha > other.fecha
          return 1
        else
          return -1
        end
      else
        aux = [@autores, other.autores]
        aux.sort_by!(&:downcase)
        return 1 if aux.first == @autores
        return -1
        end
  end
  end
  #
end
