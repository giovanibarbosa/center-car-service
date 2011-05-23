package centercarservice.financeiro

import centercarservice.cadastro.Funcionario;

class Salario {
	Date dataDeVencimento, dataDePagamento
	BigDecimal valorBase, valorComissionado
	boolean pago
	Funcionario funcionario
	
	static belongsTo = [funcionario:Funcionario]
	
    static constraints = {
		valorBase(min:0.0)
		valorComissionado(display:false, nullable: true)
		dataDeVencimento()
		dataDePagamento()
		pago()
		funcionario()
    }
}
