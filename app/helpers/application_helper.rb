module ApplicationHelper
	def valor_emreais(number)
		number_to_currency number,
		unit: "R$",
		separator: ",",
		delimiter: "."
	end

# Todos os valores são convertidos para 2 casas decimais após a virgula,
# e se o número for negativo ele retorna o valor zero.
	def valor_duascasas(number)
		number_with_precision number, precision: 2
	end

	def valor_inteiro(number)
		number_with_precision number, precision: 0
	end

end
