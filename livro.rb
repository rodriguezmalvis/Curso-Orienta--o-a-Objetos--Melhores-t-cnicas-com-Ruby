class Livro
	attr_reader :titulo, :preco, :ano_lancamento, :editora, :possui_sobrecapa
	def initialize(titulo,preco,ano_lancamento,possui_reimpressao,possui_sobrecapa,editora)
		@titulo = titulo
		@preco = preco
		@ano_lancamento = ano_lancamento
		@possui_reimpressao = possui_reimpressao
		@possui_sobrecapa = possui_sobrecapa
		@preco = calcula_desconto
		@editora = editora
	end

	def calcula_desconto
		if @ano_lancamento < 2006
			if @possui_reimpressao
				@preco * 0.9
			else
				@preco * 0.95
			end
		elsif @ano_lancamento < 2010
			@preco * 0.96
		else
			@preco
		end
	end

	def possui_reimpressao?
		if @possui_reimpressao	
			"Possui reimpressão" 
		else
			"Sem reimpresao"	
		end
	end

	def matches? tipo
		["livro","impresso"].include? tipo
	end

	def to_csv
		puts "#{@titulo},#{@ano_lancamento},#{@preco}"
	end
end