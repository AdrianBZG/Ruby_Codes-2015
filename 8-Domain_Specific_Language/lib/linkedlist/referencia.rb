require 'linkedlist/version'
require 'date'

module Ref
  # Clase Referencia
  class Referencia
    include Comparable
    # Se tiene acceso de lectura y escritura a todos los atributos
    attr_accessor :titulo, :autores, :fec, :pa, :an, :edit, :edic, :vol
    def initialize(titulo, &block)
      # Comprobamos tipo
      fail ArgumentError, 'El titulo no es un string' unless titulo.is_a?(String)
      #
      
      #Evaluamos el bloque
      instance_eval &block
      #
      
      #Creamos variables con los valores que recibimos del bloque
      #
      @titulo = @tit
      
      autores = []
      autores.push(@aut)
      
      @pa = @pais
      @an = @anio
      #
      

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
      fail ArgumentError, 'El pais no es string o nulo' unless pa.nil? || pa.is_a?(String)
      #

      aux2 = @titulo.split(/\W+/)
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

      # Asignamos pais
      @pa = @pais
      #

      # Compruebo tipo
      fail ArgumentError, 'Anio debe ser un entero' unless an.is_a?(Integer)
      @fec = Date.new(@an, 1, 1)
      #

      # Asignamos los valores
      @edit = @editorial
      @edic = @edicion
      @vol = @volumen
      #
      
      # Compruebo tipo
      fail ArgumentError, 'La editorial no es una cadena de caracteres' unless edit.is_a?(String)
      fail ArgumentError, 'La edicion no es un entero' unless edic.is_a?(Integer)
      fail ArgumentError, 'El volumen no es un entero' unless vol.is_a?(Integer)
      #
      #Pruebas de creación - Debug
      #puts(@titulo)
      #puts(@autores)
      #puts(@fec)
      #puts(@pa)
      #puts(@an)
      #puts(@edit)
      #puts(@edic)
      #puts(@vol)
      #
    end # Fin constructor

    #Accesores
    def author(entrada)
      @aut = entrada
    end
    
    def title(entrada)
      @tit = entrada
    end
    
    def pais(entrada)
      @pais = entrada
    end
    
    def anio(entrada)
      @anio = entrada
    end
    
    def editorial(entrada)
      @editorial = entrada
    end
    
    def edicion(entrada)
      @edicion = entrada
    end
    
    def volumen(entrada)
      @volumen = entrada
    end
    #
    def <=>(other)
      if @autores == other.autores
        if @fec == other.fec
          if @titulo == other.titulo # Iguales
            return 0
          else
            aux = [@titulo, other.titulo]
            aux.sort_by!(&:downcase)
            return -1 if aux.first == @titulo
            return 1
            end
        elsif fec > other.fec
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
  ##
end
