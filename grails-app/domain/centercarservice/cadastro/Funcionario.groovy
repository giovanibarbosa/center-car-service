package centercarservice.cadastro

import centercarservice.financeiro.Salario
import centercarservice.financeiro.Venda

class Funcionario extends Cadastravel {
	double totalEmSalariosAtrasados
	
	static hasMany = [salarios:Salario, vendas:Venda]
		
    static constraints = {
    }
}
