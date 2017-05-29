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