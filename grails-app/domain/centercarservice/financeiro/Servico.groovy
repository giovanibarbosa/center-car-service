package centercarservice.financeiro

import centercarservice.estoque.Produto;

class Servico {
	Date dataDoServico, dataDePagamento, dataDeVencimento
	String descricao, observacoes, formaDePagamento
	BigDecimal valor
	Boolean quitado //Derivado de data de pagamento

	static hasMany = [produtos:Produto]

	static constraints = {
		descricao(blank:false)
		dataDoServico(nullable:true)
		dataDeVencimento(nullable:true)
		dataDePagamento(nullable:true)
		observacoes(maxSize:1000)
		formaDePagamento(inList:[
			"Dinheiro",
			"CartaoDeCredito",
			"CartaoDeDebito",
			"Cheque"
		])
		quitado(display:false)
	}
}
