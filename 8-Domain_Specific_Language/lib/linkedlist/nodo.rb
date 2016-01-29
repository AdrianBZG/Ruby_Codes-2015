require 'linkedlist/version'

module Node
  # Clase Nodo
  class Nodo
    attr_accessor :val, :sig

    def initialize(value, siguiente = nil)
      @val = value
      @sig = siguiente
    end
  end
  #
end
