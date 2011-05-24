package centercarservice.financeiro

class ChequeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [chequeInstanceList: Cheque.list(params), chequeInstanceTotal: Cheque.count()]
    }

    def create = {
        def chequeInstance = new Cheque()
        chequeInstance.properties = params
        return [chequeInstance: chequeInstance]
    }

    def save = {
        def chequeInstance = new Cheque(params)
        if (chequeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cheque.label', default: 'Cheque'), chequeInstance.id])}"
            redirect(action: "show", id: chequeInstance.id)
        }
        else {
            render(view: "create", model: [chequeInstance: chequeInstance])
        }
    }

    def show = {
        def chequeInstance = Cheque.get(params.id)
        if (!chequeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cheque.label', default: 'Cheque'), params.id])}"
            redirect(action: "list")
        }
        else {
            [chequeInstance: chequeInstance]
        }
    }

    def edit = {
        def chequeInstance = Cheque.get(params.id)
        if (!chequeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cheque.label', default: 'Cheque'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [chequeInstance: chequeInstance]
        }
    }

    def update = {
        def chequeInstance = Cheque.get(params.id)
        if (chequeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (chequeInstance.version > version) {
                    
                    chequeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cheque.label', default: 'Cheque')] as Object[], "Another user has updated this Cheque while you were editing")
                    render(view: "edit", model: [chequeInstance: chequeInstance])
                    return
                }
            }
            chequeInstance.properties = params
            if (!chequeInstance.hasErrors() && chequeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'cheque.label', default: 'Cheque'), chequeInstance.id])}"
                redirect(action: "show", id: chequeInstance.id)
            }
            else {
                render(view: "edit", model: [chequeInstance: chequeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cheque.label', default: 'Cheque'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def chequeInstance = Cheque.get(params.id)
        if (chequeInstance) {
            try {
                chequeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cheque.label', default: 'Cheque'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cheque.label', default: 'Cheque'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cheque.label', default: 'Cheque'), params.id])}"
            redirect(action: "list")
        }
    }
}
