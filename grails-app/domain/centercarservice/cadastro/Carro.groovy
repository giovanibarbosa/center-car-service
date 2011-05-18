package centercarservice.cadastro

class Carro {
	String placa, nome, motor, cor
	int ano
	
	static belongsTo = [cliente:Cliente]
	
    static constraints = {
		nome(blank:false)
		ano(min:1900)
		motor()
		cor()
		placa(length:7)
	}
}
