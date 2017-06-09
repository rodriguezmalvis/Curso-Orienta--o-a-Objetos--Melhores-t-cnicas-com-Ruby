require_relative "produto"

class Ebook < Produto
	
	def initialize(titulo,preco,ano_lancamento,editora)
		super(titulo,preco,ano_lancamento,editora)
	end

	def matches? tipo
		["ebook","digital"].include? tipo
	end

end