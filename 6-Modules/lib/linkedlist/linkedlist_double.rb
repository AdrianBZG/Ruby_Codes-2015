require "linkedlist/version"
require "linkedlist/nodo_double"
require "linkedlist/linkedlist"

module Linkedlist_Double

  #Clase Lista doblemente enlazada
  class Lista_Double < Linkedlist::Lista
    include Enumerable
    attr_accessor :ultimo
  
    def initialize()
        @longitud = 0
        @primero = Node_Double::Nodo_Double.new("HEAD")
        @ultimo = Node_Double::Nodo_Double.new("TAIL")
        @primero.sig = @ultimo
        @ultimo.ant = @primero
    end
    
    def tail()
       nodo_tail = @primero.sig
       return nodo_tail.val
    end
    
    def head()
       nodo_head = @ultimo.ant
       return nodo_head.val
    end
  
    # Añade un valor al final de la lista
    # Devuelve 'self' es decir, el objeto tipo Lista que llama a 'push'
    def push(value)
        node = Node_Double::Nodo_Double.new(value)
        nodo_final = @ultimo
        
        nodo_final.ant.sig = node
        node.ant = nodo_final.ant
        node.sig = nodo_final
        nodo_final.ant = node
        
        @longitud += 1
        return self
    end
    
    # Elimina el último elemento de la lista
    # y devuelve el valor (value) de dicho elemento
    def pop
        raise "Lista vacia" if @longitud < 1
        nodo_actual = @ultimo
        devolver = @ultimo.ant.val
        
        @ultimo.ant = nodo_actual.ant
        nodo_actual.ant.sig = @ultimo
        
        @longitud -= 1
        return devolver
    end
    
    # Elimina el primer elemento de la lista
    # y devuelve su valor
    def shift
        raise "Lista vacia" if @longitud < 1
        devolver = @primero.sig.val
        @primero.sig.sig.ant = @primero
        @primero.sig = @primero.sig.sig
        @longitud -= 1
        return devolver
    end
    
    # Añade un nodo al principio de la lista
    # y devuelve al objeto llamante, de la clase Lista
    def unshift(value)
        node = Node_Double::Nodo_Double.new(value, @primero.sig)
        @primero.sig.ant = node
        @primero.sig = node
        node.ant = @primero
        @longitud += 1
        return self
    end
    
    # Añade un conjunto de valores a la lista, pasado por array
    # y devuelve al objeto llamante, de la clase Lista
    def push_array(*items)
        @longitud = @longitud+items.length
        @primero = Node_Double::Nodo_Double.new(items.shift)
        items.each { |item| self.push(item) }
    end
    #
    
    def [](indice)
		if !indice.between?(0, longitud)
			raise RuntimeError, "Indice erroneo"
		end
		if(indice < longitud/2)
			# Llegamos antes mirando desde la cabeza
			nodo_actual = @primero.sig
			while (!nodo_actual.nil? && indice != 0)
				nodo_actual = nodo_actual.sig
				indice-=1
			end
			return nodo_actual.val
		else
			# Llegamos antes mirando desde la cola
			nodo_actual = @ultimo.ant
			indice = longitud-indice-1
			while (!nodo_actual.nil? && indice != 0)
				nodo_actual = nodo_actual.ant
				indice-=1
			end
			return nodo_actual.val
		end
    end
    
    #Enumerable
    def each
        return nil if @primero.sig.nil?
        entrada = @primero.sig
        until entrada.sig.nil?
            yield entrada.val
            entrada = entrada.sig
        end
    end
  end
  #
end
