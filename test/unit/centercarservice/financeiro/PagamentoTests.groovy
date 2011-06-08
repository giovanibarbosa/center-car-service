package centercarservice.financeiro

import grails.test.*
import java.text.SimpleDateFormat

class PagamentoTests extends GrailsUnitTestCase {

	void testCartaoDeCredito() {
		def formato = new SimpleDateFormat("dd/MM/yyyy")
		def cartao = new CartaoDeCredito(dataDoRecebimento: formato.parse("10/06/2011"),
				dataDoVencimento: formato.parse("09/06/2011"), valor: 500.0, quantidadeDeParcelas: 8)

		assertEquals 62.5, cartao.calculaValorDaParcela()
		cartao.setQuantidadeDeParcelas(5)
		assertEquals 100, cartao.calculaValorDaParcela()
		assertTrue(cartao.estaVencido().equals("sim"))
	}

	void testCheque() {
		def formato = new SimpleDateFormat("dd/MM/yyyy")
		def cheque = new Cheque(dataDoRecebimento: formato.parse("10/06/2011"),
				dataDoVencimento: formato.parse("09/06/2011"), valor: 140.0,
				dataDeDeposito: formato.parse("10/06/2011"), dataDeCompensacao: formato.parse("13/06/2011"),
				banco: "Itau", numeroDoCheque: "11111111")

		assertEquals "Itau", cheque.getBanco()
		cheque.setNumeroDoCheque(null)
		assertNull cheque.getNumeroDoCheque()
		assertTrue(cheque.estaVencido().equals("sim"))
	}
}
