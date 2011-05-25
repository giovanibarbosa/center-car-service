package centercarservice.financeiro


class VendaController {
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def VendaService vendaService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [vendaInstanceList: Venda.list(params), vendaInstanceTotal: Venda.count()]
    }

    def create = {
        def vendaInstance = new Venda()
        vendaInstance.properties = params
        return [vendaInstance: vendaInstance]
    }

    def save = {
        def vendaInstance = new Venda(params)
//		vendaInstance.pagamento = vendaService.definePagamento(vendaInstance)//FIXME
		vendaService.editaProdutosParaVendidos(vendaInstance)
        if (vendaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'venda.label', default: 'Venda'), vendaInstance.id])}"
            redirect(action: "show", id: vendaInstance.id)
        }
        else {
            render(view: "create", model: [vendaInstance: vendaInstance])
        }
    }
	
	def ajaxPagamento = {
		def pagamento = vendaService.definePagamento(vendaInstance)
		if (pagamento instanceof Pagamento) {
			render "Entrou no AJAX"
		}
	}

    def show = {
        def vendaInstance = Venda.get(params.id)
        if (!vendaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])}"
            redirect(action: "list")
        }
        else {
            [vendaInstance: vendaInstance]
        }
    }

    def edit = {
        def vendaInstance = Venda.get(params.id)
        if (!vendaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [vendaInstance: vendaInstance]
        }
    }

    def update = {
        def vendaInstance = Venda.get(params.id)
        if (vendaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (vendaInstance.version > version) {
                    
                    vendaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'venda.label', default: 'Venda')] as Object[], "Another user has updated this Venda while you were editing")
                    render(view: "edit", model: [vendaInstance: vendaInstance])
                    return
                }
            }
            vendaInstance.properties = params
            if (!vendaInstance.hasErrors() && vendaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'venda.label', default: 'Venda'), vendaInstance.id])}"
                redirect(action: "show", id: vendaInstance.id)
            }
            else {
                render(view: "edit", model: [vendaInstance: vendaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def vendaInstance = Venda.get(params.id)
        if (vendaInstance) {
            try {
                vendaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])}"
            redirect(action: "list")
        }
    }
}
