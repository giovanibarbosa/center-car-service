package centercarservice.financeiro

import centercarservice.cadastro.Funcionario

class Caixa {

	double contasAPagar
	double contasAReceber

	BigDecimal totalSalariosAPagar

	//diferenca entre totalRecebidoEmVendas e totalVendido?
	double totalVendido
	double totalAReceberEmVendas
	double totalRecebidoEmVendas


	double totalEmServicos
	double totalRecebidoEmServicos
	double totalAReceberEmServicos

	static hasMany = {funcionarios : Funcionario}

	static constraints = {

	}
}