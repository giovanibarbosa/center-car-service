package centercarservice.financeiro

import centercarservice.estoque.Produto

class ServicoService {

    static transactional = true

    def serviceMethod() {

    }
	
	def void editaProdutosParaVendidos(Servico servicoInstance) {
		for(Produto p : servicoInstance.produtos) {
			p.vendido = "sim"
		}
	}
	
	def String getNomeDoController(String tipoDoPagamento) {
		if(tipoDoPagamento == "Cheque") { return "cheque" }
		if(tipoDoPagamento == "Cartao de Credito") { return "cartaoDeCredito" }
		return "pagamentoAVista"
	}
}
