package centercarservice.financeiro

class CartaoDeCreditoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cartaoDeCreditoInstanceList: CartaoDeCredito.list(params), cartaoDeCreditoInstanceTotal: CartaoDeCredito.count()]
    }

    def create = {
        def cartaoDeCreditoInstance = new CartaoDeCredito()
        cartaoDeCreditoInstance.properties = params
        return [cartaoDeCreditoInstance: cartaoDeCreditoInstance]
    }

    def save = {
        def cartaoDeCreditoInstance = new CartaoDeCredito(params)
        if (cartaoDeCreditoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito'), cartaoDeCreditoInstance.id])}"
            redirect(action: "show", id: cartaoDeCreditoInstance.id)
        }
        else {
            render(view: "create", model: [cartaoDeCreditoInstance: cartaoDeCreditoInstance])
        }
    }

    def show = {
        def cartaoDeCreditoInstance = CartaoDeCredito.get(params.id)
        if (!cartaoDeCreditoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cartaoDeCreditoInstance: cartaoDeCreditoInstance]
        }
    }

    def edit = {
        def cartaoDeCreditoInstance = CartaoDeCredito.get(params.id)
        if (!cartaoDeCreditoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cartaoDeCreditoInstance: cartaoDeCreditoInstance]
        }
    }

    def update = {
        def cartaoDeCreditoInstance = CartaoDeCredito.get(params.id)
        if (cartaoDeCreditoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cartaoDeCreditoInstance.version > version) {
                    
                    cartaoDeCreditoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito')] as Object[], "Another user has updated this CartaoDeCredito while you were editing")
                    render(view: "edit", model: [cartaoDeCreditoInstance: cartaoDeCreditoInstance])
                    return
                }
            }
            cartaoDeCreditoInstance.properties = params
            if (!cartaoDeCreditoInstance.hasErrors() && cartaoDeCreditoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito'), cartaoDeCreditoInstance.id])}"
                redirect(action: "show", id: cartaoDeCreditoInstance.id)
            }
            else {
                render(view: "edit", model: [cartaoDeCreditoInstance: cartaoDeCreditoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cartaoDeCreditoInstance = CartaoDeCredito.get(params.id)
        if (cartaoDeCreditoInstance) {
            try {
                cartaoDeCreditoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito'), params.id])}"
            redirect(action: "list")
        }
    }
}
