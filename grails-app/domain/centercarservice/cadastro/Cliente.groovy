package centercarservice.cadastro

import centercarservice.financeiro.Venda

class Cliente extends Cadastravel {
	
	
	static hasMany = [compras:Venda, carros:Carro]
}
