package centercarservice.financeiro

import centercarservice.cadastro.Funcionario;

class Salario {
	Calendar dataDeVencimento, dataDePagamento
	double valorBase, valorComissionado
	boolean pago
	
	static belongsTo = [funcionario:Funcionario]
	
    static constraints = {
    }
}
