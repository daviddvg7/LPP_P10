module Comida
  class Comida
	include Comparable
	attr_reader :nombre, :proteinas, :carbos, :lipidos, :gases, :terreno, :kcal

	def initialize(a, b, c, d, e, f)
		@nombre=a
		@proteinas=b
		@carbos=c
		@lipidos=d
		@gases=e
		@terreno=f
		@kcal= ((b*4) + (c*4) + (d*9)).round(1)
	end

	def to_s
		"El alimento #{@nombre} posee #{@proteinas} g de proteínas, #{@carbos} g de carbohidratos, #{@lipidos} g de lípidos, genera #{@gases} kg de CO2 por porción y supone un uso de #{@terreno} m2 de terreno al año"
	end


  end
end
