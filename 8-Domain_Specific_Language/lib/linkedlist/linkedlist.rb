require 'linkedlist/version'
require 'linkedlist/nodo'

module Linkedlist
  # Clase Lista
  class Lista
    attr_accessor :primero
    attr_reader :longitud

    def initialize
      @longitud = 0
      @primero = Node::Nodo.new('HEAD')
    end

    # Añade un valor al final de la lista
    # Devuelve 'self' es decir, el objeto tipo Lista que llama a 'push'
    def push(value)
      node = Node::Nodo.new(value)
      nodo_actual = @primero
      nodo_actual = nodo_actual.sig until nodo_actual.sig.nil?
      nodo_actual.sig = node
      @longitud += 1
      self
    end

    # Elimina el último elemento de la lista
    # y devuelve el valor (value) de dicho elemento
    def pop
      fail 'Lista vacia' if @longitud < 1
      nodo_actual = @primero
      done = false
      until done
        if nodo_actual.sig.sig.nil?
          done = true
        else
          nodo_actual = nodo_actual.sig
        end
      end
      to_return = nodo_actual.sig.val
      nodo_actual.sig = nil
      @longitud -= 1
      to_return
    end

    # Elimina el primer elemento de la lista
    # y devuelve su valor
    def shift
      fail 'Lista vacia' if @longitud < 1
      to_return = @primero.sig.val
      @primero.sig = @primero.sig.sig
      @longitud -= 1
      to_return
    end

    # Añade un nodo al principio de la lista
    # y devuelve al objeto llamante, de la clase Lista
    def unshift(value)
      node = Node::Nodo.new(value, @primero.sig)
      @primero.sig = node
      @longitud += 1
      self
    end

    # Añade un conjunto de valores a la lista, pasado por array
    # y devuelve al objeto llamante, de la clase Lista
    def push_array(*items)
      @longitud = items.length
      @primero = Node::Nodo.new(items.shift)
      items.each { |item| push(item) }
    end

    # Métodos push y pop para objetos de tipo Referencia
    def push_referencia(obj)
      node = Node::Nodo.new(obj)
      nodo_actual = @primero
      nodo_actual = nodo_actual.sig until nodo_actual.sig.nil?
      nodo_actual.sig = node
      @longitud += 1
      self
    end
    #
  end
  #
end
