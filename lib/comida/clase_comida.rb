class Comida
	attr_reader :nombre :proteinas :carbos :lipidos :gases :terreno

	def initialize(a, b, c, d, e, f)
		@nombre=a
		@proteinas=b
		@carbos=c
		@lipidos=d
		@gases=e
		@terreno=f
	end

	def to_s
		puts "El alimento #{@nombre} posee #{@proteinas} g de proteínas, #{@carbos} g de carbohidratos, #{@lipidos} g de lípidos, genera #{@gases} kg de CO2 por porción y supone un uso de #{@terreno} m2 de terreno al año"
	end
end
