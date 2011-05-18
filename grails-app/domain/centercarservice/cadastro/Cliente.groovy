package centercarservice.cadastro

import centercarservice.financeiro.Venda

class Cliente extends Cadastravel {
	String email, observacoes
		
	static hasMany = [compras:Venda, carros:Carro]
	
	static constraints = {
		email(email:true)
		observacoes(maxSize:1000)
	}
	
	String toString() {
		return "${nome} - ${email}"
	}
}
