#!usr/bin/env ruby
#coding: utf-8

require 'thread'

EDAD_MAXIMA = 20

module ESTADO
	VIVO = 0
	MUERTE = 1
end

class Naranjero
	
	attr_accessor :edad, :altura, :inc_alt, :ini_fru, :estado, :contador
	
	def initialize(*args)
		raise ArgumentError unless (args.size == 2)
		@edad = 0
		@altura = 0
		@contador = 0
		@inc_alt = args[0]
		@ini_fru = args[1]
		@estado = ESTADO::VIVO
	end
	
	def uno_mas
		@edad += 1
		if @edad < EDAD_MAXIMA
			@altura += @inc_alt
			@contador += prod_nar if @edad >= @ini_fru
		else
			muere
		end
		@edad
	end
	
	def prod_nar
		@edad * 2
	end
	
	def muere
		@estado = ESTADO::MUERTE
	end
	
	def recolectar_una
		est = ""
		if @estado == ESTADO::MUERTE
			est = "El árbol está muerto"
		else
			if @contador == 0
				est = "No hay más naranjas"
			else
				est = "La naranja estaba deliciosa"
				@contador -= 1
			end
		end
		est
	end
	
	private :muere, :prod_nar
		
end
