require_relative "contador"

class Estoque

	def initialize
		@livros = []
		@livros.extend Contador
		@vendas = []

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

	def venda livro
		@livros.delete livro
		@vendas << livro
	end

	def maximo_necessario
		@livros.maximo_necessario
	end

	def tamanho_sem_repetidos
		@livros.lenght
	end

	def get_livros
		@livros	
	end

	def method_missing name
		puts "Não encontrei: #{name}... Montando metodo"
		matcher = name.to_s.match "(.+)_mais_vendido_por_(.+)"
		if matcher
			tipo = matcher[1]
			campo = matcher[2].to_sym
			que_mais_vendeu_por tipo, &campo
		else
			super
		end
	end

	def respond_to? name
		matcher = name.to_s.match ("(.+)_mais_vendido_por_(.+)")
		if matcher
			true
		else
			super
		end
	end

	private 

	def quantidade_vendas_por produto, &campo
		@vendas.count{ |venda| campo.call(venda) == campo.call(produto)}
	end

	def que_mais_vendeu_por tipo, &campo
		@vendas.select{ |l| l.tipo == tipo }.sort{
			|v1,v2| quantidade_vendas_por(v1, &campo) <=> 
			quantidade_vendas_por(v2, &campo)
		}.last	
	end
end