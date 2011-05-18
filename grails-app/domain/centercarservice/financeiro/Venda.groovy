package centercarservice.financeiro

import centercarservice.cadastro.*;
import centercarservice.estoque.*;

class Venda {
	
	Cliente cliente
	Funcionario funcionario
	
	static hasMany = [produtos:Produto]
	//TODO existem mais atributos...
}
