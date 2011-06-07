package centercarservice.cadastro

import centercarservice.financeiro.Salario;
import centercarservice.financeiro.Venda;

class Funcionario extends Cadastravel {
	Date dataDeIngresso

	static hasMany = [salarios:Salario, vendas:Venda]

	static constraints = { dataDeIngresso() }

	String toString() {
		return "${nome} : ${rg}"
	}

	def List getVendasPorPeriodo(Salario s) {
		def todasVendas = getVendas()
		def List vendasNoPeriodo = new ArrayList()
		Date fimDePeriodo = s.getDataDePagamento()
		Date comecoDePeriodo = fimDePeriodo.clone()
		comecoDePeriodo.setMonth(fimDePeriodo.getMonth() - 1)
		for (Venda venda : todasVendas) {
			if(venda.getDataDaVenda().after(comecoDePeriodo) && venda.getDataDaVenda().before(fimDePeriodo)) {
				vendasNoPeriodo.add(venda)
			}
		}
		return vendasNoPeriodo
	}

	def Integer calculaSalariosAtrasados() {
		int numeroDeSalariosAtrasados = 0
		def salarios = Salario.list()
		for (Salario s : salarios) {
			if (s.getFuncionario().getNome() == getNome()) {
				if(s.getPago() == "Nao") {
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
			if (s.getFuncionario().getNome() == getNome()) {
				if(s.getPago() == "Nao") {
					valorTotal += s.getValorBase()
				}
			}
		}
		return valorTotal
	}
}
