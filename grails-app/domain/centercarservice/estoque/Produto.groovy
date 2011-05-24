package centercarservice.estoque

class Produto {

	String referencia
	String descricao
	BigDecimal precoDeVenda, precoDeCompra
	Date garantia

	Date dataDaCompra
	Date dataDeVencimento
	Date dataDePagamento
	boolean quitado

	static constraints = {
		referencia(maxlength:100, blank:false)
		descricao(maxlengh:100, blank:false)
		precoDeVenda(blank:false)
	}
	
	def calcularLucro() {
		precoDeVenda - precoDeCompra
	}
}
