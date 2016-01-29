require 'spec_helper'

describe Linkedlist do
  before :each do
    # Creo los objetos que harán falta en las expectativas

    # Creo el objeto n1 de la clase Nodo
    @n1 = Node_Double::Nodo_Double.new('Hola')

    # Creo el objeto l1 de la clase Lista
    @l1 = Linkedlist_Double::Lista_Double.new
    @l1.push('Prueba1')
    @l1.push('Prueba2')

    # Creo el objeto l2 de la clase Lista
    @l2 = Linkedlist_Double::Lista_Double.new
    @l2.push('Dave Thomas, Andy Hunt, Chad Fowler. Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide. (The Facets of Ruby). Pragmatic Bookshelf; 4 edition (July 7, 2013). ISBN-13: 978-1937785499. ISBN-10: 1937785491.')
    @l2.push('Scott Chacon. Pro Git 2009th Edition. (Pro). Apress; 2009 edition (August 27, 2009). ISBN-13: 978-1430218333. ISBN-10: 1430218339.')
    @l2.push('David Flanagan, Yukihiro Matsumoto. The Ruby Programming Language. OReilly Media; 1 edition (February 4, 2008). ISBN-10: 0596516177. ISBN-13: 978-0596516178.')
    @l2.push('David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy. The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby). Pragmatic Bookshelf; 1 edition (December 25, 2010). ISBN-10: 1934356379. ISBN-13: 978-1934356371.')
    @l2.push('Richard E. Silverman. Git Pocket Guide OReilly Media; 1 edition (August 2, 2013). ISBN-10: 1449325866.ISBN-13: 978-1449325862.')

    ################################################
    # Creo el objeto l2 de la clase Lista

    @l3 = Linkedlist_Double::Lista_Double.new
    # Creo el objeto r1 de la clase Referencia
    @fecha = Date.new(2015, 2, 3)
    @r1 = Ref::Referencia.new(['Albert Rivera'], 'Mi Titulo', @fecha, 9999, 'Editorial', 1, 1)
    @r2 = Ref::Referencia.new(['Pablo Iglesias'], 'Mi Titulo', @fecha, 9999, 'Editorial', 1, 1)
    @r3 = Ref::Referencia.new(['Albert Rivera', 'Pablo Iglesias'], 'Mi Titulo', @fecha, 9999, 'Editorial', 1, 1)
    @fecha1 = Date.new(2000, 2, 3)
    @fecha2 = Date.new(2015, 2, 3)
    @r4 = Ref::Referencia.new(['Pablo Iglesias'], 'Mi Titulo', @fecha1, 9999, 'Editorial', 1, 1)
    @r5 = Ref::Referencia.new(['Pablo Iglesias'], 'Mi Titulo', @fecha2, 9999, 'Editorial', 1, 1)

    # Añado los objetos tipo Referencia a la Lista
    @l3.push(@r1)
    @l3.push(@r2)
    @l3.push(@r3)
    @l3.push(@r4)
    @l3.push(@r5)
    ################################################

    # Objetos necesarios para probar la jerarquia de clases (Libro, Publicaciones -> ArtRevista, ArtPeriodico, DocElectronico)
    @libro1 = Book::Libro.new(['Fulanito Cabrero'], 'Titulo del libro', Date.new(2001, 4, 1), 9999, 'Editorial', 1, 1)
    @artrevista1 = Publicacion::ArticuloRevista.new(['Menganito Rodriguez'], 'Titulo del articulo de revista', Date.new(2002, 4, 1))
    @artperiodico1 = Publicacion::ArticuloPeriodico.new(['Pepito Gonzalez'], 'Titulo del articulo de periodico', Date.new(2003, 11, 12))
    @docelectronico1 = Publicacion::DocumentoElectronico.new(['Antonio Lopez'], 'Titulo del documento electronico', Date.new(2004, 1, 1))
    #
  end

  describe 'Nodo' do
    it '#Debe existir un Nodo de la lista con sus datos y su siguiente' do
      expect(@n1).to have_attributes(val: 'Hola', sig: nil)
    end
  end

  describe 'Lista' do
    it '#Se extrae el ultimo elemento de la lista' do
      expect(@l1.pop).to eq 'Prueba2'
    end
    it '#Se extrae el primer elemento de la lista' do
      expect(@l1.shift).to eq 'Prueba1'
    end
    it '#Se puede insertar un elemento al final de la lista' do
      expect(@l1.respond_to?(:push)).to be true
    end
    it '#Se puede insertar un elemento al principio de la lista' do
      expect(@l1.respond_to?(:unshift)).to be true
    end
    it '#Se pueden insertar varios elementos' do
      expect(@l1.respond_to?(:push_array)).to be true
    end
    it '#Debe existir una Lista con su cabeza' do
      expect(@l1.primero.val).to eq 'HEAD'
    end
    it '#Debe existir una Lista con su cola' do
      expect(@l1.ultimo.val).to eq 'TAIL'
    end
  end

  describe 'Expectativas de referencias bibliograficas sin clase Referencia' do
    it '#Funciona correctamente la extraccion de las referencias de la lista sin usar la clase Referencia' do
      expect(@l2.shift).to eq 'Dave Thomas, Andy Hunt, Chad Fowler. Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide. (The Facets of Ruby). Pragmatic Bookshelf; 4 edition (July 7, 2013). ISBN-13: 978-1937785499. ISBN-10: 1937785491.'
      expect(@l2.shift).to eq 'Scott Chacon. Pro Git 2009th Edition. (Pro). Apress; 2009 edition (August 27, 2009). ISBN-13: 978-1430218333. ISBN-10: 1430218339.'
      expect(@l2.shift).to eq 'David Flanagan, Yukihiro Matsumoto. The Ruby Programming Language. OReilly Media; 1 edition (February 4, 2008). ISBN-10: 0596516177. ISBN-13: 978-0596516178.'
      expect(@l2.shift).to eq 'David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy. The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby). Pragmatic Bookshelf; 1 edition (December 25, 2010). ISBN-10: 1934356379. ISBN-13: 978-1934356371.'
      expect(@l2.shift).to eq 'Richard E. Silverman. Git Pocket Guide OReilly Media; 1 edition (August 2, 2013). ISBN-10: 1449325866.ISBN-13: 978-1449325862.'
    end
  end
  describe 'Expectativas de la jerarquia de clases' do
    it '#Libro1 es de la clase Libro' do
      expect(@libro1.instance_of? Book::Libro).to be true
    end
    it '#Artrevista1 es de la clase ArticuloRevista y es una Publicacion' do
      expect(@artrevista1.instance_of? Publicacion::ArticuloRevista).to be true
      expect(@artrevista1.is_a? Publicacion::Pub).to be true
    end
    it '#Artperiodico1 es de la clase ArticuloPeriodico y es una Publicacion' do
      expect(@artperiodico1.instance_of? Publicacion::ArticuloPeriodico).to be true
      expect(@artperiodico1.is_a? Publicacion::Pub).to be true
    end
    it '#Docelectronico1 es de la clase DocumentoElectronico y es una Publicacion' do
      expect(@docelectronico1.instance_of? Publicacion::DocumentoElectronico).to be true
      expect(@docelectronico1.is_a? Publicacion::Pub).to be true
    end
  end
  describe 'Expectativas para probar la funcion sobrecargada que_soy' do
    it '#Libro1 dice que es un Libro' do
      expect(@libro1.que_soy).to eq 'Soy un Libro'
    end
    it '#Artrevista1 dice que es un Articulo de Revista' do
      expect(@artrevista1.que_soy).to eq 'Soy un Articulo de Revista'
    end
    it '#Artperiodico1 dice que es un Articulo de Periodico' do
      expect(@artperiodico1.que_soy).to eq 'Soy un Articulo de Periodico'
    end
    it '#Docelectronico1 dice que es un Documento Electronico' do
      expect(@docelectronico1.que_soy).to eq 'Soy un Documento Electronico'
    end
  end

  describe 'Se compara referencias correctamente' do
    it 'Ordenar en base al autor' do
      expect(@r2 < @r1).to be false # Rivera < Iglesias? false
    end
    it 'Si los autores coiniciden, ordenar en base a la fecha (mas antiguo primero)' do
      expect(@r4 < @r5).to be true # 2000 < 2015? true
      expect(@r5 < @r4).to be false # 2015 < 2000? false
    end
    it 'Si los autores y las fechas coinciden, ordenar usando el titulo' do
      expect(@r4 < @r5).to be true # A < Z? true
      expect(@r5 < @r4).to be false # A < Z? true
    end
    it 'Si son iguales, devolvemos un false' do
      expect(@r1 < @r1).to be false # A < A? false
      expect(@r1 > @r1).to be false # A > A? false
      expect(@r1 == @r1).to be true # A == A? true
    end
  end

  context '# Haciendo la lista doblemente enlazada enumerable' do
    before :each do
      @lista1 = Linkedlist_Double::Lista_Double.new
      @lista1.push(1)
      @lista1.push(2)
      @lista1.push(3)
      @lista1.push(4)
      @lista1.push(5)
      @lista2 = Linkedlist_Double::Lista_Double.new
    end
    it 'Acceder a un elemento mediante un indice' do
      expect(@lista1[2].to_s).to eq('3')
      expect(@lista1[1].to_s).to eq('2')
    end
    it 'Lanzar excepcion en caso de un indice erroneo' do
      expect { @lista1[10] }.to raise_error(RuntimeError, 'Indice erroneo')
      expect { @lista1[-1] }.to raise_error(RuntimeError, 'Indice erroneo')
    end
    it 'Comprobando el metodo any?' do
      expect(@lista1.any?).to eq(true)
      expect(@lista2.any?).to eq(false)
    end
    it 'Comprobando el metodo count' do
      expect(@lista1.count).to eq(5)
    end
    it 'Comprobando el metodo max' do
      expect(@lista1.max).to eq(5)
    end
    it 'Comprobando el metodo min' do
      expect(@lista1.min).to eq(1)
    end
    it 'Comprobando el metodo sort' do
      expect(@lista1.sort).to eq([1, 2, 3, 4, 5])
    end
    it 'Guardar los elementos de la lista uno por uno en un vector' do
      str = '['
      @lista1.each do|i|
        str << i.to_s << ', '
      end
      str << ']'
      expect(str).to eq('[1, 2, 3, 4, 5, ]')
    end
  end
end
