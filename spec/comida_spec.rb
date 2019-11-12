require 'lib/comida/clase_comida'

RSpec.describe Comida do
  before (:all) do
  	x=Comida.new("carne de vaca")
  end

  it "Debe existir un nombre para el alimento" do
    expect(x.nombre).not_to be nil
  end
end
