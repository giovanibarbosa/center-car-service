package centercarservice.financeiro

import centercarservice.cadastro.*;

class Venda {
	
	Cliente cliente
	Funcionario funcionario
	
	static hasMany = [produtos:Produto]
	//TODO existem mais atributos...
}
