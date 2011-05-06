package centercarservice

class Cliente {
	String nome, cpf, telefone, rg, email
	Calendar dataNascimento
	Endereco endereco
	
	static hasMany = [carros:Carro]
	
	static constraints = {
		cpf(unique:true)
		rg(unique:true)
		carros(nullable:true)
		endereco(nullable:true)
	}
}
