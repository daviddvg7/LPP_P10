require 'lib/comida/clase_comida'

RSpec.describe Comida do
  before (:all) do
  	x=Comida::Comida.new("carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
	lentejas=Comida::Comida.new("lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
	cerdo= Comida::Comida.new("cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
	tofu= Comida::Comida.new("tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
	cerveza= Comida::Comida.new("cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
	salmon= Comida::Comida.new("salmón", 19.9, 0.0, 13.6, 6.0, 3.7)

	h=[lentejas, cerdo, tofu, cerveza, cerveza]
	m=[x, salmon]
  end

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

  it "Se calcula correctamente el impacto ambiental diario de un hombre de 20-39 años (gases)."
	expect(x.impacto_hombre_gases(h)).to eq(10.48)
  end

  it "Se calcula correctamente el impacto ambiental diario de un hombre de 20-39 años (terreno)."
	expect(x.impacto_hombre_terreno(h)).to eq(17.04)
  end

  it "Se calcula correctamente el impacto ambiental diario de una mujer de 20-39 años (gases)."
	expect(x.impacto_mujer_gases(m)).to eq(56.0)
  end

  it "Se calcula correctamente el impacto ambiental diario de una mujer de 20-39 años (terreno)."
	expect(x.impacto_mujer_terreno(m)).to eq(167.7)
  end



end
