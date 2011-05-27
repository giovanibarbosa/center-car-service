package centercarservice.financeiro

class ServicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def ServicoService servicoService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [servicoInstanceList: Servico.list(params), servicoInstanceTotal: Servico.count()]
    }

    def create = {
        def servicoInstance = new Servico()
        servicoInstance.properties = params
        return [servicoInstance: servicoInstance]
    }

    def save = {
        def servicoInstance = new Servico(params)
        if (servicoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'servico.label', default: 'Servico'), servicoInstance.id])}"
			servicoService.editaProdutosParaVendidos(servicoInstance)
			redirect(controller:servicoService.getNomeDoController(servicoInstance.formaDePagamento),
				action:"saveServiceWithValue", params:
				[valor: servicoInstance.calculaValorTotal().toString().replace(".", ","), servicoId: servicoInstance.id])
        }
        else {
            render(view: "create", model: [servicoInstance: servicoInstance])
        }
    }

    def show = {
        def servicoInstance = Servico.get(params.id)
        if (!servicoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'servico.label', default: 'Servico'), params.id])}"
            redirect(action: "list")
        }
        else {
            [servicoInstance: servicoInstance]
        }
    }

    def edit = {
        def servicoInstance = Servico.get(params.id)
        if (!servicoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'servico.label', default: 'Servico'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [servicoInstance: servicoInstance]
        }
    }

    def update = {
        def servicoInstance = Servico.get(params.id)
        if (servicoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (servicoInstance.version > version) {
                    
                    servicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'servico.label', default: 'Servico')] as Object[], "Another user has updated this Servico while you were editing")
                    render(view: "edit", model: [servicoInstance: servicoInstance])
                    return
                }
            }
            servicoInstance.properties = params
            if (!servicoInstance.hasErrors() && servicoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'servico.label', default: 'Servico'), servicoInstance.id])}"
                redirect(action: "show", id: servicoInstance.id)
            }
            else {
                render(view: "edit", model: [servicoInstance: servicoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'servico.label', default: 'Servico'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def servicoInstance = Servico.get(params.id)
        if (servicoInstance) {
            try {
                servicoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'servico.label', default: 'Servico'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'servico.label', default: 'Servico'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'servico.label', default: 'Servico'), params.id])}"
            redirect(action: "list")
        }
    }
}
