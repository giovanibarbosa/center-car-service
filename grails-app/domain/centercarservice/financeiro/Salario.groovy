package centercarservice.financeiro

import centercarservice.cadastro.Funcionario;

class Salario {
	Date dataDeVencimento, dataDePagamento
	BigDecimal valorBase
	Funcionario funcionario
	BigDecimal taxaDeComissao = new BigDecimal(0)
	String pago = "Nao"

	static belongsTo = [funcionario:Funcionario]

	static constraints = {
		valorBase(min:0.0)
		taxaDeComissao(min:0.0, max:100.0, blank:false, scale:2)
		dataDeVencimento()
		dataDePagamento()
		pago(inList: ["Sim", "Nao",])
		funcionario()
	}
	
	def BigDecimal calculaSalarioBase() {
		return valorBase
	}

	def BigDecimal calculaSalarioComissionado() {
		def List vendasDoPeriodo = funcionario.getVendasPorPeriodo(this)
		BigDecimal valorTotalDasVendas = new BigDecimal(0)
		for (Venda venda : vendasDoPeriodo) {
			valorTotalDasVendas += venda.calculaValorTotal()
		}
		BigDecimal valorComissao = valorTotalDasVendas*(taxaDeComissao/100)
		return valorBase + valorComissao
	}

	String toString() {
		return "Valor Base: ${valorBase} - Vencido em: ${dataDeVencimento}"
	}
}
