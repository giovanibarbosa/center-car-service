package centercarservice.financeiro

import centercarservice.cadastro.Carro;
import centercarservice.estoque.Produto;

class Servico {
	Date dataDoServico
	String descricao, observacoes, formaDePagamento
	BigDecimal valorDaMaoDeObra = new BigDecimal(0)
	BigDecimal taxaDeDesconto = new BigDecimal(0)

	static hasMany = [produtos:Produto]
	static belongsTo = [carro: Carro]

	static constraints = {
		carro()
		descricao()
		dataDoServico(nullable:true)
		observacoes(maxSize:1000)
		formaDePagamento(inList:[
			"Dinheiro",
			"CartaoDeCredito",
			"CartaoDeDebito",
			"Cheque"
		])
		valorDaMaoDeObra(scale:2, min:new BigDecimal(0))
		taxaDeDesconto(min:new BigDecimal(0), max:new BigDecimal(100))
	}

	def calculaValorTotal() {
		def BigDecimal result = new BigDecimal(0)
		result.scale = 2
		for(Produto p : produtos) {
			result += p.precoDeVenda
		}
		return valorDaMaoDeObra + result - (result * taxaDeDesconto / 100)
	}

	String toString() {
		return "Carro ${carro} : ${descricao} : ${dataDoServico.format('dd/MM/yyyy')} : Valor ${calculaValorTotal()} "
	}
}
