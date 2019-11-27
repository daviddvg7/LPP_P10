require 'spec_helper'
require './lib/comida/clase_comida'
require './lib/comida/lista'
require './lib/comida/plato'


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

  carne_de_vaca=Comida::Comida.new("carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
  carne_cordero= Comida::Comida.new("carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
  camarones=Comida::Comida.new("camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
  chocolate= Comida::Comida.new("chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
  salmon= Comida::Comida.new("salmón", 19.9, 0.0, 13.6, 6.0, 3.7)
  cerdo= Comida::Comida.new("cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
  pollo=Comida::Comida.new("pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
  queso=Comida::Comida.new("queso", 25.0, 1.3, 33.0, 11.0, 41.0)
  cerveza= Comida::Comida.new("cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
  leche= Comida::Comida.new("leche", 3.3, 4.8, 3.2, 3.2, 8.9)
  huevo=Comida::Comida.new("huevo", 13.0, 1.1, 11.0, 4.2, 5.7)
  cafe=Comida::Comida.new("cafe", 0.1, 0.0, 0.0, 0.4, 0.3)
  tofu= Comida::Comida.new("tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
  lentejas= Comida::Comida.new("lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
  nuez=Comida::Comida.new("nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
  
  d_espanola=[carne_de_vaca, chocolate, queso, queso, lentejas, nuez, nuez]
  d_vasca=[lentejas, lentejas, lentejas, lentejas, lentejas, chocolate, chocolate, nuez, lentejas]
  d_vegetaria=[huevo, chocolate, queso, queso, lentejas, nuez, nuez]
  d_vegetaliana= [tofu, chocolate, nuez, lentejas, lentejas, nuez, nuez]
  d_locura=[carne_de_vaca, carne_de_vaca, carne_cordero, carne_cordero, carne_cordero, pollo, pollo, cerdo, cerdo, nuez, nuez, salmon]

  espanola=Lista.new()
  espanola.inserts_tail(d_espanola)
  vasca=Lista.new()
  vasca.inserts_tail(d_vasca)
  vegetaria=Lista.new()
  vegetaria.inserts_tail(d_vegetaria)
  vegetaliana=Lista.new()
  vegetaliana.inserts_tail(d_vegetaliana)
  locura=Lista.new()
  locura.inserts_tail(d_locura)

  context "Probando getters" do
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
  end

  context "Probando inserciones" do 
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
  end

  context "Probando extracciones" do
    it "Se extrae el primer elemento de la Lista" do 
      head=lista.pop_head()
      expect(head.value).to eql(0)
    end

    it "Se extrae el último elemento de la Lista" do
      tail=lista.pop_tail()
      expect(tail.value).to eql(25)
    end
  end

  context "Probando dietas" do
    it "Crear expectativas para estimar las emisiones diarias de gases de efecto invernadero para cada dieta." do
      expect(espanola.gases()).to eql(75.3)
      expect(vasca.gases()).to eql(7.3)
      expect(vegetaria.gases()).to eql(29.5)
      expect(vegetaliana.gases()).to eql(6.0)
      expect(locura.gases()).to eql(193.2)
    end

    it "Crear expectativa para estimar las emisiones anuales de gases de efecto invernadero para cada dieta." do
      expect(espanola.gases_anual()).to eql(27484.5)
      expect(vasca.gases_anual()).to eql(2664.5)
      expect(vegetaria.gases_anual()).to eql(10767.5)
      expect(vegetaliana.gases_anual()).to eql(2190.0)
      expect(locura.gases_anual()).to eql(70518.0)
    end

    it "Crear expectitivas para estimar los metros cuadrados de uso de terreno para cada dieta." do
      expect(espanola.terreno()).to eql(268.6)
      expect(vasca.terreno()).to eql(35.1)
      expect(vegetaria.terreno()).to eql(110.3)
      expect(vegetaliana.terreno()).to eql(36.1)
      expect(locura.terreno()).to eql(938.7)
    end
  end

end

RSpec.describe Comida do

  carne_de_vaca=Comida::Comida.new("carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
  carne_cordero= Comida::Comida.new("carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
  camarones=Comida::Comida.new("camarones", 17.6, 1.5, 0.6, 18.0, 2.0)


  it "Comparaciones" do
   
    expect(carne_de_vaca < carne_cordero).to eq(true)
    expect(carne_de_vaca <= carne_cordero).to eq(true)

    expect(carne_de_vaca > carne_cordero).to eq(false)
    expect(carne_de_vaca >= carne_cordero).to eq(false)

    expect(carne_de_vaca == carne_de_vaca). to eq(true)

    expect(carne_de_vaca.between?(camarones, carne_cordero)).to eq(true)
    expect(camarones.clamp(carne_de_vaca, carne_cordero)).to eq(carne_de_vaca)
  end
end   

RSpec.describe Lista do

  carne_de_vaca=Comida::Comida.new("carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
  carne_cordero= Comida::Comida.new("carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
  camarones=Comida::Comida.new("camarones", 17.6, 1.5, 0.6, 18.0, 2.0)

  comida=[carne_de_vaca, carne_cordero, camarones]
  prueba=Lista.new()
  prueba.inserts_tail(comida)

  it "Enumeraciones" do
    expect(prueba.collect{|n| n.proteinas>20}).to eq([true, false, false])
    expect(prueba.select{|i| i.proteinas>20}).to eq([carne_de_vaca])
    expect(prueba.max).to eq(carne_cordero)
    expect(prueba.min).to eq(camarones)
    expect(prueba.sort).to eq([camarones, carne_de_vaca, carne_cordero])
  end
end 

RSpec.describe Plato do

  carne_cordero= Comida::Comida.new("carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
  huevo=Comida::Comida.new("huevo", 13.0, 1.1, 11.0, 4.2, 5.7)
  cerveza= Comida::Comida.new("cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)

  
  ejemplo=[carne_cordero, huevo, cerveza]
  ejemplo_gramos=[82.3, 16.2, 89.0]
  lista=Lista.new()
  lista.inserts_tail(ejemplo)
  lista_gramos=Lista.new()
  lista_gramos.inserts_tail(ejemplo_gramos)

  plato=Plato.new("prueba", lista, lista_gramos)

  
  context "Pruebas de la clase Plato" do
    it "Se obtiene el nombre del plato" do
      expect(plato.nombre).to eq("prueba")
    end

    it "Existe un conjunto de alimentos" do
      expect(plato).to respond_to(:alimentos)
    end

    it "Existe un conjunto de cantidades de alimentos" do
      expect(plato).to respond_to(:cantidades)
    end

    it "Porcentaje de proteínas" do
      expect(plato.get_proteinas).to eq("0.9%")
    end

    it "Porcentaje de lípidos" do
      expect(plato.get_lipidos).to eq("0.8%")
    end

    it "Porcentaje de hidratos" do
      expect(plato.get_carbos).to eq("0.2%")
    end

    it "Valor Calórico Total" do
      expect(plato.get_kcal).to eq(22.5)
    end

    it "Se obtiene el plato formateado" do
      expect(plato.to_s).to eq("El plato prueba está compuesto de 82.3 g de carne de cordero, 16.2 g de huevo, y 89.0 g de cerveza.")
    end
  end
end

RSpec.describe Plato_hijo do

  carne_cordero= Comida::Comida.new("carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
  huevo=Comida::Comida.new("huevo", 13.0, 1.1, 11.0, 4.2, 5.7)
  cerveza= Comida::Comida.new("cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)

  
  ejemplo=[carne_cordero, huevo, cerveza]
  ejemplo_gramos=[82.3, 16.2, 89.0]
  lista=Lista.new()
  lista.inserts_tail(ejemplo)
  lista_gramos=Lista.new()
  lista_gramos.inserts_tail(ejemplo_gramos)

  plato2=Plato_hijo.new("prueba2", lista, lista_gramos)

  context "Probando clase hija" do
    it "Valor total de la emisiones diarias de de gases de efecto invernadero." do
      expect(plato2.get_gases).to eq(1.7)
    end
  end


end
