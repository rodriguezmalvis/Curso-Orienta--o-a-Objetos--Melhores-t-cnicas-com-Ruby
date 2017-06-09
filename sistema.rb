require_relative "livro"
require_relative "ebook"
require_relative "revista"
require_relative "estoque"
require_relative "conversor"

class Float
	def para_dinheiro
		valor = "R$" << self.to_s.tr('.',',')
		valor << "0" unless valor.match /(.*)(\d{2})$/
      	valor
	end
end

estoque = Estoque.new

=begin
valores = [10.0,20.0,30.0,35.0,68.0,98.0,54.0,78.0,96.0]

livro_instanciado = Livro.new("Aivro Instanciado Errado",320,2017,true,"")
estoque.adiciona livro_instanciado
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Aprenda RoR Rapidinho",100,2017,true,"")
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Aprenda Delphi Rapidinho",100,2017,true,"")
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Não esqueça de JAVA",100,2002,false,"")
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Algoritmos",100,1998,true,"")
puts estoque.maximo_necessario
estoque.adiciona Livro.new("Arquitetura de software",70,2011,true,"")
puts estoque.maximo_necessario
estoque.remove livro_instanciado
puts estoque.maximo_necessario
estoque.adiciona nil

estoque.exporta_csv

conversor = Conversor.new
conversor.float_array_para_din valores

puts estoque.tamanho_sem_repetidos

estoque.imprime_nota_fiscal

estoque.envia_news_letter

estoque.exporta_csv

baratos =estoque.mais_baratos_que 90

baratos.each do |barato|
	puts "Barato! #{barato.titulo} - #{barato.preco}"
end
puts ""
=end

java = Livro.new("Aprenda RoR Rapidinho",120,2010,true,true,"Editora 1")
ruby = Revista.new("Revista sobre Ruby",110,2010,"Editora 1",24,1)
c = Ebook.new("Ebook sobre c#",89,2010,"Editora 1")


estoque.adiciona(ruby)
estoque.adiciona(ruby)
estoque.adiciona(java)
estoque.adiciona(java)
estoque.adiciona(java)
estoque.adiciona(java)
estoque.adiciona(ruby)
estoque.adiciona(c)
estoque.adiciona(c)
estoque.adiciona(c)

estoque.venda(ruby)
estoque.venda(c)
estoque.venda(c)
estoque.venda(java)
estoque.venda(java)
estoque.venda(java)

puts estoque.livro_mais_vendido_por_titulo.titulo

puts estoque.livro_mais_vendido_por_ano_lancamento.titulo

puts estoque.respond_to?(:livro_mai_vendido_pr_ao_lancaento)
puts estoque.respond_to?(:livro_mais_vendido_por_ano_lancamento)
puts estoque.respond_to?(:revista_mais_vendido_por_ano_lancamento)
puts estoque.respond_to?(:ebook_mais_vendido_por_ano_lancamento)
puts estoque.respond_to?(:get_livros)

baratos =estoque.mais_baratos_que 90

baratos.each do |barato|
	puts "Barato! #{barato.titulo} - #{barato.preco}"
end