class Livro
	attr_reader :titulo, :preco, :ano_lancamento 
	def initialize(titulo,preco,ano_lancamento)
		@titulo = titulo
		@preco = preco
		@ano_lancamento = ano_lancamento
		@preco = calcula_desconto
	end

	def calcula_desconto
		@preco *= 0.7 if @ano_lancamento < 2005
		else
		@preco
	end

end

livro_rails = Livro.new("Aprenda RoR Rapidinho",80,2017)
livro_java = Livro.new("Não esqueça de JAVA",100,2002)
algoritmo = Livro.new("Algoritmos",50,1998)

livros = [livro_rails,livro_java,algoritmo]

def imprime_nota_fiscal livros
	livros.each do |livro|
		puts "Titulo #{livro.titulo} - #{livro.preco}"
	end
end

def envia_news_letter livros
	livros.each do |livro|
		if livro.ano_lancamento <= 1998
			puts "Newsletter/Liquidação"
			puts livro.titulo
			puts livro.preco
		end
	end
end

imprime_nota_fiscal livros

envia_news_letter livros