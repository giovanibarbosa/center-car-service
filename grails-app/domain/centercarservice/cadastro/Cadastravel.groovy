package centercarservice.cadastro

abstract class Cadastravel {
	String cpf, nome, telefone, rg
	Date dataDeNascimento
	String endereco
		
    static constraints = {
		nome(blank:false)
		cpf()
		rg(minLength:7, blank:true)
		dataDeNascimento(validator: {return it < new Date()})
		telefone(maxLength:10, minLength:8, blank:true)
		endereco(maxLength:1000, blank:true)
    }
}
