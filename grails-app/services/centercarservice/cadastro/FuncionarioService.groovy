package centercarservice.cadastro

import java.awt.datatransfer.Transferable;
import org.springframework.transaction.annotation.Transactional;
import centercarservice.cadastro.Funcionario;
import centercarservice.financeiro.Salario

class FuncionarioService {

	@Transactional(readOnly = true)
	def listSalarios() {
		Salario.list()
	}

	@Transactional
	def LinkedHashMap funcionariosNaoPagos() {		
		Set funcionariosInstanceList = new HashSet()
		for(Salario s : listSalarios()) {
			if (s.getPago() == "Nao") {
				funcionariosInstanceList.add s.getFuncionario()
			}
		}
		return [funcionariosInstanceList  : funcionariosInstanceList , funcionariosInstanceListTotal: funcionariosInstanceList.size()]
	}
}
