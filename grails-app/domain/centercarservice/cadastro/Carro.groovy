package centercarservice.cadastro

import java.sql.Date;

import centercarservice.financeiro.Servico;

class Carro {
	String placa, nome, motor, cor, tipoDeCombustivel
	String ano = new Date().getYear().toString()
	
	static belongsTo = [cliente:Cliente]
	
	static hasMany = [servicos:Servico]
	
    static constraints = {
		nome(blank:false)
		ano(inList:listaAnos())
		motor()
		cor()
		placa(length:7)
		tipoDeCombustivel(inList:["Gasolina", "Alcool", "GNV", "Flex"])
	}
	
	def List listaAnos() {
		def List anos
		for (int i = 1950; i <= (new java.util.Date().getYear().toString()) ; i++) {
			anos.add(i)
		}
		return anos
	}
}
