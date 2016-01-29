require "linkedlist/version"

module Linkedlist

  #Clase Nodo
  class Nodo
    attr_accessor :val, :sig
  
    def initialize(value, siguiente = nil)
        @val = value
        @sig = siguiente
    end
  end
  #
  
  # Clase Referencia
  class Referencia
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
  end
  #
  
  #Clase Lista
  class Lista
    attr_accessor :primero
    attr_reader :longitud
  
    def initialize()
        @longitud = 0
        @primero = Nodo.new("HEAD")
    end
  
    # Añade un valor al final de la lista
    # Devuelve 'self' es decir, el objeto tipo Lista que llama a 'push'
    def push(value)
        node = Nodo.new(value)
        nodo_actual = @primero
        while nodo_actual.sig != nil
            nodo_actual = nodo_actual.sig
        end
        nodo_actual.sig = node
        @longitud += 1
        return self
    end
    
    # Elimina el último elemento de la lista
    # y devuelve el valor (value) de dicho elemento
    def pop
        raise "Lista vacia" if @longitud < 1
        nodo_actual = @primero
        done = false
        while !done
            if nodo_actual.sig.sig == nil
                done = true
            else
                nodo_actual = nodo_actual.sig
            end
        end
        to_return = nodo_actual.sig.val
        nodo_actual.sig = nil
        @longitud -= 1
        return to_return
    end
    
    # Elimina el primer elemento de la lista
    # y devuelve su valor
    def shift
        raise "Lista vacia" if @longitud < 1
        to_return = @primero.sig.val
        @primero.sig = @primero.sig.sig
        @longitud -= 1
        return to_return
    end
    
    # Añade un nodo al principio de la lista
    # y devuelve al objeto llamante, de la clase Lista
    def unshift(value)
        node = Node.new(value, @primero.sig)
        @primero.sig = node
        @longitud += 1
        return self
    end
    
    # Añade un conjunto de valores a la lista, pasado por array
    # y devuelve al objeto llamante, de la clase Lista
    def push_array(*items)
        @longitud = items.length
        @primero = Nodo.new(items.shift)
        items.each { |item| self.push(item) }
    end
    
    # Métodos push y pop para objetos de tipo Referencia
    def push_referencia(obj)
        node = Nodo.new(obj)
        nodo_actual = @primero
        while nodo_actual.sig != nil
            nodo_actual = nodo_actual.sig
        end
        nodo_actual.sig = node
        @longitud += 1
        return self
    end
    #
  end
  #
end
