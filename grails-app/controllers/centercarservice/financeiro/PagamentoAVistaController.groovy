package centercarservice.financeiro

class PagamentoAVistaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pagamentoAVistaInstanceList: PagamentoAVista.list(params), pagamentoAVistaInstanceTotal: PagamentoAVista.count()]
    }

    def create = {
        def pagamentoAVistaInstance = new PagamentoAVista()
        pagamentoAVistaInstance.properties = params
        return [pagamentoAVistaInstance: pagamentoAVistaInstance]
    }
	
	def saveWithValue = {
		def pagamentoAVistaInstance = new PagamentoAVista(params)
		pagamentoAVistaInstance.venda = Venda.get(params.vendaId)
		if (pagamentoAVistaInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), pagamentoAVistaInstance.id])}"
			redirect(action: "edit", id: pagamentoAVistaInstance.id)
		}
		else {
			render(view: "create", model: [pagamentoAVistaInstance: pagamentoAVistaInstance])
		}
	}
	
	def serviceWithValue = {
		def pagamentoAVistaInstance = new PagamentoAVista(params)
		pagamentoAVistaInstance.servico = Servico.get(params.servicoId)
		if (pagamentoAVistaInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), pagamentoAVistaInstance.id])}"
			redirect(action: "edit", id: pagamentoAVistaInstance.id)
		}
		else {
			render(view: "create", model: [pagamentoAVistaInstance: pagamentoAVistaInstance])
		}
	}

    def save = {
        def pagamentoAVistaInstance = new PagamentoAVista(params)
        if (pagamentoAVistaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), pagamentoAVistaInstance.id])}"
            redirect(action: "show", id: pagamentoAVistaInstance.id)
        }
        else {
            render(view: "create", model: [pagamentoAVistaInstance: pagamentoAVistaInstance])
        }
    }

    def show = {
        def pagamentoAVistaInstance = PagamentoAVista.get(params.id)
        if (!pagamentoAVistaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pagamentoAVistaInstance: pagamentoAVistaInstance]
        }
    }

    def edit = {
        def pagamentoAVistaInstance = PagamentoAVista.get(params.id)
        if (!pagamentoAVistaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pagamentoAVistaInstance: pagamentoAVistaInstance]
        }
    }

    def update = {
        def pagamentoAVistaInstance = PagamentoAVista.get(params.id)
        if (pagamentoAVistaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pagamentoAVistaInstance.version > version) {
                    
                    pagamentoAVistaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista')] as Object[], "Another user has updated this PagamentoAVista while you were editing")
                    render(view: "edit", model: [pagamentoAVistaInstance: pagamentoAVistaInstance])
                    return
                }
            }
            pagamentoAVistaInstance.properties = params
            if (!pagamentoAVistaInstance.hasErrors() && pagamentoAVistaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), pagamentoAVistaInstance.id])}"
                redirect(action: "show", id: pagamentoAVistaInstance.id)
            }
            else {
                render(view: "edit", model: [pagamentoAVistaInstance: pagamentoAVistaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pagamentoAVistaInstance = PagamentoAVista.get(params.id)
        if (pagamentoAVistaInstance) {
            try {
                pagamentoAVistaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamentoAVista.label', default: 'PagamentoAVista'), params.id])}"
            redirect(action: "list")
        }
    }
}
