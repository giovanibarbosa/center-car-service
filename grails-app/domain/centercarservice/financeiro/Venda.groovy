package centercarservice.financeiro

import centercarservice.cadastro.*;
import centercarservice.estoque.*;

class Venda {	
	Cliente cliente
	Funcionario funcionario
	//Integer quantidadeDeProdutos
	
	static hasMany = [produtos:Produto]
	
	static constraints = {
	}
}
