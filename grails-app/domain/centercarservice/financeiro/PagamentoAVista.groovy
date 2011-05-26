package centercarservice.financeiro

class PagamentoAVista extends Pagamento {

    static constraints = {
    }
	
	String toString() {
		return "Valor ${valor}"
	}
}
