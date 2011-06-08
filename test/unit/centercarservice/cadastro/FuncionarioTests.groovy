package centercarservice.cadastro

import centercarservice.financeiro.Salario
import centercarservice.financeiro.Venda
import grails.test.*
import java.text.SimpleDateFormat

class FuncionarioTests extends GrailsUnitTestCase {
	
    void testCreate() {
		def formato = new SimpleDateFormat("dd/MM/yyyy")
		def func1 = new Funcionario(cpf: "000.000.000-00", nome: "Anderson",  telefone: "33333333",
			rg: "1111111", dataDeNascimento : formato.parse("26/09/1990"),  
			endereco: "Rua Silva Barbosa, nº 1209")
		
		
		def salario = new Salario(dataDeVencimento: null, dataDePagamento: new Date(), valorBase: 450.0, funcionario: func1, taxaDeComissao: 10, pago: "Nao")
		
		assertEquals "Anderson", func1.getNome()
		assertEquals formato.parse("26/09/1990"), func1.getDataDeNascimento()
		assertEquals func1, salario.getFuncionario()
		assertNull salario.getDataDeVencimento()

    }
	

}
