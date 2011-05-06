package centercarservice

class Funcionario {
	String cpf, nome, telefone, rg
	Calendar dataNascimento
	Endereco endereco
	double salario
	
	static hasMany = [venda:Venda]
}
