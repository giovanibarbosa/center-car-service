package centercarservice.estoque

class EstoqueController {
	
	def index = {
		render(Produto.count())
	}

}
