package centercarservice.financeiro

import centercarservice.cadastro.*;
import centercarservice.estoque.*;

class Venda {
	Cliente cliente
	Funcionario funcionario
	Pagamento pagamento
	String tipoDePagamento
	BigDecimal taxaDeDesconto

	static embedded = ['pagamento']
	static hasMany = [produtos:Produto]

	static constraints = {
		funcionario()
		cliente()
		tipoDePagamento(inList: [
			"A Vista",
			"Cartao de Debito",
			"Cartao de Credito",
			"Cheque"
		])
		taxaDeDesconto(min:new BigDecimal(0))
		pagamento(display:false)
	}

	def calculaValorTotal() {
		def resultado = 0
		if(produtos != null) {
			for(Produto p : produtos)
			resultado += p.precoDeVenda			
		}
		return resultado - (resultado * taxaDeDesconto / 100)
	}

	def calculaLucroTotal() {
		def resultado = 0
		if(produtos != null) {
			for(Produto p : produtos)
			resultado += p.precoDeCompra
		}
		return calculaLucroTotal() - resultado
	}
	
	
}
