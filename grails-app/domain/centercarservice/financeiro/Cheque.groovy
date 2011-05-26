package centercarservice.financeiro

class Cheque extends Pagamento {
	Date dataDeDeposito, dataDeCompensacao
	String banco, numeroDoCheque
	
    static constraints = {
		numeroDoCheque(nullable:true)
		banco(nullable:true)
		dataDeDeposito(nullable:true)
		dataDeCompensacao(nullable:true)
    }
	
	String toString() {
		return "${valor} : Numero do Cheque ${numeroDoCheque} : Banco ${banco}" 
	}
}
