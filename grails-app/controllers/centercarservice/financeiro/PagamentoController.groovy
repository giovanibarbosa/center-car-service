package centercarservice.financeiro

class PagamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pagamentoInstanceList: Pagamento.list(params), pagamentoInstanceTotal: Pagamento.count()]
    }

    def create = {
        def pagamentoInstance = new Pagamento()
        pagamentoInstance.properties = params
        return [pagamentoInstance: pagamentoInstance]
    }

    def save = {
        def pagamentoInstance = new Pagamento(params)
        if (pagamentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), pagamentoInstance.id])}"
            redirect(action: "show", id: pagamentoInstance.id)
        }
        else {
            render(view: "create", model: [pagamentoInstance: pagamentoInstance])
        }
    }

    def show = {
        def pagamentoInstance = Pagamento.get(params.id)
        if (!pagamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pagamentoInstance: pagamentoInstance]
        }
    }

    def edit = {
        def pagamentoInstance = Pagamento.get(params.id)
        if (!pagamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pagamentoInstance: pagamentoInstance]
        }
    }

    def update = {
        def pagamentoInstance = Pagamento.get(params.id)
        if (pagamentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pagamentoInstance.version > version) {
                    
                    pagamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pagamento.label', default: 'Pagamento')] as Object[], "Another user has updated this Pagamento while you were editing")
                    render(view: "edit", model: [pagamentoInstance: pagamentoInstance])
                    return
                }
            }
            pagamentoInstance.properties = params
            if (!pagamentoInstance.hasErrors() && pagamentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), pagamentoInstance.id])}"
                redirect(action: "show", id: pagamentoInstance.id)
            }
            else {
                render(view: "edit", model: [pagamentoInstance: pagamentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pagamentoInstance = Pagamento.get(params.id)
        if (pagamentoInstance) {
            try {
                pagamentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamento.label', default: 'Pagamento'), params.id])}"
            redirect(action: "list")
        }
    }
}
