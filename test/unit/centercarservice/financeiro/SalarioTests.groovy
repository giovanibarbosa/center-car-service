package centercarservice.financeiro

import grails.test.*
import java.text.SimpleDateFormat

class SalarioTests extends GrailsUnitTestCase {
    
    void testCalculaSalarioBase() {
		def formato = new SimpleDateFormat("dd/MM/yyyy")
		def salario = new Salario(dataDeVencimento: formato.parse("07/06/2011"), dataDePagamento: formato.parse("06/06/2011"), valorBase: 450.0, funcionario: null, taxaDeComissao: 10, pago: "Nao")
		
		assertEquals 450.0, salario.calculaSalarioBase()
		salario.setValorBase(null)
		assertNull(salario.calculaSalarioBase())
		
    }
}
