package centercarservice.financeiro

import java.util.Date;

import centercarservice.cadastro.*;
import centercarservice.estoque.*;

class Venda {
	Cliente cliente
	Funcionario funcionario
	String tipoDePagamento
	BigDecimal taxaDeDesconto = new BigDecimal(0)
	Date dataDaVenda

	static hasMany = [produtos:Produto]

	static constraints = {
		funcionario()
		cliente()
		dataDaVenda()
		tipoDePagamento(inList: [
			"A Vista",
			"Cartao de Debito",
			"Cartao de Credito",
			"Cheque"
		])
		taxaDeDesconto(min:new BigDecimal(0), max:new BigDecimal(100))
	}

	def BigDecimal calculaValorTotal() {
		def BigDecimal resultado = new BigDecimal(0)
		resultado.setScale(2)
		if(produtos != null) {
			for(Produto p : produtos)
				resultado += p.precoDeVenda
		}
		return resultado.subtract(resultado.multiply(taxaDeDesconto).divide(100))
	}

	def BigDecimal calculaLucroTotal() {
		def BigDecimal resultado = new BigDecimal(0)
		resultado.setScale(2)
		if(produtos != null) {
			for(Produto p : produtos)
				resultado += p.precoDeCompra
		}
		return calculaLucroTotal().subtract(resultado)
	}

	String toString() {
		return "Produtos ${produtos} : Funcionario ${funcionario} : Cliente ${cliente}"
	}
}
