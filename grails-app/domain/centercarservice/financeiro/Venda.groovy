package centercarservice.financeiro

import java.util.Date;

import centercarservice.cadastro.*;
import centercarservice.estoque.*;

class Venda {
	Cliente cliente
	Funcionario funcionario
	Pagamento pagamento
	String tipoDePagamento
	BigDecimal taxaDeDesconto = new BigDecimal(0)
	Date dataDaVenda

	static embedded = ['pagamento']
	static hasMany = [produtos:Produto]

	static constraints = {
		funcionario()
		cliente()
		dataDaVenda(nullable:true) //FIXME não é nullable
		tipoDePagamento(inList: [
			"A Vista",
			"Cartao de Debito",
			"Cartao de Credito",
			"Cheque"
		])
		taxaDeDesconto(min:new BigDecimal(0), max:new BigDecimal(100))
		pagamento(display:false, nullable:true)//FIXME não é nullable
	}

	def calculaValorTotal() {
		def resultado = new BigDecimal(0)
		resultado.scale = 2
		if(produtos != null) {
			for(Produto p : produtos)
				resultado += p.precoDeVenda
		}
		return resultado - (resultado * taxaDeDesconto / 100)
	}

	def calculaLucroTotal() {
		def resultado = new BigDecimal(0)
		resultado.scale = 2
		if(produtos != null) {
			for(Produto p : produtos)
				resultado += p.precoDeCompra
		}
		return calculaLucroTotal() - resultado
	}

	String toString() {
		return "${produtos} : Funcionario ${funcionario} : Cliente ${cliente} : Valor Da Venda ${calculaValorTotal()}"
	}
}
