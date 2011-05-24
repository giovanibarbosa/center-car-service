package centercarservice.cadastro

import centercarservice.financeiro.Salario;
import centercarservice.financeiro.Venda;

class Funcionario extends Cadastravel {
	//double totalEmSalariosAtrasados //TODO na gsp

	static hasMany = [salarios:Salario, vendas:Venda]

	static constraints = {
		salarios()

	}

	String toString() {
		return "${nome} - ${rg}"
	}

	def Integer calculaSalariosAtrasados() {
		int numeroDeSalariosAtrasados = 0
		def salarios = Salario.list()
		for (Salario s : salarios) {
			if (s.getFuncionario().getNome() == this.getNome()) {
				if(!s.getPago()) {
					numeroDeSalariosAtrasados++
				}
			}
		}
		return numeroDeSalariosAtrasados;
	}
	
	def BigDecimal calculaValorTotalAtrasado() {
		BigDecimal valorTotal = 0
		def salarios = Salario.list()
		for (Salario s : salarios) {
			if (s.getFuncionario().getNome() == this.getNome()) {
				if(!s.getPago()) {
					valorTotal += s.getValorBase()
				}
			}
		}
		return valorTotal
	}
}
