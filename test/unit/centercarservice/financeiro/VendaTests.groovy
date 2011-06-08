package centercarservice.financeiro

import centercarservice.cadastro.Cliente
import centercarservice.cadastro.Funcionario
import grails.test.*
import java.text.SimpleDateFormat

class VendaTests extends GrailsUnitTestCase {


    void testCalculaValorTotal() {
		def formato = new SimpleDateFormat("dd/MM/yyyy")
		def cliente = new Cliente(cpf: "00000000000", nome: "Jose da Silva", telefone: "33333333",
			rg: "11111111", dataDeNascimento: formato.parse("25/01/1970"), 
			endereco: "Rua Aprigio Veloso, n:1000", email: "jose@gmail.com", observacoes: null)
		def funcionario = new Funcionario(cpf: "0123456789", nome: "Ana Josefina", telefone: "33330000",
			rg: "6532147", dataDeNascimento: formato.parse("15/06/1977"), 
			endereco: "Av Vigario Calixto, n:54", dataDeIngresso: formato.parse("01/01/2011"))
		def venda = new Venda(cliente: cliente, funcionario: funcionario, 
			tipoDePagamento: "Cartao de Credito", taxaDeDesconto: 0, dataDaVenda: formato.parse("08/06/2011"))
		
		assertEquals venda.calculaValorTotal()
    }
}
