package centercarservice.financeiro

class Pagamento {
	Date dataDoRecebimento, dataDoVencimento
	BigDecimal valor
	
	static mapping = {
		tablePerHierarchy false
	}
	
    static constraints = {
		valor(display:false)
		dataDoVencimento()
		dataDoRecebimento(nullable:true)
    }
	
	//TODO estaPago()
	
	def estaVencido() {
		if(dataDoRecebimento.after(dataDoVencimento))
			return "sim"
		return "nao"
	}
}
