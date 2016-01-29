require "linkedlist/version"

module Publicacion
  # Clase Publicacion
  class Pub
    #Se tiene acceso de lectura y escritura a todos los atributos
    attr_accessor :autor, :titulo
    def initialize(autor, titulo)
  	    @autor, @titulo = autor, titulo
    end
  
    def que_soy
      # Devuelve un texto
      "Soy una Publicacion"
    end
  end
  #
  
  # Clase Articulo de Revista
  class ArticuloRevista < Pub
  
    def que_soy
      # Devuelve un texto
      "Soy un Articulo de Revista"
    end
  end
  #
  
  # Clase Articulo de Periodico
  class ArticuloPeriodico < Pub
  
    def que_soy
      # Devuelve un texto
      "Soy un Articulo de Periodico"
    end
  end
  ##
  
  # Clase Documento Electronico
  class DocumentoElectronico < Pub
  
    def que_soy
      # Devuelve un texto
      "Soy un Documento Electronico"
    end
  end
  #
  
  
end
