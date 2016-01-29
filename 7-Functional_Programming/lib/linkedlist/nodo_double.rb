require 'linkedlist/version'
require 'linkedlist/nodo'

module Node_Double
  # Clase Nodo Doble
  class Nodo_Double < Node::Nodo
    include Comparable
    attr_accessor :ant
  end
  #

  def <=>(other)
    return nil unless other.instance_of? Nodo_Double
    @val <=> other.val
  end

  def ==(other)
    if other.is_a? Nodo_Double
      @val == other.val
    else
      false
    end
  end
end
