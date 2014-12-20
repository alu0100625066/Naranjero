#!usr/bin/env ruby
#coding: utf-8

require 'thread'

# Constante que es la máxima edad del naranjero
EDAD_MAXIMA = 10



#Módulo de los estados del naranjero
module ESTADO
	VIVO = 0
	MUERTE = 1
end


# Clase gestora del comportamiento del naranjero
class Naranjero
	
	attr_accessor :edad, :altura, :inc_alt, :ini_fru, :estado, :contador
	

# Instancia un nuevo objeto de la clase Orange indicando el incremento de altura y la edad mínima a la cual da frutos.
	def initialize(*args)
		raise ArgumentError unless (args.size == 2)
		@edad = 0
		@altura = 0
		@contador = 0
		@inc_alt = args[0]
		@ini_fru = args[1]
		@estado = ESTADO::VIVO
	end
	

# Incrementa la edad del naranjero en uno si es posible,sino mata el naranjero.
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
	

# Devuelve una nueva cantidad de frutas a partir de la edad actual.
	def prod_nar
		@edad * 2
	end

# Muerte del naranjero.	
	def muere
		@estado = ESTADO::MUERTE
	end


 # Recoleta una naranja si es posible y devuelve un mensaje ligado al resultado.	
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


#FIchero donde se muesrta los resultados.
if __FILE__ == $0
	n = Naranjero.new  2,2
	q = Queue.new
	hNaranjero = Thread.new do
		while n.estado == ESTADO::VIVO do
			retraso = 2
			puts "Estado del crecimiento del naranjero: Dormido, tras #{retraso} segundos" 
			sleep retraso
			puts "Estado del crecimiento del naranjero: Reanimado, tras #{retraso} segundos"
			n.uno_mas
			puts "El naranjero crece"
			q.enq n
			retraso = 4
			puts "Estado del crecimiento del naranjero: Dormido, tras #{retraso} segundos"
			sleep retraso
			puts "Estado del crecimiento del naranjero: Reanimado, tras #{retraso} segundos"
			n.uno_mas
			puts "El naranjero crece"
			q.enq n
		end
	end
	
	hRecolector = Thread.new do
		while n.estado == ESTADO::VIVO do
			retraso = 0
			puts "  El recolector se duerme durante #{retraso} segundos"
			sleep retraso
			puts "  El recolector se reanima después de #{retraso} segundos"
			puts "  El recolector está esperando ..."
			puts "  #{q.deq.recolectar_una}"
			retraso = 4
			puts "  El recolector se duerme durante #{retraso} segundos"
			sleep retraso
			puts "  El recolector se reanima después de #{retraso} segundos"
			puts "  El recolector está esperando ..."
			puts "  #{q.deq.recolectar_una}"
		end
	end
	hNaranjero.join
	hRecolector.join
end	
