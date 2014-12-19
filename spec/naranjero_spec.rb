# coding: utf-8
require 'spec_helper'
require 'naranjero'

class Naranjero
	describe Naranjero do
		
		before :each do
			@n = Naranjero.new(2,2)
		end
		
		context "Naranjero" do
			
			it "Debe tener atributo de edad" do
				expect(@n).to respond_to :edad
			end
			it "Debe tener atributo de altura" do
				expect(@n).to respond_to :altura
			end
			it "Debe tener atributo del incremento de la altura anual del naranjero" do
				expect(@n).to respond_to :inc_alt
			end
			it "Debe tener atributo de la edad a la que empieza a dar frutos" do
				expect(@n).to respond_to :ini_fru
			end
			it "Debe tener atributo del estado en que se encuentra el naranjero (vivo o muerto)" do
				expect(@n).to respond_to :estado
			end
			it "Debe tener atributo de la cantidad de naranjas que tiene" do
				expect(@n).to respond_to :contador
			end
			
			it "Debe tener método que controle el crecimiento del árbol y su producción" do
				expect(@n).to respond_to :uno_mas
			end
			it "Debe tener método que calcule las naranjas producidas por año" do
				expect(@n.private_methods.include? :prod_nar).to eq(true)
			end
			it "Debe tener método que cambie el estado del naranjero" do
				expect(@n.private_methods.include? :muere).to eq(true)
			end
			it "Debe tener método que calcule la recolecta del naranjero" do
				expect(@n).to respond_to :recolectar_una
			end
			
		end
		
	end
end
