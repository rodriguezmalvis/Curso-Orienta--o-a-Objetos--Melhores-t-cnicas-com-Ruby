class Livro
	attr_reader :titulo, :preco, :ano_lancamento 
	def initialize(titulo,preco,ano_lancamento,possui_reimpressao)
		@titulo = titulo
		@preco = preco
		@ano_lancamento = ano_lancamento
		@possui_reimpressao = possui_reimpressao
		@preco = calcula_desconto
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

	def to_csv
		"#{@titulo},#{@ano_lancamento},#{@preco}"
	end
end

class Estoque

	:livros

	def initialize
		@livros = []
	end

	def imprime_nota_fiscal
		@livros.each do |livro|
			puts "Imprimindo notas fiscais"
			puts "#{livro.titulo} - #{livro.preco}"
			puts livro.possui_reimpressao?
		end
	puts ""
	end

	def envia_news_letter
		@livros.each do |livro|
			if livro.ano_lancamento <= 1998
				puts "Newsletter/Liquidação"
				puts livro.titulo
				puts livro.preco
			end
		end
		puts ""
	end

	def exporta_csv
		@livros.each do |livro|
			livro.to_csv
		end
		puts ""
	end

	def mais_baratos_que valor
		@livros.select do |livro|
			livro.preco <= valor
		end
	end

	def total
		@livros.size
	end

	def adiciona livro
		@livros << livro if livro
	end
end

estoque = Estoque.new
estoque.adiciona Livro.new("Aprenda RoR Rapidinho",100,2017,true)
estoque.adiciona Livro.new("Não esqueça de JAVA",100,2002,false)
estoque.adiciona Livro.new("Algoritmos",100,1998,true)
estoque.adiciona Livro.new("Arquitetura de software",70,2011,true)
estoque.adiciona nil

estoque.imprime_nota_fiscal

estoque.envia_news_letter

estoque.exporta_csv

baratos =estoque.mais_baratos_que 90

baratos.each do |barato|
	puts "Barato! #{barato.titulo} - #{barato.preco}"
end
puts ""
