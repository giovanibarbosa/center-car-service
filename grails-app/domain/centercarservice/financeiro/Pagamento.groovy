package centercarservice.financeiro

abstract class Pagamento {
	Date dataDoRecebimento, dataDoVencimento
	BigDecimal valor

	static constraints = {
		valor(scale:2)
		dataDoVencimento(nullable:true)
		dataDoRecebimento(nullable:true)
		venda(nullable:true)
		servico(nullable:true)
	}

	static belongsTo = [venda: Venda, servico: Servico]

	//TODO estaPago()

	def estaVencido() {
		if(dataDoRecebimento != null && dataDoVencimento != null) {
			if(dataDoRecebimento.after(dataDoVencimento))
				return "sim"
		}
		return "nao"
	}
}
