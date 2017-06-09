require_relative "produto"
require_relative "impresso"

class Revista < Produto
	attr_reader :numero

	include Impresso

	def initialize(titulo,preco,ano_lancamento,editora,numero,possui_reimpressao)
		super(possui_reimpressao)
		@numero = numero
	end

	def matches? tipo
		["revista","digital"].include? tipo
	end
end