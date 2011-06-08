package centercarservice.estoque

import grails.test.*
import java.text.SimpleDateFormat


class ProdutoTests extends GrailsUnitTestCase {


	void testCalcularLucro() {
		def formato = new SimpleDateFormat("dd/MM/yyyy")
		def prod = new Produto(referencia: "0001568",descricao: "Mola", precoDeCompra: 150.00, precoDeVenda: 200.00,
				garantia: formato.parse("07/06/2012"), dataDaCompra: formato.parse("01/06/2011"), dataDeVencimento: formato.parse("01/06/2011"), vendido: "nao")

		assertEquals 50.0, prod.calcularLucro()
		prod.setPrecoDeVenda(155.0)
		assertEquals 5.0, prod.calcularLucro()
	}

	void testEstaQuitado(){
		def formato = new SimpleDateFormat("dd/MM/yyyy")
		def prod = new Produto(referencia: "0001568",descricao: "Mola", precoDeCompra: 150.00, precoDeVenda: 200.00,
				garantia: formato.parse("07/06/2012"), dataDaCompra: formato.parse("02/06/2011"), dataDeVencimento: formato.parse("03/06/2011"), dataDePagamento: formato.parse("02/06/2011"), vendido: "nao")

		assertTrue(prod.estaQuitado().equals("sim"))
		prod.setDataDePagamento(null)
		assertTrue(prod.estaQuitado().equals("nao"))
	}
}
