require 'spec_helper'

describe Linkedlist do
  before :each do
    # Creo los objetos que harán falta en las expectativas

    # Creo el objeto n1 de la clase Nodo
    @n1 = Node_Double::Nodo_Double.new("Hola")
    
    # Creo el objeto l1 de la clase Lista
    @l1 = Linkedlist_Double::Lista_Double.new()
    @l1.push("Prueba1")
    @l1.push("Prueba2")
    
    # Creo el objeto l2 de la clase Lista
    @l2 = Linkedlist_Double::Lista_Double.new()
    @l2.push("Dave Thomas, Andy Hunt, Chad Fowler. Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby). Pragmatic Bookshelf; 4 edition (July 7, 2013). ISBN-13: 978-1937785499. ISBN-10: 1937785491.")
    @l2.push("Scott Chacon. Pro Git 2009th Edition. (Pro). Apress; 2009 edition (August 27, 2009). ISBN-13: 978-1430218333. ISBN-10: 1430218339.")
    @l2.push("David Flanagan, Yukihiro Matsumoto. The Ruby Programming Language. O’Reilly Media; 1 edition (February 4, 2008). ISBN-10: 0596516177. ISBN-13: 978-0596516178.")
    @l2.push("David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy. The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby). Pragmatic Bookshelf; 1 edition (December 25, 2010). ISBN-10: 1934356379. ISBN-13: 978-1934356371.")
    @l2.push("Richard E. Silverman. Git Pocket Guide O’Reilly Media; 1 edition (August 2, 2013). ISBN-10: 1449325866.ISBN-13: 978-1449325862.")
    
    ################################################
    # Creo el objeto l2 de la clase Lista
    
    @l3 = Linkedlist_Double::Lista_Double.new()
    # Creo el objeto r1 de la clase Referencia
    @r1 = Ref::Referencia.new([ 'Dave Thomas, Andy Hunt, Chad Fowler' ], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide', '(The Facets of Ruby)', 'Pragmatic Bookshelf', '4 edition', 'July 7, 2013', [ 'ISBN-13: 978-1937785499', 'ISBN-10: 1937785491'])
    @r2 = Ref::Referencia.new([ 'Scott Chacon' ], 'Pro Git 2009th Edition', '(Pro)', 'Apress', '2009 edition', 'August 27, 2009', [ 'ISBN-13: 978-1430218333', 'ISBN-10: 1430218339'])
    @r3 = Ref::Referencia.new([ 'David Flanagan, Yukihiro Matsumoto' ], 'The Ruby Programming Language', '', 'O’Reilly Media', '1 edition', 'February 4, 2008', [ 'ISBN-10: 0596516177', 'ISBN-13: 978-0596516178'])
    @r4 = Ref::Referencia.new([ 'David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy' ], 'The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends', '(The Facets of Ruby)', 'Pragmatic Bookshelf', '1 edition', 'December 25, 2010', [ 'ISBN-10: 1934356379', 'ISBN-13: 978-1934356371'])
    @r5 = Ref::Referencia.new([ 'Richard E. Silverman' ], 'Git Pocket Guide', '', 'O’Reilly Media', '1 edition', 'August 2, 2013', [ 'ISBN-10: 1449325866', 'ISBN-13: 978-1449325862'])
    
    #Añado los objetos tipo Referencia a la Lista
    @l3.push(@r1)
    @l3.push(@r2)
    @l3.push(@r3)
    @l3.push(@r4)
    @l3.push(@r5)
    ################################################
    
    #Objetos necesarios para probar la jerarquia de clases (Libro, Publicaciones -> ArtRevista, ArtPeriodico, DocElectronico)
    @libro1 = Book::Libro.new('Dave Thomas, Andy Hunt, Chad Fowler','Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide','(The Facets of Ruby)','Pragmatic Bookshelf','4 edition','July 7, 2013','ISBN-13: 978-1937785499, ISBN-10: 1937785491')
    @publicacion1 = Publicacion::Pub.new('Pedro','Libro1')
    @artrevista1 = Publicacion::ArticuloRevista.new('Manuel','ArtRevista1')
    @artperiodico1 = Publicacion::ArticuloPeriodico.new('Antonio','ArtPeriodico1')
    @docelectronico1 = Publicacion::DocumentoElectronico.new('Aitor','DocElectronico1')
    #
    
  end
  
  describe "Nodo" do
    it "#Debe existir un Nodo de la lista con sus datos y su siguiente" do
      expect(@n1).to have_attributes(:val => "Hola", :sig => nil)
    end
  end
  
  describe "Lista" do
    it "#Se extrae el último elemento de la lista" do
      expect(@l1.pop).to eq "Prueba2"
    end
    it "#Se extrae el primer elemento de la lista" do
      expect(@l1.shift).to eq "Prueba1"
    end
    it "#Se puede insertar un elemento al final de la lista" do
      expect(@l1.respond_to?(:push)).to be true
    end
    it "#Se puede insertar un elemento al principio de la lista" do
      expect(@l1.respond_to?(:unshift)).to be true
    end
    it "#Se pueden insertar varios elementos" do
      expect(@l1.respond_to?(:push_array)).to be true
    end
    it "#Debe existir una Lista con su cabeza" do
      expect(@l1.ultimo.val).to eq "HEAD"
    end
    it "#Debe existir una Lista con su cola" do
      expect(@l1.primero.val).to eq "TAIL"
    end
  end
  
  describe "Expectativas de referencias bibliograficas sin clase Referencia" do
    it "#Funciona correctamente la extracción de las referencias de la lista sin usar la clase Referencia" do
      expect(@l2.shift).to eq "Dave Thomas, Andy Hunt, Chad Fowler. Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby). Pragmatic Bookshelf; 4 edition (July 7, 2013). ISBN-13: 978-1937785499. ISBN-10: 1937785491."
      expect(@l2.shift).to eq "Scott Chacon. Pro Git 2009th Edition. (Pro). Apress; 2009 edition (August 27, 2009). ISBN-13: 978-1430218333. ISBN-10: 1430218339."
      expect(@l2.shift).to eq "David Flanagan, Yukihiro Matsumoto. The Ruby Programming Language. O’Reilly Media; 1 edition (February 4, 2008). ISBN-10: 0596516177. ISBN-13: 978-0596516178."
      expect(@l2.shift).to eq "David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy. The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby). Pragmatic Bookshelf; 1 edition (December 25, 2010). ISBN-10: 1934356379. ISBN-13: 978-1934356371."
      expect(@l2.shift).to eq "Richard E. Silverman. Git Pocket Guide O’Reilly Media; 1 edition (August 2, 2013). ISBN-10: 1449325866.ISBN-13: 978-1449325862."
    end
  end
  describe "Expectativas de referencias bibliograficas con clase Referencia" do
    it "#Funciona correctamente la extracción de las referencias de la lista usando la clase Referencia" do
      expect(@l3.shift.get_referencia_formateada).to eq "Dave Thomas, Andy Hunt, Chad Fowler. Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide, 4 edition. Pragmatic Bookshelf, July 7, 2013"
      expect(@l3.shift.get_referencia_formateada).to eq "Scott Chacon. Pro Git 2009th Edition, 2009 edition. Apress, August 27, 2009"
      expect(@l3.shift.get_referencia_formateada).to eq "David Flanagan, Yukihiro Matsumoto. The Ruby Programming Language, 1 edition. O’Reilly Media, February 4, 2008"
      expect(@l3.shift.get_referencia_formateada).to eq "David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy. The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends, 1 edition. Pragmatic Bookshelf, December 25, 2010"
      expect(@l3.shift.get_referencia_formateada).to eq "Richard E. Silverman. Git Pocket Guide, 1 edition. O’Reilly Media, August 2, 2013"
    end
  end
  describe "Expectativas de la jerarquia de clases" do
    it "#Libro1 es de la clase Libro" do
      expect(@libro1.instance_of?Book::Libro).to be true
    end
    it "#Publicacion1 es de la clase Pub" do
      expect(@publicacion1.instance_of?Publicacion::Pub).to be true
    end
    it "#Artrevista1 es de la clase ArticuloRevista y es una Publicacion" do
      expect(@artrevista1.instance_of?Publicacion::ArticuloRevista).to be true
      expect(@artrevista1.is_a?Publicacion::Pub).to be true
    end
    it "#Artperiodico1 es de la clase ArticuloPeriodico y es una Publicacion" do
      expect(@artperiodico1.instance_of?Publicacion::ArticuloPeriodico).to be true
      expect(@artperiodico1.is_a?Publicacion::Pub).to be true
    end
    it "#Docelectronico1 es de la clase DocumentoElectronico y es una Publicacion" do
      expect(@docelectronico1.instance_of?Publicacion::DocumentoElectronico).to be true
      expect(@docelectronico1.is_a?Publicacion::Pub).to be true
    end
  end
  describe "Expectativas para probar la funcion sobrecargada que_soy" do
    it "#Libro1 dice que es un Libro" do
      expect(@libro1.que_soy).to eq "Soy un Libro"
    end
    it "#Publicacion1 dice que es una Publicacion" do
      expect(@publicacion1.que_soy).to eq "Soy una Publicacion"
    end
    it "#Artrevista1 dice que es un Articulo de Revista" do
      expect(@artrevista1.que_soy).to eq "Soy un Articulo de Revista"
    end
    it "#Artperiodico1 dice que es un Articulo de Periodico" do
      expect(@artperiodico1.que_soy).to eq "Soy un Articulo de Periodico"
    end
    it "#Docelectronico1 dice que es un Documento Electronico" do
      expect(@docelectronico1.que_soy).to eq "Soy un Documento Electronico"
    end
  end
end
