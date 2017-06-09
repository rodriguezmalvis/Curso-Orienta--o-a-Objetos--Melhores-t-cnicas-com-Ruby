require_relative "produto"
require_relative "impresso"

class Livro < Produto
	attr_reader :possui_sobrecapa
	
	include Impresso

	def initialize(titulo,preco,ano_lancamento,possui_reimpressao,possui_sobrecapa,editora)
		super(possui_reimpressao)
		@possui_sobrecapa = possui_sobrecapa
	end

	def matches? tipo
		["livro","impresso"].include? tipo
	end
end