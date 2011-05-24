package centercarservice.financeiro

class VendaService {

    static transactional = true

    def serviceMethod() {

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
