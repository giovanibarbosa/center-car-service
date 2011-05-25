package centercarservice.estoque

import org.hibernate.dialect.DataDirectOracle9Dialect;


class Produto {

	String referencia
	String descricao
	BigDecimal precoDeVenda = new BigDecimal(0)
	BigDecimal precoDeCompra = new BigDecimal(0)
	Date garantia
	Date dataDaCompra
	Date dataDeVencimento
	Date dataDePagamento
	String vendido = "nao"

	static constraints = {
		referencia(maxlength:50, blank:false, nullable:false, unique:true)
		descricao(maxlengh:100, blank:false)
		precoDeVenda(min: new BigDecimal(0), scale:2)
		precoDeCompra(min: new BigDecimal(0), scale:2)
		dataDeVencimento(nullable:true)
		dataDePagamento(nullable:true)
		vendido(inList:["nao", "sim"], display:false)
		garantia(nullable:true)
	}

	def calcularLucro() {
		precoDeVenda - precoDeCompra
	}

	def estaQuitado() {
		if(dataDePagamento != null && !(dataDePagamento.after(new Date()))) {
			return "sim"
		}
		return "nao"
	}

	def pgtoEstaVencido() {
		if(dataDePagamento != null && dataDeVencimento != null) {
			if(dataDePagamento.after(dataDeVencimento)){
				return "sim"
			}
		}
		return "nao"
	}
	
	String toString() {
		return "${referencia} : ${descricao} : Preco de Venda ${precoDeVenda}"
	}
}
