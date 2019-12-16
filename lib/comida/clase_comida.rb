# encoding: utf-8
# Author::    David Valverde


module Comida

  # Esta clase representa distintas comidas con sus respectivos datos
  # Se ha utilizado el módulo Comparable
  class Comida
	include Comparable
	attr_reader :nombre, :proteinas, :carbos, :lipidos, :gases, :terreno, :kcal

	# Se asignan valores a las variables de instancia de la clase
	def initialize(a, b, c, d, e, f)
		@nombre=a
		@proteinas=b
		@carbos=c
		@lipidos=d
		@gases=e
		@terreno=f
		@kcal= ((b*4) + (c*4) + (d*9)).round(1)
	end

	# Método que formatea el alimento y sus datos
	def to_s
		"El alimento #{@nombre} posee #{@proteinas} g de proteínas, #{@carbos} g de carbohidratos, #{@lipidos} g de lípidos, genera #{@gases} kg de CO2 por porción y supone un uso de #{@terreno} m2 de terreno al año"
	end

	# Método que compara los alimentos por su valor energético
	def <=>(other)
		@kcal<=>other.kcal
	end
  end
end
