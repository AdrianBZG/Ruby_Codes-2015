require 'spec_helper'

describe Linkedlist do
  before :each do
    # Creo los objetos que harán falta en las expectativas
    # Creo el objeto r1 de la clase Referencia
    @r1 = Ref::Referencia.new("Mi Titulo") do
       author "Nombre, Apellido"
       title "titulo"
       pais "Pais"
       anio 2015
       editorial "Editorial"
       edicion 1
       volumen 2
    end
    ##
  end

  describe 'Se compara referencias correctamente' do
    it 'Si son iguales, devolvemos un true' do
      expect(@r1 < @r1).to be false # A < A? false
      expect(@r1 > @r1).to be false # A > A? false
      expect(@r1 == @r1).to be true # A == A? true
    end
  end
  
  describe 'Se crea la referencia correctamente' do
    it 'Autores correctos' do
      expect(@r1.autores).to eq "Apellido, N."
    end
    it 'Titulo correcto' do
      expect(@r1.titulo).to eq "Titulo"
    end
    it 'Pais correcto' do
      expect(@r1.pa).to eq "Pais"
    end
    it 'Anio correcto' do
      expect(@r1.an).to eq 2015
    end
    it 'Editorial correcta' do
      expect(@r1.edit).to eq "Editorial"
    end
    it 'Edicion correcta' do
      expect(@r1.edic).to eq 1
    end
    it 'Volumen correcto' do
      expect(@r1.vol).to eq 2
    end
  end
end
