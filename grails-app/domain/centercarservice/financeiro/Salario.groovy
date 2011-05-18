package centercarservice.financeiro

import centercarservice.cadastro.Funcionario;

class Salario {
	Date dataDeVencimento, dataDePagamento
	BigDecimal valorBase, valorComissionado
	boolean pago
	
	static belongsTo = [funcionario:Funcionario]
	
    static constraints = {
		valorBase(min:0.0)
		valorComissionado(display:false)
		dataDeVencimento()
		dataDePagamento()
		pago()		
    }
}
