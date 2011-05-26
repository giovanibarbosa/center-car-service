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
	
	def String getNomeDoContoller(String tipoDoPagamento) {
		if(tipoDoPagamento == "Cheque") { return "cheque" }
		if(tipoDoPagamento == "Cartao de Credito") { return "cartaoDeCredito" }
		return "pagamentoAVista"
	}
}
