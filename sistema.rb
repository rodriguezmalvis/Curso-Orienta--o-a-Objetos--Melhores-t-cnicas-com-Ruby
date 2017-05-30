require_relative "livro"
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

rapid = Livro.new("Aprenda RoR Rapidinho",100,2010,true,"","livro")
delphi = Livro.new("Aprenda Delphi Rapidinho",100,2010,true,"","livro")
java = Livro.new("Não esqueça de JAVA",100,2002,false,"","livro")
algoritmos = Livro.new("Algoritmos",100,2010,true,"","livro")
arquitetura = Livro.new("Arquitetura de software",70,2010,true,"","livro")

estoque.adiciona(rapid)
estoque.adiciona(delphi)
estoque.adiciona(java)
estoque.adiciona(java)
estoque.adiciona(java)
estoque.adiciona(java)
estoque.adiciona(algoritmos)
estoque.adiciona(arquitetura)
estoque.adiciona(arquitetura)
estoque.adiciona(arquitetura)

estoque.venda(rapid)
estoque.venda(delphi)
estoque.venda(algoritmos)
estoque.venda(arquitetura)
estoque.venda(arquitetura)
estoque.venda(java)
estoque.venda(java)
estoque.venda(java)
estoque.venda(java)

puts estoque.livro_mais_vendido_por_titulo.titulo

puts estoque.livro_mais_vendido_por_ano_lancamento.titulo

puts estoque.respond_to?(:livro_mai_vendido_pr_ao_lancaento)
puts estoque.respond_to?(:livro_mais_vendido_por_ano_lancamento)
puts estoque.respond_to?(:get_livros)