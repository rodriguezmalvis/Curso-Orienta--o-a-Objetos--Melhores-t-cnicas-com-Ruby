module Contador
	def << livro
		push livro
		if @maximo_necessario.nil? || @maximo_necessario < size
			@maximo_necessario = size
		end
	end
	def maximo_necessario
		@maximo_necessario
	end
end

class Float
	def para_dinheiro
		valor = "R$" << self.to_s.tr('.',',')
		valor << "0" unless valor.match /(.*)(\d{2})$/
      	valor
	end
end

class Conversor
   def string_para_alfanumerico(nome)
       nome.gsub /[^\w\s]/,''
   end
   def float_array_para_din array
   		precos = []
   		array.each do |numero|
   			precos << numero.para_dinheiro
   		end
   		puts precos.to_s
   end
end

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
		puts "#{@titulo},#{@ano_lancamento},#{@preco}"
	end
end

class Estoque

	def initialize
		@livros = []
		@livros.extend Contador

		def @livros.lenght
			nomes = []
				self.each do |livro|
					nomes << livro.titulo unless nomes.include? livro.titulo
				end
			nomes.size
		end
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

	def remove livro
		@livros.delete livro
	end

	def maximo_necessario
		@livros.maximo_necessario
	end

	def tamanho_sem_repetidos
		@livros.lenght
	end
end

estoque = Estoque.new
valores = [10.0,20.0,30.0,35.0,68.0,98.0,54.0,78.0,96.0]

livro_instanciado = Livro.new("Aivro Instanciado Errado",320,2017,true)
estoque.adiciona livro_instanciado
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Aprenda RoR Rapidinho",100,2017,true)
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Aprenda Delphi Rapidinho",100,2017,true)
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Não esqueça de JAVA",100,2002,false)
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Algoritmos",100,1998,true)
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Arquitetura de software",70,2011,true)
puts estoque.maximo_necessario
estoque.remove livro_instanciado
puts estoque.maximo_necessario
estoque.adiciona nil

estoque.exporta_csv

conversor = Conversor.new
conversor.float_array_para_din valores

puts estoque.tamanho_sem_repetidos

=begin
estoque.imprime_nota_fiscal

estoque.envia_news_letter

estoque.exporta_csv

baratos =estoque.mais_baratos_que 90

baratos.each do |barato|
	puts "Barato! #{barato.titulo} - #{barato.preco}"
end
puts ""
=end

