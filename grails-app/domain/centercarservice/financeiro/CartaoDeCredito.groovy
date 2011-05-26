package centercarservice.financeiro

class CartaoDeCredito extends Pagamento {
	Integer quantidadeDeParcelas

    static constraints = {
		quantidadeDeParcelas(min:1)
    }
	
	def calculaValorDaParcela() {
		return valor.divide(quantidadeDeParcelas)
	}
	
	String toString() {
		return "${valor} : Numero de parcelas ${quantidadeDeParcelas} de ${calculaValorDaParcela()}"
	}
}
