package centercarservice

class Produto {
	double precoDeCompra, precoDeVenda, lucro
	Calendar validade
	String referencia, descricao
	Carro carro
	
	private def calcularLucro = {
		lucro = precoDeVenda - precoDeCompra
	}
	
	static constraints = {
		carro(nullable:true)	
	}
}
