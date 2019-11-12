require 'lib/comida/clase_comida'

RSpec.describe Comida do
  before (:all) do
  	x=Comida.new("carne de vaca", 50.0, 164.0)
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

end
