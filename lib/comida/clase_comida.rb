class Comida
	attr_reader :nombre :proteinas :carbos :lipidos :gases :terreno :kcal

	def initialize(a, b, c, d, e, f)
		@nombre=a
		@proteinas=b
		@carbos=c
		@lipidos=d
		@gases=e
		@terreno=f
		@kcal= (b*4) + (c*4) + (d*9)
	end

	def to_s
		puts "El alimento #{@nombre} posee #{@proteinas} g de proteínas, #{@carbos} g de carbohidratos, #{@lipidos} g de lípidos, genera #{@gases} kg de CO2 por porción y supone un uso de #{@terreno} m2 de terreno al año"
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
