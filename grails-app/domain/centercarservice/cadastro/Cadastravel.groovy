package centercarservice.cadastro

import centercarservice.financeiro.Caixa

abstract class Cadastravel {
	String cpf, nome, telefone, rg
	Calendar dataDeNascimento
	Endereco endereco
		
    static constraints = {
    }
}
