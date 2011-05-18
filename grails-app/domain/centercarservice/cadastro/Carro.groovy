package centercarservice.cadastro

import centercarservice.financeiro.Servico;

class Carro {
	String placa, nome, motor, cor, tipoDeCombustivel
	int ano
	
	static belongsTo = [cliente:Cliente]
	
	static hasMany = [servicos:Servico]
	
    static constraints = {
		nome(blank:false)
		ano(min:1900)
		motor()
		cor()
		placa(length:7)
		tipoDeCombustivel(inList:["Gasolina", "Alcool", "GNV", "Flex"])
	}
}
