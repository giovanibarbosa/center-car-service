package centercarservice.financeiro

import centercarservice.estoque.Produto
import centercarservice.financeiro.Servico

class ServicoService {

    static transactional = true

    def serviceMethod() {

    }
	
	def listServicos() {
		Servico.list()
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
	
	def BigDecimal getTotalEmServicos() {
		def servicos = listServicos()
		def BigDecimal totalEmServicos = 0
		for(Servico servico:servicos) {
			totalEmServicos += servico.calculaValorTotal()
		}
		return totalEmServicos
	}
}
