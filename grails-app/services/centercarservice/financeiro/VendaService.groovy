package centercarservice.financeiro

import centercarservice.estoque.Produto;

class VendaService {

    static transactional = true

    def serviceMethod() {

    }
	
	def void editaProdutosParaVendidos(Venda vendaInstance) {
		for(Produto p : vendaInstance.produtos) {
			p.vendido = "sim"
		}
	}
	
	def definePagamento(Venda venda) {
		if(venda.tipoDePagamento == "A Vista" || venda.tipoDePagamento == "Cartao de Debito") {
			return new Pagamento(valor: venda.calculaValorTotal(), dataDoVencimento: new Date())
		}
		else if(venda.tipoDePagamento == "Cartao de Credito") {
			return new CartaoDeCredito(valor: venda.calculaValorTotal())
		}
		else {
			return new Cheque(valor: venda.calculaValorTotal())
		}
	}
}
