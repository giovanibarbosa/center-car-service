package centercarservice.financeiro

class Cheque extends Pagamento {
	Date dataDeDeposito, dataDeCompensacao
	String banco, numeroDoCheque	
	
    static constraints = {
		numeroDoCheque()
		banco()
		dataDeDeposito(nullable:true)
		dataDeCompensacao(nullable:true)
    }
}
