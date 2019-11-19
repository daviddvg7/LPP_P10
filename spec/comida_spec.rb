require 'spec_helper'
require './lib/comida/clase_comida'
require './lib/comida/lista'

RSpec.describe Comida do
 
  x=Comida::Comida.new("carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
  lentejas=Comida::Comida.new("lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
  cerdo= Comida::Comida.new("cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
  tofu= Comida::Comida.new("tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
  cerveza= Comida::Comida.new("cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
  salmon= Comida::Comida.new("salmón", 19.9, 0.0, 13.6, 6.0, 3.7)

  h=[lentejas, cerdo, tofu, cerveza, cerveza]
  m=[x, salmon]
 

  it "Debe existir un nombre para el alimento" do
    	expect(x.nombre).not_to be nil
  end

  it "Debe existir la candidad de emisión de gases de efecto invernadero en kgCO2eq." do
	expect(x.gases).not_to be nil
  end

  it "Debe existir la candidad de terreno utilizado en m2 año." do
	expect(x.terreno).not_to be nil
  end
	
  it "Existe un método para obtener el nombre del alimento." do
	expect(x.nombre).to eq("carne de vaca")
  end

  it "Existe un método para obtener las emisiones de gases de efecto invernadero." do
	expect(x.gases).to eq(50.0)
  end

  it "Existe un método para obtener el terreno utilizado." do
	expect(x.terreno).to eq(164.0)
  end

  it "Existe un método para obtener el alimento formateado." do
	expect(x.to_s).to eq("El alimento carne de vaca posee 21.1 g de proteínas, 0.0 g de carbohidratos, 3.1 g de lípidos, genera 50.0 kg de CO2 por porción y supone un uso de 164.0 m2 de terreno al año")
  end

  it "Existe un método para obtener el valor energético de un alimento." do
	expect(x.kcal).to eq(112.3)
  end

  it "Se calcula correctamente el impacto ambiental diario de un hombre de 20-39 años (gases)." do
	expect(impacto_hombre_gases(h)).to eq(10.48)
  end

  it "Se calcula correctamente el impacto ambiental diario de un hombre de 20-39 años (terreno)." do
	expect(impacto_hombre_terreno(h)).to eq(17.04)
  end

  it "Se calcula correctamente el impacto ambiental diario de una mujer de 20-39 años (gases)." do
	expect(impacto_mujer_gases(m)).to eq(56.0)
  end

  it "Se calcula correctamente el impacto ambiental diario de una mujer de 20-39 años (terreno)." do
	expect(impacto_mujer_terreno(m)).to eq(167.7)
  end

  def impacto_hombre_gases(h)
	imp=0
	h.each{|elemento| imp=imp+elemento.gases}
	return imp
  end

  def impacto_hombre_terreno(h)
	imp=0
	h.each{|elemento| imp=imp+elemento.terreno}
	return imp
  end

  def impacto_mujer_gases(m)
	imp=0
	m.each{|elemento| imp=imp+elemento.gases}
	return imp
  end

  def impacto_mujer_terreno(m)
	imp=0
	m.each{|elemento| imp=imp+elemento.terreno}
	return imp
  end
end

RSpec.describe Lista do
  nodo1=Nodo.new(5, nil, nil)
  lista=Lista.new()
  vector=[20, 25]
  vector1=[0, 5]

  it " Debe existir un Nodo de la lista con sus datos, su siguiente y su previo" do
    expect(nodo1).not_to be nil
    expect(nodo1).to respond_to(:value)
    expect(nodo1).to respond_to(:next)
    expect(nodo1).to respond_to(:prev)

  end

  it "Debe existir una Lista con su cabeza y su cola" do
    expect(lista).not_to be nil
    expect(lista).to respond_to(:head)
    expect(lista).to respond_to(:tail)

  end

  it "Se puede insertar un elemento en la Lista por la cola" do
    expect(lista.insert_tail(15)).not_to be nil
  end

  it "Se puede insertar un elemento en la Lista por la cabeza" do
    expect(lista.insert_head(10)).not_to be nil
  end

  it "Se pueden insertar varios elementos en la Lista por la cola" do
    expect(lista.inserts_tail(vector)).not_to be nil
  end

  it "Se pueden insertar varios elementos en la Lista por la cabeza" do
    expect(lista.inserts_head(vector1)).not_to be nil
  end

  it "Se extrae el primer elemento de la Lista" do 
    head=lista.pop_head()
    expect(head.value).to eql(0)
  end

  it "Se extrae el último elemento de la Lista" do
    tail=lista.pop_tail()
    expect(tail.value).to eql(25)
  end

end
