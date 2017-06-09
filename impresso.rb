module Impresso

	def initialize(possui_reimpressao)
		@possui_reimpressao = possui_reimpressao
	end

	def possui_reimpressao?
		if @possui_reimpressao	
			"Possui reimpressão" 
		else
			"Sem reimpresao"	
		end
	end

end