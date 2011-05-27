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
			"A Vista",
			"Cartao de Debito",
			"Cartao de Credito",
			"Cheque"
		])
		valorDaMaoDeObra(scale:2, min:new BigDecimal(0))
		taxaDeDesconto(min:new BigDecimal(0), max:new BigDecimal(100))
	}

	def calculaValorTotal() {
		def BigDecimal result = new BigDecimal(0)
		result.setScale(2)
		for(Produto p : produtos) {
			result += p.precoDeVenda
		}
		return valorDaMaoDeObra.add(result.subtract(result.multiply(taxaDeDesconto).divide(new BigDecimal(100)))) 
	}

	String toString() {
		return "Carro ${carro} : ${descricao} : Valor ${calculaValorTotal()} "
	}
}
