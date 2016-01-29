require 'spec_helper'
require 'referencia'

describe Referencia do
  before :each do
    # Defino los valores que tomarán los atributos primero y luego le paso las variables al constructor del objeto Referencia
    # Por conveniencia, el valor V es igual a Vacio, es decir: si un atributo tiene el valor V es como si no tuviera nada
    autores = [ 'Dave Thomas', 'Andy Hunt', 'Chad Fowler' ]
    titulo = 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide'
    serie = '(The Facets of Ruby)'
    editorial = 'Pragmatic Bookshelf'
    edicion = '4 edition'
    fecha_publicacion = 'July 7, 2013'
    isbn = [ 'ISBN-13: 978-1937785499', 'ISBN-10: 1937785491']
    
    # Creo el objeto r1 de la clase Referencia
    @r1 = Referencia.new(autores, titulo, serie, editorial, edicion, fecha_publicacion, isbn)
  end
  
  describe "# Creación correcta del objeto tipo Referencia" do
    it "Debe crearse el objeto correctamente" do
      @r1.should be_an_instance_of Referencia
    end
  end
  
  describe "# Almacenamiento correcto de los atributos" do
    it "Debe existir uno o más autores" do
      @r1.get_autores.length.should_not be 0
    end
    it "Debe existir un título" do
      @r1.get_titulo.should_not be 'V'
    end
    it "Debe existir una serie" do
      @r1.get_serie.should_not be 'V'
    end
    it "Debe existir una editorial" do
      @r1.get_serie.should_not be 'V'
    end
    it "Debe existir un número de edición" do
      @r1.get_numero_edicion.should_not be 'V'
    end
    it "Debe existir una fecha de publicación" do
      @r1.get_fecha_publicacion.should_not be 'V'
    end
    it "Debe existir uno o más números ISBN" do
      @r1.get_isbn.length.should_not be 0
    end
  end
  
  describe "# Existen los métodos de obtención de los atributos" do
    it "Existe un método para obtener el listado de autores" do
      @r1.respond_to?(:get_autores).should be true
    end
    it "Existe un método para obtener el título" do
      @r1.respond_to?(:get_titulo).should be true
    end
    it "Existe un método para obtener la serie" do
      @r1.respond_to?(:get_serie).should be true
    end
    it "Existe un método para obtener la editorial" do
      @r1.respond_to?(:get_editorial).should be true
    end
    it "Existe un método para obtener el número de edición" do
      @r1.respond_to?(:get_numero_edicion).should be true
    end
    it "Existe un método para obtener la fecha de publicación" do
      @r1.respond_to?(:get_fecha_publicacion).should be true
    end
    it "Existe un método para obtener el listado de números ISBN" do
      @r1.respond_to?(:get_isbn).should be true
    end
    it "Existe un método para obtener la referencia formateada" do
      @r1.respond_to?(:get_referencia_formateada).should be true
    end
    
  end
end
