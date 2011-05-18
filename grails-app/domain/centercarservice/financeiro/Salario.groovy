package centercarservice.financeiro

import centercarservice.cadastro.Funcionario;

class Salario {
	Date dataDeVencimento, dataDePagamento
	double valorBase, valorComissionado
	boolean pago
	
	static belongsTo = [funcionario:Funcionario]
	
    static constraints = {
		valorBase(min:0.0)
		//valorComissionado(validator:{return it >= valorBase})
		dataDeVencimento()
		dataDePagamento()
		pago()		
    }
}
