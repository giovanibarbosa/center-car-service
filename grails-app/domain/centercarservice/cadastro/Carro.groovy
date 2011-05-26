package centercarservice.cadastro

import java.util.Date;

import centercarservice.financeiro.Servico;

class Carro {
	String placa, nome, motor, cor, tipoDeCombustivel
	String ano = new Date().getYear().toString()
	
	static belongsTo = [cliente:Cliente]
	
	static hasMany = [servicos:Servico]
	
    static constraints = {
		nome(blank:false)
		ano()
		motor()
		cor()
		placa(length:7)
		tipoDeCombustivel(inList:["Gasolina", "Alcool", "GNV", "Flex"])
	}
	
	String toString() {
		return "${nome} : Placa ${placa} : Motor ${motor} : ${ano} : Cor: ${cor} ${tipoDeCombustivel}"
	}
}
