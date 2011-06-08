package centercarservice.financeiro

import grails.test.*
import java.text.SimpleDateFormat

class ServicoTests extends GrailsUnitTestCase {


    void testCalculaValorTotal() {
		def formato = new SimpleDateFormat("dd/MM/yyyy")
		def servico = new Servico(dataDoServico: formato.parse("07/06/2011"), descricao: "Troca de Oleo",
			observacoes: null, formaDePagamento: "A Vista", valorDaMaoDeObra: 15.0, taxaDeDesconto: 0)
		
		assertEquals 15.0, servico.calculaValorTotal()
		
		assertNull servico.getObservacoes()

    }
}
